import 'package:flutter/material.dart';

class Textbuttonwidget extends StatelessWidget {
  final String buttonname;
  final void Function()? buttontap;
  const Textbuttonwidget({super.key, required this.buttonname, this.buttontap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.bodyMedium,
      ),
      onPressed: buttontap,
      child: Text(
        buttonname,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          wordSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
