import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle heading1 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  static final TextStyle heading2 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );

  static final TextStyle bodyText = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );
}
