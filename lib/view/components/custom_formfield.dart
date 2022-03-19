import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? hint;
  final Icon? icon;

  // ignore: use_key_in_widget_constructors
  const CustomFormField({Key? key, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint ?? ' ',
        prefixIcon: icon ?? Icon(Icons.email),
      ),
    );
  }
}
