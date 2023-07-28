import 'package:flutter/material.dart';
class MyRow extends StatelessWidget {
  final String title , value;
  const MyRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
          Text(value,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}

