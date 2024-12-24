import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final BorderSide? borderSide;
  final Icon? icon;

  const DynamicButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.borderRadius = 30.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    required this.onPressed,
    this.icon,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        side: borderSide,
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
