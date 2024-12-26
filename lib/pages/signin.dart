import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/login.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';
import 'package:jurnease/core/components/textfield.dart';
import 'package:jurnease/providers/auth_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: Appcolors.secondary,
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
                    style: AppFonts.heading1,
                  ),
                  const SizedBox(height: 40),

                  // Email Input
                  DynamicTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),

                  // Password Input
                  DynamicTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password Input
                  DynamicTextField(
                    hintText: 'Konfirmasi Password',
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 30),

                  // Register Button
                  DynamicButton(
                    text: "Daftar",
                    backgroundColor: Appcolors.primary,
                    textColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    borderRadius: 30.0,
                    onPressed: () async {
                      final authProvider = AuthProvider();

                      // Ambil input dari pengguna
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      final confirmPassword = confirmPasswordController.text.trim();

                      // Panggil fungsi register
                      final errorMessage = await authProvider.register(
                        email: email,
                        password: password,
                        confirmPassword: confirmPassword,
                      );

                      if (errorMessage != null) {
                        // Tampilkan pesan error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage)),
                        );
                        return;
                      }

                      // Pindah ke halaman Home jika sukses
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // Already Have Account Text
                  Text(
                    'Sudah memiliki akun JournEase?',
                    style: AppFonts.bodyText,
                  ),

                  // Login Prompt
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: AppFonts.bodyText.copyWith(
                        color: Appcolors.primary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
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
}
