import 'package:flutter/material.dart';
import 'package:jurnease/core/components/icon.dart';
import 'package:jurnease/core/components/font.dart'; 
import 'package:jurnease/core/constants/color.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

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
                    icon: Icons.arrow_back, // Ikon Back
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
            // Konten Utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Appcolors.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tentang Kami',
                      style: AppFonts.heading1.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'JournEase adalah aplikasi journaling yang menggabungkan kemudahan dan kenyamanan dalam mencatat setiap momen. Dengan nama yang berasal dari kata "Journ" (jurnal) dan "Ease" (kemudahan), JournEase dirancang untuk membantu pengguna dalam menulis jurnal secara mudah, praktis, dan menyenangkan. Aplikasi ini memudahkan Anda untuk merekam perasaan, pengalaman, dan ide-ide, kapan saja dan di mana saja.',
                      style: AppFonts.bodyText.copyWith(
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Pembuat Aplikasi:',
                      style: AppFonts.heading2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '- Muhammad Falleryan 065122185',
                      style: AppFonts.bodyText.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '- Axel Juanito P.S 065122199',
                      style: AppFonts.bodyText.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '- Dimas Nurcahya 065122205',
                      style: AppFonts.bodyText.copyWith(
                        color: Colors.black54,
                      ),
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
                style: AppFonts.heading2,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
