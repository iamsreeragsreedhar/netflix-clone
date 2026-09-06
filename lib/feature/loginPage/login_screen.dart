import 'package:court_flix/core/extensions/sizedbox_extension.dart';
import 'package:court_flix/feature/loginPage/widgets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  List UserList = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset('assets/logo/nflogo.png', width: 230, height: 230),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white, size: 30),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserWidget(
                  name: 'assets/avatars/av1.jpg',
                  username: 'Emenalo',
                  tapped: () {
                    context.go('/home');
                  },
                ),
                20.width,
                UserWidget(
                  name: 'assets/avatars/av2.jpg',
                  username: 'Onyeka',
                  tapped: () {
                    context.go('/home');
                  },
                ),
              ],
            ),
            20.height,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserWidget(
                  name: 'assets/avatars/av3.jpg',
                  username: 'Thelma',
                  tapped: () {
                    context.go('/home');
                  },
                ),
                20.width,
                UserWidget(
                  name: 'assets/avatars/av4.jpg',
                  username: 'Kids',
                  tapped: () {
                    context.go('/home');
                  },
                ),
              ],
            ),
            20.height,

            Wrap(
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
                          child: const Icon(Icons.add, color: Colors.black, size: 50, weight: 700),
                        ),
                      ),
                    ),

                    20.height,
                    Text("Add Profile"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
