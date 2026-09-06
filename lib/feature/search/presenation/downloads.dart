import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:court_flix/core/shared%20widget/common_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class downloadScreen extends StatelessWidget {
  const downloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonBottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          print(index);
          switch (index) {
            case 0:
              context.go('/home');
            case 1:
              context.go('/search');
            case 2:
              context.go('/coming-soon');
            case 3:
              context.go('/downloads');
            case 4:
              context.go('/more');

              break;
            default:
          }
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Smart Downloads",
                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w100),
              ),
              40.height,
              const Text(
                'Introducing Downloads For You',
                style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
              ),
              10.height,
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut '
                'felis non accumsan accumsan quis. Massa, id ut ipsum '
                'aliquam enim non posuere pulvinar diam.',
                style: TextStyle(color: Colors.white, fontSize: 12, height: 1.9),
              ),
              28.height,
              Center(
                child: Container(
                  width: 226,
                  height: 226,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF444444)),
                ),
              ),
              25.height,
              SizedBox(
                width: double.infinity,
                height: 51,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0878F9),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                  ),
                  child: const Text(
                    'SETUP',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              40.height,
              Center(
                child: SizedBox(
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A4A4A),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    ),
                    child: const Text(
                      'Find Something to Download',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
