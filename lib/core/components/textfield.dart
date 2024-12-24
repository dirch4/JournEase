import 'package:flutter/material.dart';
import 'package:jurnease/core/components/font.dart';

class DynamicTextField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final int maxLines;
  final Color fillColor;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const DynamicTextField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.maxLines = 1,
    this.fillColor = Colors.white,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppFonts.bodyText,
      ),
    );
  }
}
