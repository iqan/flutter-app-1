import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/home/home.dart';

void main() => runApp(new Main());

class Main extends StatelessWidget {
  const Main({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iqan\'s App - Learning Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}
