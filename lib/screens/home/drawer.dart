import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/hello.dart';
import 'package:flutter_app1/screens/tabbed/tabbed.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Select Views',
              style: TextStyle(fontSize: 24.0),
            ),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Hello'),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Hello())  
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.tab),
            title: Text('Tabbed'),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => Tabbed())  
              );
            },
          ),
        ],
      ),
    );
  }
}
