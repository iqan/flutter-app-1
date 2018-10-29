import 'package:flutter/material.dart';
import 'package:flutter_app1/model/drawer-item.dart';
import 'package:flutter_app1/screens/hello.dart';
import 'package:flutter_app1/screens/tabbed/tabbed.dart';

class Home extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Hello World", Icons.home),
    new DrawerItem("Tabbed View", Icons.tab),
  ];

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedDrawerIndex = 0;

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Hello();
      case 1:
        return new Tabbed();
      default:
        return new Text("Invalid view selected");
    }
  }

  onSelectItem(int index) {
    setState(() => selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == selectedDrawerIndex,
        onTap: () => onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Flutter - ' +
            widget.drawerItems[selectedDrawerIndex].title),
      ),
      body: Material(child: getDrawerItemWidget(selectedDrawerIndex)),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Select a Demo',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/drawer-header.jpeg'),
                  fit: BoxFit.fill
                ),
              ),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
    );
  }
}
