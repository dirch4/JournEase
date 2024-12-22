import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnease/core/constants/color.dart';
import 'detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Appcolors.secondary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 40),
                      child: Text(
                        "Selamat Datang!",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        "Apa niat kamu untuk hari ini?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
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
            ),
          ),

          const SizedBox(height: 30),

          // Journaling List Title
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Journaling Kamu",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Journaling List
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // Dummy Data
                String title = "Hari Paling Bahagia!";
                String date = "13 November 2024";
                String content =
                    "Hari ini adalah hari yang paling membahagiakan dalam hidupku. Pagi dimulai dengan kejutan kecil dari sahabatku yang datang membawa kue favoritku, lengkap dengan ucapan penuh kehangatan. Kami menghabiskan hari dengan tawa, mengenang momen-momen indah, dan berbagi cerita tanpa henti. Saat matahari terbenam, kami berkumpul di tepi pantai, menyaksikan langit berubah warna dan merasa begitu damai.";

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: title,
                          date: date,
                          content: content,
                        ),
                      ),
                    );
                  },
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Appcolors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Text(date),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
