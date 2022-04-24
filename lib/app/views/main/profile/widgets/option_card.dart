import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Text text;
  const OptionCard({Key? key, required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text,
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              )
            ],
          ),
        ),
      ),
      elevation: 6,
      shadowColor: const Color.fromRGBO(255, 255, 255, 50),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 1)),
    );
  }
}