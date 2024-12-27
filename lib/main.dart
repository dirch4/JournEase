import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/loginpage.dart';
import 'package:jurnease/pages/splashscreen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("id_ID", null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => JournalProvider()),
        
    //   ],
    //   child:
    //
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Splash screen saat menunggu status auth
              return const Splashscreen();
            }
            if (snapshot.hasData) {
              // Jika user sudah login, arahkan ke Home
              return Home();
            }
            // Jika belum login, arahkan ke halaman Login
            return const Splashscreen();
          },
        ),
      // ),
    );
  }
}
