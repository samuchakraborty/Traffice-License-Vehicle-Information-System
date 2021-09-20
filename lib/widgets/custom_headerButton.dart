import 'package:flutter/material.dart';

class IconButton2 extends StatelessWidget {
  IconButton2({this.label, this.onPressed, this.icon});

  final String? label;
  final Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style:
            ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label!,
        ));
  }
}
