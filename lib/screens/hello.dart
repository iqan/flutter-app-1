import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          'Hello world!',
          style: TextStyle(fontSize: 36.0, color: Colors.blue),
        ),
      ),
    );
  }
}
