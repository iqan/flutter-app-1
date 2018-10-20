import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/tabbed/tabbed.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App 1',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Tabbed(),
    );
  }
}
