import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  final Icon? icon;
  final String? text;
  final Function? onTap;
  final double? iconSize;
  final Color? color;

  const CustomContainer(
      {Key? key,
      this.icon,
      this.text,
      this.onTap,
      this.iconSize,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.only(left: 2),
              height: 13,
              width: 22,
              child: icon ??
                  Icon(
                    Icons.language,
                    size: iconSize ?? 28,
                    color: Colors.black,
                  ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text ?? 'Language',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: color ?? Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
