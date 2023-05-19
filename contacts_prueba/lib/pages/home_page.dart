import 'package:contacts_prueba/components/home_appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:contacts_prueba/pages/select_contact_page.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import '../components/cards_home_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color standardColor = const Color.fromRGBO(124, 101, 255, 1);
  List<Contact>? contacts;
  bool permissionDenied = false;

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => permissionDenied = true);
    } else {
      final getContacts = await FlutterContacts.getContacts();
      setState(() => contacts = getContacts);
      if (!mounted) return;
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          context: context,
          builder: (_) {
            return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Icon(UniconsLine.user_exclamation, size: 50),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sincroniza tus contactos',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Text(
                          'Permite el acceso para invitar a tu lista de amigos y familiares a tu condominio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: standardColor,
                            foregroundColor: Colors.white,
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SelectContact()));
                        },
                        child: const Text('Permitir'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              fixedSize: Size.fromWidth(
                                  MediaQuery.of(context).size.width),
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Omitir')),
                    )
                  ],
                ));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: appBarHome('Autorizar acceso'),
              ),
              Column(
                children: [
                  cardHomeComponent(
                      context,
                      UniconsLine.user,
                      'Acceso a invitado personal',
                      'Registra a tus amigos, familia o conocidos',
                      _fetchContacts),
                  cardHomeComponent(
                      context,
                      Icons.cleaning_services,
                      'Acceso a personal del hogar',
                      'Registra una empleada doméstica, niñera u otros.',
                      null),
                  cardHomeComponent(
                      context,
                      Icons.build_circle_outlined,
                      'Acceso a proveedor / mantenimiento',
                      'Registra a proveedor de servicios del hogar o condominio',
                      null),
                  cardHomeComponent(
                      context,
                      UniconsLine.notes,
                      'Mi historial de visitas',
                      'Revisa los accesos que has autorizado',
                      null),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
