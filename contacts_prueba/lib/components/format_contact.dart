import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:unicons/unicons.dart';

Widget FormatContact(_context, String _name) {
  return Container(
    width: MediaQuery.of(_context).size.width,
    height: 100,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: Card(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(124, 101, 255, 1),
                  child: Icon(UniconsLine.user),
                ),
              ),
              Container(
                width: MediaQuery.of(_context).size.width - 150,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    _name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 14,
              weight: 20,
            ),
          )
        ]),
      ),
    ),
  );
}

class ContactPage extends StatelessWidget {
  final Contact contact;
  ContactPage(this.contact);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(contact.displayName)),
      body: Center(
        child: Column(children: [
          Text('First name: ${contact.name.first}'),
          Text('Last name: ${contact.name.last}'),
          Text(
              'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
        ]),
      ));
}
