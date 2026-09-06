import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class Playbuttonwidget extends StatelessWidget {
  const Playbuttonwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Icon(Icons.play_arrow, color: Colors.black, size: 40),
          10.width,
          Text(
            "Play",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
