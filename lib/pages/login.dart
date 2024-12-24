import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/signin.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Appcolors.primary,
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
                    style: AppFonts.heading1, // Use dynamic font
                  ),
                  const SizedBox(height: 40),

                  // Username Input
                  _buildTextField('Username', false),
                  const SizedBox(height: 20),

                  // Password Input
                  _buildTextField('Password', true),
                  const SizedBox(height: 20),

                  // Login Button
                  DynamicButton(
                    text: "Masuk",
                    backgroundColor: Appcolors.primary,
                    textColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
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

                  // Sign Up Prompt
                  Text(
                    'Belum memiliki akun JournEase?',
                    style: AppFonts.bodyText
                        .copyWith(color: Colors.black), // Use dynamic font
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                      );
                    },
                    child: Text(
                      'Daftar di sini',
                      style: AppFonts.bodyText.copyWith(
                        color: Appcolors.primary,
                        decoration: TextDecoration.underline,
                      ), // Use dynamic font
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
        labelStyle: AppFonts.bodyText
            .copyWith(color: Colors.black54), // Use dynamic font
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
