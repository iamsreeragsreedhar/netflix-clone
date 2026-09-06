import 'package:flutter/material.dart';

class Icontextwidget extends StatelessWidget {
  final IconData icon;
  final String data;
  const Icontextwidget({super.key, required this.icon, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        Text(data, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
