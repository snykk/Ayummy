import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/app/constants/palettes.dart';

import '../../../../constants/ratio.dart';

class CustomInput extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final String placeholder;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  const CustomInput(
      {Key? key,
      required this.title,
      required this.keyboardType,
      required this.placeholder,
      this.inputFormatters,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Ratio(context).widthApp * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            keyboardType: keyboardType,
            obscureText: false,
            enableSuggestions: false,
            autocorrect: false,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 15),
              suffixIcon: const Icon(
                Icons.edit,
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
              hintText: placeholder,
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
