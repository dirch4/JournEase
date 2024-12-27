import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/core/components/font.dart';
import 'package:jurnease/core/components/icon.dart'; 

class DetailPage extends StatelessWidget {
  final String title;
  final String date;
  final String content;

  const DetailPage({
    Key? key,
    required this.title,
    required this.date,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Appcolors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: AppIcon(
                    icon: Icons.arrow_back, // Ikon back
                    color: Colors.black,
                    size: 30,
                    onPressed: () {
                      Navigator.pop(context); // Aksi kembali
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: -10,
                  child: Image.asset(
                    'assets/leaf2.png', // Ganti dengan path sesuai aset
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Konten utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: 500,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.heading1, // Font dinamis
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date, 
                      style: AppFonts.bodyText
                          .copyWith(color: Colors.grey), // Font dinamis
                    ),
                    const SizedBox(height: 16),
                    Text(
                      content,
                      style: AppFonts.bodyText, // Font dinamis
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'JournEase',
                textAlign: TextAlign.center,
                style: AppFonts.heading2, // Font dinamis
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
