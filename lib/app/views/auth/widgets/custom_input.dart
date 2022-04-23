import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required TextInputType keyboardType,
    required String text,
    required bool obscureText,
    required List<TextInputFormatter>? inputFormatters,
    required IconData customIconData,
  }) : _keyboardType = keyboardType, _text = text, _obscureText = obscureText, _inputFormatters = inputFormatters, _customIconData = customIconData, super(key: key);

  final TextInputType _keyboardType;
  final String _text;
  final bool _obscureText;
  final List<TextInputFormatter>? _inputFormatters;
  final IconData _customIconData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: _keyboardType,
      obscureText: _obscureText,
      enableSuggestions: false,
      autocorrect: false,
      inputFormatters: _inputFormatters,
      
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        prefixIcon: Icon(
          _customIconData,
          color: const Color(0xff626663),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff626663),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff626663),
          ),
        ),
        hintText: _text,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}