import 'package:flutter/material.dart';

class CommonSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onMicTap;

  const CommonSearchField({
    super.key,
    this.controller,
    this.hintText = 'Search for a show, movie, genre, e.t.c.',
    this.onChanged,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3A),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),

          prefixIcon: const Icon(Icons.search, color: Colors.white70, size: 25),

          suffixIcon: IconButton(
            onPressed: onMicTap,
            icon: const Icon(Icons.mic, color: Colors.white70, size: 25),
          ),

          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
