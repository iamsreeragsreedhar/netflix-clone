import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class Top100 extends StatelessWidget {
  final String trendingnumber;
  final String trendingplace;

  const Top100({super.key, required this.trendingnumber, required this.trendingplace});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TOP',
                style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold),
              ),
              Text(
                '10',
                style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        6.width,

        Text(
          '#$trendingnumber',
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),

        4.width,

        Text(
          'In $trendingplace',
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        4.width,

        const Text(
          'Today',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
