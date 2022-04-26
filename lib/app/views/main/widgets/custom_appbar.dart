import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String text;
  final bool child;
  const CustomAppbar({Key? key, required this.text, required this.child})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    GestureDetector leading = GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 25,
      ),
    );

    Text title = Text(
      text,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    );

    Container dummy = Container(
      width: 25,
    );
    return AppBar(
      leading: Container(),
      flexibleSpace: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
        color: const Color(0xffff8a00),
        child: Center(
          child: 
            (child) ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading,
              title,
              dummy
            ],
          ): Center(child: title)
        ),
      ),
    );
  }
}
