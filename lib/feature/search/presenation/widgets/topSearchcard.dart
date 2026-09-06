import 'package:court_flix/core/repository/api_constants.dart';
import 'package:flutter/material.dart';

class Topsearchcard extends StatelessWidget {
  final String title;
  final String networkimage;
  final VoidCallback? onpressed;
  const Topsearchcard({super.key, required this.title, required this.networkimage, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3A),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            width: 175,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: NetworkImage('${ApiConstants.imageBaseUrl}$networkimage'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: onpressed,
            icon: const Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}
