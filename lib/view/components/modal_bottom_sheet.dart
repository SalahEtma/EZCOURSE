import 'package:course_app/view/components/custom_formfield.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomFormField(
        hint: 'name of the course...',
      ),
      CustomFormField(
        hint: 'Course description...',
      ),
      ElevatedButton(
        onPressed: () {},
        child: Text('add course'),
      )
    ]);
  }
}
