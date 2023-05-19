import 'package:contacts_prueba/components/appbar_component.dart';
import 'package:contacts_prueba/components/footbar_component.dart';
import 'package:contacts_prueba/components/format_card_contact.dart';
import 'package:contacts_prueba/components/contact_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'form_page.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});
  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  bool _readyContacts = true;
  final Color _standardColor = const Color.fromRGBO(124, 101, 255, 1);
  List<Contact>? _favorites;
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  List<Contact> _filterContacts = [];
  TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchContacts();
    _filterContacts = _contacts ?? [];
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  _runFilter(String enteredKeyword) {
    setState(() {
      _filterContacts = _contacts ?? [];
      if (enteredKeyword.isEmpty) {
        _filterContacts = _contacts ?? [];
      } else {
        _filterContacts = _contacts!
            .where((contact) => contact.displayName
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: appBarHome(context, 'Autorizar acceso'),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 219, 219, 219),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _readyContacts = !_readyContacts;
                            });
                          },
                          style: TextButton.styleFrom(
                            elevation: _readyContacts ? 8 : 0,
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width * 0.4),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            foregroundColor:
                                _readyContacts ? _standardColor : Colors.grey,
                            backgroundColor: _readyContacts
                                ? Colors.white
                                : const Color.fromARGB(255, 219, 219, 219),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Contactos'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _readyContacts = !_readyContacts;
                            });
                          },
                          style: TextButton.styleFrom(
                            elevation: !_readyContacts ? 8 : 0,
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width * 0.4),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            foregroundColor:
                                !_readyContacts ? _standardColor : Colors.grey,
                            backgroundColor: !_readyContacts
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('Favoritos'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: SizedBox(
                child: TextFormField(
                  controller: filterController,
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Buscar nombre',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)))),
                ),
              ),
            ),
            _readyContacts
                ? _body()
                : const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 100, horizontal: 10),
                    child: Center(
                        child: Text(
                      'No hay favoritos',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: footBar(context, 'Registrar visitante', const FormPage()),
      ),
    );
  }

  Widget _body() {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _filterContacts.isNotEmpty ? _filterContacts.length : 3,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () async {
              final fullContact =
                  await FlutterContacts.getContact(_contacts![i].id);
              if (!mounted) return;

              await crearPermiso(context, fullContact!);
            },
            child: formatCardContact(context, _contacts![i].displayName),
          );
        });
  }
}
