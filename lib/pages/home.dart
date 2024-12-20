import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/addjournal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          "Selamat Datang!",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "Apa niat kamu untuk hari ini?",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: -30.0,
                    child: Transform.rotate(
                      angle: -0.10,
                      child: Image.asset(
                        'assets/leaf2.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 30),
          // button tambah jurnal
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Addjournal()),
                );
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              label: Text(
                'Ceritain Yuk',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
            ),
          ),

          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Journaling Kamu",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )),
              // Container(
              //     margin: EdgeInsets.only(right: 20.0),
              //     child: Text("Paling Baru")
              // )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 50, // Lebar kotak
                    height: 50, // Tinggi kotak
                    decoration: BoxDecoration(
                      color: Appcolors.secondary, // Warna background kotak
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Icon(
                      Icons.star, // Icon di dalam kotak
                      color: Colors.white,
                    ),
                  ),
                  title: Text("Hari Paling Bahagia!",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("17 Desember 2024"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
