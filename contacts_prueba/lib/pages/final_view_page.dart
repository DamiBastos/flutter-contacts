import 'package:contacts_prueba/components/footbar_component.dart';
import 'package:contacts_prueba/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

class FinalViewPage extends StatefulWidget {
  static const String name = 'QrScreen';
  final Map<String, dynamic>? params;

  const FinalViewPage({super.key, this.params});

  @override
  State<FinalViewPage> createState() => _FinalViewPageState();
}

class _FinalViewPageState extends State<FinalViewPage> {
  final Color _standardColor = const Color.fromRGBO(124, 101, 255, 1);
  final Uri _url = Uri.parse('https://www.neivor.com');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 243, 242, 245),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        mini: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'X',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: _standardColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.logo_dev_outlined),
                                  Text('Neivor'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.params?["name"] ?? '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(UniconsLine.building),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Torrel - 101'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(UniconsLine.user),
                                  ),
                                  Text('Manuel Sanchez')
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  'Francisco Javier Clavijero 51, CDMX, México'),
                            ),
                            QrImage(
                              data: '${widget.params}',
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Entrada: '),
                                  Text(widget.params!['date'])
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(UniconsLine.clock),
                                  Text(
                                      'Expira: ${widget.params!['date']} - 18:30')
                                ],
                              ),
                            ),
                            const Text('¿Quiere saber más sobre Neivor?'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                onTap: _launchUrl,
                                child: TextButton(
                                    onPressed: null,
                                    child: Text(
                                      'www.Neivor.com',
                                      style: TextStyle(
                                          color: _standardColor,
                                          decoration: TextDecoration.underline),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: footBar(context, 'Whatsapp', const HomePage()),
      ),
    );
  }
}
