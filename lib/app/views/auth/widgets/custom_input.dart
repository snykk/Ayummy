import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/app/constants/palettes.dart';

class CustomInput extends StatelessWidget {
  final TextInputType keyboardType;
  final String text;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final IconData customIconData;
  final TextEditingController controller;

  const CustomInput(
      {Key? key,
      required this.keyboardType,
      required this.text,
      required this.obscureText,
      this.inputFormatters,
      required this.customIconData,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        prefixIcon: Icon(
          customIconData,
          color: MyPalettes.appGrey,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: MyPalettes.appGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: MyPalettes.appGrey,
          ),
        ),
        hintText: text,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
