import 'package:flutter/material.dart';

Widget AppBarHome(String textTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: FloatingActionButton(
            mini: true,
            elevation: 0,
            onPressed: null,
            foregroundColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 240, 240, 240),
            child: Icon(Icons.arrow_back)),
      ),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textTitle,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const InkWell(
              child: Text(
                'Ver favoritos',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(124, 101, 255, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
