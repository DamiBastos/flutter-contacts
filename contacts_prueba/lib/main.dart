import 'package:flutter/material.dart';
import 'package:contacts_prueba/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => const MaterialApp(
      debugShowCheckedModeBanner: false, home: Scaffold(body: HomePage()));
}
