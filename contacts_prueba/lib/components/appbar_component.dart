import 'package:contacts_prueba/pages/detail_page.dart';
import 'package:flutter/material.dart';
import '../pages/select_contact_page.dart';

Widget AppBarHome(_context, String _textTitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            mini: true,
            elevation: 0,
            onPressed: () {
              Navigator.of(_context).pop();
            },
            child: Icon(Icons.arrow_back),
            foregroundColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 240, 240, 240)),
      ),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _textTitle,
              style: TextStyle(
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
