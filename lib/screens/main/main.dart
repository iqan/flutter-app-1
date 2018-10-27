import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/main/drawer.dart';
import 'package:flutter_app1/screens/tabbed/tabbed.dart';

class Main extends StatefulWidget {
  @override
  MainState createState() {
    return new MainState();
  }
}

class MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Learning Flutter App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('Learning Flutter App'),
        ),
        body: new Material(
          child: Tabbed(),
        ),
        drawer: MyDrawer()
      ),
    );
  }
}
