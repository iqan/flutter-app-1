import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/tabbed/food.dart';
import 'package:flutter_app1/screens/tabbed/restaurants.dart';
import 'package:flutter_app1/screens/tabbed/settings.dart';

class Tabbed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.fastfood)),
                Tab(icon: Icon(Icons.restaurant)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              new Food(),
              new Restaurants(),
              new Settings(),
            ],
          ),
        ),
    );
  }

}