import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';
import 'package:jurnease/core/components/icon.dart';
import 'package:jurnease/core/components/textfield.dart';

class Addjournal extends StatelessWidget {
  const Addjournal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppIcon(
          icon: Icons.arrow_back, // Ikon back
          color: Colors.black,
          size: 24,
          onPressed: () {
            Navigator.pop(context); // Aksi kembali
          },
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
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Tambah Jurnal",
                    style: AppFonts.heading2, // Font dinamis
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Judul : ",
                          style: AppFonts.bodyText, // Font dinamis
                        ),
                        const DynamicTextField(
                          hintText: 'Masukkan judul',
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Ceritakan Harimu : ",
                          style: AppFonts.bodyText, // Font dinamis
                        ),
                        const SizedBox(height: 5.0),
                        const DynamicTextField(
                          hintText: 'Ceritakan pengalaman hari ini',
                          maxLines: 7,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  DynamicButton(
                    text: "Tambahkan",
                    backgroundColor: Appcolors.primary,
                    textColor: Colors.black,
                    borderRadius: 8.0,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 110.0,
                    ),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                    onPressed: () {
                      Navigator.pop(context); // Tambahkan logika lain jika diperlukan
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
