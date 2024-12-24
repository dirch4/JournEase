import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';

class Addjournal extends StatelessWidget {
  const Addjournal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
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
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Tambah Jurnal",
                    style: AppFonts.heading2, // Use dynamic font
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Judul : ",
                          style: AppFonts.bodyText, // Use dynamic font
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(),
                            hintText: 'Masukkan judul',
                            hintStyle: AppFonts.bodyText, // Use dynamic font
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Ceritakan Harimu : ",
                          style: AppFonts.bodyText, // Use dynamic font
                        ),
                        const SizedBox(height: 5.0),
                        TextField(
                          maxLines: 7,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(),
                            hintText: 'Ceritakan pengalaman hari ini',
                            hintStyle: AppFonts.bodyText, // Use dynamic font
                          ),
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
