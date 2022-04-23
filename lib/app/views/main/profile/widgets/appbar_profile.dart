import 'package:flutter/material.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarProfile({Key? key}) : preferredSize = const Size.fromHeight(100), super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(
          top: 30,
          right: 30,
          left: 30
        ),
        color: const Color(0xffff8a00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Profilku",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        ),
      )
    );
  }
}