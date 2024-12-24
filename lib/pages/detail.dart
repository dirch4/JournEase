import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';

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
                  child: DynamicButton(
                    text: "", // Teks kosong karena hanya ingin ikon
                    backgroundColor: Colors.pink[100]!,
                    textColor: Colors.black,
                    borderRadius: 50.0,
                    padding: const EdgeInsets.all(8),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    // Tambahkan ikon di dalam tombol
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
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
                      style: AppFonts.heading1, // Use dynamic font
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: AppFonts.bodyText
                          .copyWith(color: Colors.grey), // Use dynamic font
                    ),
                    const SizedBox(height: 16),
                    Text(
                      content,
                      style: AppFonts.bodyText, // Use dynamic font
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
                style: AppFonts.heading2, // Use dynamic font
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
