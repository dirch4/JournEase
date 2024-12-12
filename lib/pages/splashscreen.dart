import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 6),
      () => Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context) => Onboarding()
          )
        ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Appcolors.primary,
            child: Center(
              child: Text(
                "JournEase",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Positioned(
            top: -50, // Adjust to position it slightly outside the screen
            left: -50, // Adjust to position it slightly outside the screen
            child: Container(
              width: 200, // Diameter of the circle
              height: 200, // Diameter of the circle
              decoration: BoxDecoration(
                color: Appcolors.secondary, // Semi-transparent circle
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -50, // Adjust to position it slightly outside the screen
            right: -50, // Adjust to position it slightly outside the screen
            child: Container(
              width: 200, // Diameter of the circle
              height: 200, // Diameter of the circle
              decoration: BoxDecoration(
                color: Appcolors.secondary, // Semi-transparent circle
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
