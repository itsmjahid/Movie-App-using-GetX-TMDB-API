import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SectionDividerTitle extends StatelessWidget {
   SectionDividerTitle({
    Key? key,
    this.text,
  }) : super(key: key);
String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!.toUpperCase(),
      style: TextStyle(color:Colors.black,fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}