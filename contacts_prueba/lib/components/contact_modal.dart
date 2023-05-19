import 'package:contacts_prueba/pages/form_page.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

Future crearPermiso(BuildContext context, contactId) {
  return showModalBottomSheet(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
              child: Center(
                child: Column(
                  children: [
                    const Icon(UniconsLine.user_plus, size: 50),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Crear un permiso para: ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            'Nombre: ${contactId.displayName}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Número: ${contactId.phones.isNotEmpty ? contactId.phones.first.number : '(none)'}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FormPage()));
                        },
                        child: const Text('Crear permiso'),
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
                          child: const Text('Cancelar')),
                    )
                  ],
                ),
              ),
            ));
      });
}
