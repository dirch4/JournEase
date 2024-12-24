import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/core/components/button.dart';

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
          Positioned(
            top: -40,
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
            bottom: -50,
            right: -30,
            child: Transform.rotate(
              angle: 160,
              child: Image.asset(
                'assets/iconbg1.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 500,
              width: 400,
              decoration: BoxDecoration(
                  color: Appcolors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Tambah Jurnal",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Judul : "),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan judul',
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text("Ceritakan Harimu : "),
                        const SizedBox(height: 5.0),
                        TextField(
                          maxLines: 7,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Ceritakan pengalaman hari ini',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  DynamicButton(
                    text: "Tambahkan",
                    backgroundColor: Appcolors.primary,
                    textColor: Colors.black,
                    borderRadius: 8.0,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 110.0,
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
