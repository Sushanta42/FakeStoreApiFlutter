import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String title;
  const BoldText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}