import 'package:flutter/material.dart';

Widget footBar(context, text, namePage) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
          style: TextButton.styleFrom(
              fixedSize:
                  Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
              backgroundColor: const Color.fromRGBO(124, 101, 255, 1),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => namePage));
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )),
    ),
  );
}
