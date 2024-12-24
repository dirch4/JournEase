import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/loginpage.dart';
import 'package:jurnease/core/components/button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    'JournEase',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Username Input
                  _buildTextField('Username', false),
                  const SizedBox(height: 20),

                  // Password Input
                  _buildTextField('Password', true),
                  const SizedBox(height: 20),

                  // Confirm Password Input
                  _buildTextField('Konfirmasi Password', true),
                  const SizedBox(height: 30),

                  // Register Button
                  DynamicButton(
                    text: "Daftar",
                    backgroundColor: Appcolors.primary,
                    textColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15,
                    ),
                    borderRadius: 30.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // Already Have Account Text
                  Text(
                    'Sudah memiliki akun JournEase?',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),

                  // Login Prompt
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Appcolors.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField Builder
  Widget _buildTextField(String labelText, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.black54),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
