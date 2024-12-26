import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/loginpage.dart';
import 'package:jurnease/pages/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
            // Tambahkan ini untuk menangani splash screen saat aplikasi menunggu status auth
            return const Splashscreen();
          }
          if (snapshot.hasData) {
            return const Home();
          }
          return const Splashscreen();
          }
      ) 
      
    );
  }
}
