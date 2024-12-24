import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/core/components/button.dart';
import 'login.dart';
import 'signin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Welcome Text
                Text(
                  'Selamat Datang di\nJournEase',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Illustrations
                Image.asset(
                  'assets/illustration1.png',
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/illustration2.png',
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 30),

                // Sign Up Button
                DynamicButton(
                  text: 'Daftar',
                  backgroundColor: Appcolors.primary,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Already have an account? Text
                Text(
                  'Apakah Anda sudah memiliki akun?',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Login Button
                DynamicButton(
                  text: 'Masuk',
                  backgroundColor: Colors.white,
                  textColor: Appcolors.primary,
                  borderSide: BorderSide(color: Appcolors.primary),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
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
