import 'package:flutter/material.dart';
class MyRow extends StatelessWidget {
  final String title , value;
  const MyRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
      Text(value),
      ],
    );
  }
}

