import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareDemo extends StatelessWidget {
  final basePath = 'lib/assets/flares/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Stack(
        children: <Widget>[
          new FlareActor(
            basePath + 'Sushi.flr',
            animation: 'Sushi Bounce',
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
          new FlareActor(
            basePath + 'i-1.flr',
            animation: 'iqan',
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
          new SizedBox(
            child: new FlareActor(
              basePath + 'Pizza Slice.flr',
              animation: 'Pizza Bounce',
              fit: BoxFit.contain,
              alignment: Alignment.topLeft,
            ),
            width: 100,
          ),
        ],
        alignment: Alignment.center,
      ),
    );
  }
}
