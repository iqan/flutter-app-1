import 'package:flutter/material.dart';

class Restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/restaurant.jpg'),
            fit: BoxFit.fill
          )
      )
    );
  }
}