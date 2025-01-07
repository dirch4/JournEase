import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/signin.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';
import 'package:jurnease/core/components/textfield.dart';
import 'package:jurnease/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: Appcolors.primary,
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Center(
                    child: Text(
                      'JournEase',
                      style: AppFonts.heading1,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Email Input
                  Text(
                    "Email : ",
                    style: AppFonts.titleField,
                    textAlign: TextAlign.start,
                  ),
                  DynamicTextField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),

                  // Password Input 
                  Text(
                    "Password : ",
                    style: AppFonts.titleField,
                    textAlign: TextAlign.start,
                  ),
                  DynamicTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  Center(
                    child: DynamicButton(
                      text: "Masuk",
                      backgroundColor: Appcolors.primary,
                      textColor: Appcolors.black,
                      borderSide: const BorderSide(color: Colors.black, width: 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      borderRadius: 8.0,
                      onPressed: () async {
                        final authProvider = AuthProvider();
                    
                        // Ambil input dari pengguna
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                    
                        // Panggil fungsi login
                        final errorMessage = await authProvider.login(
                          email: email,
                          password: password,
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
                          MaterialPageRoute(builder: (context) =>  Home()),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign Up Prompt
                  Center(
                    child: Text(
                      'Belum memiliki akun JournEase?',
                      style: AppFonts.bodyText.copyWith(color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Daftar di sini',
                        style: AppFonts.bodyText.copyWith(
                          color: Appcolors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold
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
}
