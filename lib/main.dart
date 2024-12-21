import 'package:flutter/material.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/onboarding.dart';
import 'package:jurnease/pages/splashscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
