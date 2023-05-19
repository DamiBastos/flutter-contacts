import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

Widget formatCardContact(context, String name) {
  return InkWell(
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Card(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Row(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(124, 101, 255, 1),
                    child: Icon(UniconsLine.user),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 14,
                weight: 20,
              ),
            )
          ]),
        ),
      ),
    ),
  );
}
