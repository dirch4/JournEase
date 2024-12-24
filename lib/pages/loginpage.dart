import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/login.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';
import 'signin.dart';

class LoginBoarding extends StatelessWidget {
  const LoginBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome Text
                Text(
                  'Selamat Datang di\nJournEase',
                  textAlign: TextAlign.center,
                  style: AppFonts.heading1, // Use dynamic font
                ),
                const SizedBox(height: 30),

                // Illustrations
                Image.asset(
                  'assets/illustration1.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/illustration2.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                DynamicButton(
                  text: 'Daftar',
                  backgroundColor: Appcolors.primary,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Already have an account? Text
                Text(
                  'Apakah Anda sudah memiliki akun?',
                  style: AppFonts.bodyText
                      .copyWith(color: Colors.black54), // Use dynamic font
                ),
                const SizedBox(height: 10),

                // Login Button
                DynamicButton(
                  text: 'Masuk',
                  backgroundColor: Colors.white,
                  textColor: Appcolors.primary,
                  borderSide: const BorderSide(color: Appcolors.primary),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
