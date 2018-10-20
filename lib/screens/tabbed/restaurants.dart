import 'package:flutter/material.dart';

class Restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Image.network(
      'https://images.pexels.com/photos/6267/menu-restaurant-vintage-table.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      fit: BoxFit.fill,
    );
  }

}