import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:court_flix/core/shared%20widget/common_navbar.dart';
import 'package:court_flix/feature/loginPage/widgets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class moreScreen extends StatefulWidget {
  const moreScreen({super.key});

  @override
  State<moreScreen> createState() => _moreScreenState();
}

class _moreScreenState extends State<moreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            SingleChildScrollView(
              child: Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: UserWidget(
                      name: 'assets/avatars/av4.jpg',
                      username: 'Kids',
                      tapped: () {},
                    ),
                  ),
                  Expanded(
                    child: UserWidget(
                      name: 'assets/avatars/av1.jpg',
                      username: 'User1',
                      tapped: () {},
                    ),
                  ),
                  Expanded(
                    child: UserWidget(
                      name: 'assets/avatars/av2.jpg',
                      username: 'User2',
                      tapped: () {},
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 50,
                                    weight: 700,
                                  ),
                                ),
                              ),
                            ),

                            20.height,
                            Text("Add Profile"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            10.height,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, color: Colors.white, size: 17),
                SizedBox(width: 7),
                Text('Manage Profiles', style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
            20.height,
            Container(
              width: double.infinity,
              color: const Color(0xFF1C1C1C),
              padding: const EdgeInsets.fromLTRB(20, 24, 12, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.chat_sharp, color: Colors.white, size: 29),
                      7.width,
                      Text(
                        'Tell friends about Netflix.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  10.height,
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut '
                    'felis non accumsan accumsan quis. Massa, id ut ipsum '
                    'aliquam enim non posuere pulvinar diam.',
                    style: TextStyle(color: Colors.white, fontSize: 12, height: 1.8),
                  ),
                  10.height,
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  17.height,
                  Row(children: [
                        
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
