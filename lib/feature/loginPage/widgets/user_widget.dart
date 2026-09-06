import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String name;
  final void Function()? tapped;
  final String username;
  const UserWidget({super.key, required this.name, this.tapped, required this.username});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 121,
            child: ClipRRect(borderRadius: BorderRadius.circular(18), child: Image.asset(name)),
          ),
          10.height,
          Text(username),
        ],
      ),
    );
  }
}
