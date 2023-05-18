import 'dart:convert';
import 'package:contacts_prueba/components/appbar_component.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:contacts_prueba/pages/final_view_page.dart';
import 'package:unicons/unicons.dart';

class ConfirmPage extends StatefulWidget {
  final Map<String, dynamic>? params;
  final String? name;
  final String? date;
  final bool? value;
  final String? instructions;

  const ConfirmPage(
      {super.key,
      this.name,
      this.date,
      this.value,
      this.instructions,
      this.params});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  final Color _standardColor = const Color.fromRGBO(124, 101, 255, 1);
  final now = DateTime.now();
  String boton = 'Crear acceso';

  final dio = Dio();

  Future sendInfo(Map<String, dynamic> params) async {
    try {
      Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: jsonEncode(params),
      );
      if (response.statusCode == 201) {
        boton = 'Acceso creado';
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FinalViewPage(params: widget.params!)));
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.statusCode);
      } else {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 248, 245, 245),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarHome(context, 'Detalle de la visita'),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        color: const Color.fromRGBO(244, 243, 254, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Visita',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Nombre:',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text(widget.name!),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Tipo de visita: ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${widget.value == true ? "Visita de varios días" : "Visita personal"}',
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: SizedBox(
                                              width: 165,
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                    iconColor: Colors.black,
                                                    shape: const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors.black,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30)))),
                                                onPressed: null,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 4,
                                                      horizontal: 4),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        'Añadir a favoritos',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 0,
                                                                horizontal: 0),
                                                        child: Icon(Icons
                                                            .star_border_outlined),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: const Color.fromRGBO(244, 243, 254, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Detalle',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Icon(
                                      UniconsLine.pen,
                                      color: _standardColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Residente que autoriza:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('Manuel Sanchez')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Fecha de creación: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              '${now.day}-${now.month.toString().length < 2 ? '0${now.month}' : {
                                                  now.month
                                                }}-${now.year}')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Día de entrada: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            widget.date!,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Instrucciones al personal:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(widget.instructions!),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ],
        ),
      )),
      bottomSheet: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: TextButton(
              style: TextButton.styleFrom(
                  fixedSize:
                      Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
                  backgroundColor: Color.fromRGBO(124, 101, 255, 1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              onPressed: () => {
                    sendInfo(widget?.params ?? {}),
                  },
              child: Text(boton,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
