import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';

class Addjournal extends StatelessWidget {
  const Addjournal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparan
        elevation: 0, // Hilangkan bayangan
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black, // Warna ikon back
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Appcolors.primary,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 550,
              width: 400,
              decoration: BoxDecoration(
                  color: Appcolors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: [
                  const SizedBox(height: 20.0,),
                  Text("Tambah Jurnal", style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Judul : "),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                        Text("Ceritakan Harimu : "),
                        const SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 80,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black, width: 1),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 20.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Tambahkan",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
        ],
      ),
    );
  }
}
