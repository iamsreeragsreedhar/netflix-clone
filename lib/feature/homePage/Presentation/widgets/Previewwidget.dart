import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class sectionwidget extends StatelessWidget {
  final String image;
  const sectionwidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 102,
          width: 102,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.network(image, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
