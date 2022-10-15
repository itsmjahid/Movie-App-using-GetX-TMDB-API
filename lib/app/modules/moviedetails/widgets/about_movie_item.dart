import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AboutMovieItem extends StatelessWidget {
  AboutMovieItem({Key? key, required this.itemName, required this.itemValue})
      : super(key: key);
  final String? itemName;
  final dynamic itemValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemName! + ":",
            style: TextStyle(fontSize: 14.0, color: Colors.black)),
        Text('\$' + NumberFormat.compact().format(itemValue),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ))
      ],
    );
  }
}
