import 'package:contacts_prueba/components/appbar_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'confirm_page.dart';

class DetailContactPage extends StatefulWidget {
  final dynamic context;
  final String? id;
  final String? name;

  const DetailContactPage({
    super.key,
    this.context,
    this.id,
    this.name,
  });

  @override
  State<DetailContactPage> createState() => _DetailContactPageState();
}

class _DetailContactPageState extends State<DetailContactPage> {
  final Color _standardColor = const Color.fromRGBO(124, 101, 255, 1);
  bool _value = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();

  Map<String, dynamic> form = {};
  setvalues() {
    form["name"] = nameController.text;
    form['switch'] = _value;
    form['date'] = dateController.text;
    form['instructions'] = instructionsController.text;
  }

  @override
  void initState() {
    // TODO: implement initState
    dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          child: Column(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [AppBarHome(context, 'Detalle de la visita')]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    'Nombre completo',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, left: 10, right: 10, bottom: 4),
                  child: SizedBox(
                    child: TextFormField(
                      style: const TextStyle(),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Text(nameController.text),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Visita de varios días',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      CupertinoSwitch(
                          value: _value,
                          activeColor: _standardColor,
                          onChanged: (value) {
                            setState(() {
                              _value = !_value;
                              print(form);
                            });
                          }),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Text(
                    'Dia de la visita',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: TextField(
                    controller: dateController,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon:
                            Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                        ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          dateController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      }
                    },
                  )),
                ),

                //Text(dateController.text),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Instrucciones al personal ',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const Text('(Opcional)')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      child: TextFormField(
                    controller: instructionsController,
                    minLines: 6,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: const TextStyle(),
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  )),
                )
              ],
            ),
            Text(instructionsController.text),
          ]),
        ),
      )),
      bottomSheet: Container(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: TextButton(
              style: TextButton.styleFrom(
                  fixedSize:
                      Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
                  backgroundColor: Color.fromRGBO(124, 101, 255, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              onPressed: () {
                setvalues();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ConfirmPage(
                      name: nameController.text,
                      date: dateController.text,
                      value: _value,
                      instructions: instructionsController.text,
                      params: form),
                ));
              },
              child: Text('Continuar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }

  Future _seleccionarFecha() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        dateController.text =
            formattedDate; //set output date to TextField value.
      });
    }
  }
}
