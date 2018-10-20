import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CSWidgetStyle brightnessStyle = const CSWidgetStyle(
        icon: const Icon(Icons.brightness_medium, color: Colors.black54));

    return new CupertinoSettings(<Widget>[
      new CSHeader('Brightness'),
      new CSWidget(new CupertinoSlider(value: 0.5), style: brightnessStyle),
      new CSControl(
        'Auto brightness',
        new CupertinoSwitch(value: true),
        style: brightnessStyle,
      ),
      new CSHeader('Selection'),
      new CSSelection(['Day mode', 'Night mode'], (index) {
        print(index);
      }, currentSelection: 0),
      new CSHeader(),
      new CSControl('Loading...', new CupertinoActivityIndicator()),
      new CSButton(CSButtonType.DEFAULT, "Licenses", () {
        print("Some text about licenses!");
      }),
      new CSHeader(),
      new CSButton(CSButtonType.DESTRUCTIVE, "Delete all data", () {})
    ]);
  }
}
