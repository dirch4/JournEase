import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/home.dart';
import 'package:jurnease/pages/loginpage.dart';
import 'package:jurnease/core/components/button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Appcolors.primary,
          ),
          Positioned(
            top: 10,
            left: 30,
              child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Appcolors.secondary,
                shape: BoxShape.circle
              ),
          )),
          Positioned(
            top: 70,
            left: 80,
              child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Appcolors.tertiary,
                shape: BoxShape.circle
              ),
          )),
          Positioned(
            top: 10,
            left: 90,
              child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                color: Appcolors.secondary,
                shape: BoxShape.circle
              ),
          )),
          Positioned(
            bottom: 180,
            right: 80,
              child: Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                color: Appcolors.tertiary,
                shape: BoxShape.circle
              ),
          )),
          Positioned(
            bottom: 280,
            right: 30,
              child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: Appcolors.secondary,
                shape: BoxShape.circle
              ),
          )),
          Positioned(
            bottom: 30, 
            left: -40, 
            child: Transform.rotate(
              angle: -0.10, 
              child: Image.asset(
                'assets/iconbg1.png',
                width: 300, 
                height: 300,
              ),
            ),
          ),

         
          Positioned(
            top: -50, 
            right: 30, 
            child: Transform.rotate(
              angle: 160, 
              child: Image.asset(
                'assets/iconbg1.png',
                width: 200, 
                height: 200,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 43.0, top: 130.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Kesadaran\nmembuat suatu hal\nmenjadi lebih mudah",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Berlatihlah meditasi dan buatlah jurnal\nuntuk bersantai dan menghilangkan\nstress",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            
          ),
          Positioned(
            bottom: 40,
            left: 80,
            child: DynamicButton(
              text: "Ayo Mulai!",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderSide: BorderSide(color: Colors.black, width: 1),
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              borderRadius: 8.0,
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),    
        ],
      ),
    );
  }
}
