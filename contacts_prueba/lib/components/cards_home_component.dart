import 'package:flutter/material.dart';

Color standardColor = const Color.fromRGBO(124, 101, 255, 1);

Widget cardHomeComponent(BuildContext context, IconData iconName, String title,
    String subtitle, function) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromARGB(255, 215, 215, 215)),
            borderRadius: BorderRadius.circular(20)),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            hoverColor: const Color.fromARGB(255, 214, 205, 235),
            onTap: function,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(iconName),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.left),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
  );
}
