import 'package:flutter/material.dart';

class IconBuilder extends StatelessWidget {
  final Color? backgroundColor;
  final Icon? icon;

  const IconBuilder({Key? key, this.backgroundColor, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? Colors.red,
      child: icon ?? Icon(Icons.lock),
      radius: 16,
    );
  }
}
