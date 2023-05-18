import 'package:flutter/material.dart';

Widget FootBar(_context, _text, _namePage) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size.fromWidth(MediaQuery.of(_context).size.width * 0.9),
              backgroundColor: Color.fromRGBO(124, 101, 255, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
          onPressed: () {
            Navigator.of(_context)
                .push(MaterialPageRoute(builder: (context) => _namePage));
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              _text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )),
    ),
  );
}
