import 'package:flutter/material.dart';

Widget appBarHome(context, String textTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            mini: true,
            elevation: 0,
            onPressed: () {
              Navigator.of(context).pop();
            },
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 240, 240, 240),
            child: const Icon(Icons.arrow_back)),
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
          ],
        ),
      ),
    ],
  );
}
