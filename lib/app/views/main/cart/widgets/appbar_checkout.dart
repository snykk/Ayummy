import 'package:flutter/material.dart';
import 'package:project/app/constants/palettes.dart';

class AppBarCheckout extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCheckout({Key? key})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
      color: MyPalettes.appOrange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Menu di Pesan",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          // SizedBox(width: 30)
        ],
      ),
    ));
  }
}
