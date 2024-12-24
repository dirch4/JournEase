import 'package:flutter/material.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/addjournal.dart';
import 'package:jurnease/pages/detail.dart';
import 'package:jurnease/pages/splashscreen.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';
import 'package:jurnease/core/components/icon.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // Fungsi untuk menampilkan dialog "Off"
  void showOffAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.pink[200],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Yakin Mau Off?',
                style: AppFonts.heading1,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol "iya nih"
                  DynamicButton(
                    text: "iya nih",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.black,
                    borderRadius: 20.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Splashscreen(),
                        ),
                      );
                    },
                  ),
                  // Tombol "gajadi deh"
                  DynamicButton(
                    text: "gajadi deh",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.black,
                    borderRadius: 20.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

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
              borderRadius: const BorderRadius.only(
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
                      padding: const EdgeInsets.only(left: 20, top: 40),
                      child: Text(
                        "Selamat Datang!",
                        textAlign: TextAlign.start,
                        style: AppFonts.heading1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        "Apa niat kamu untuk hari ini?",
                        textAlign: TextAlign.start,
                        style: AppFonts.heading2,
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
                // Tombol "Off" di kanan atas menggunakan AppIcon
                Positioned(
                  top: 40,
                  right: 20,
                  child: AppIcon(
                    icon: Icons.power_settings_new,
                    color: Colors.black,
                    size: 30,
                    onPressed: () {
                      showOffAlert(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Button tambah jurnal
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: DynamicButton(
              text: "Ceritain Yuk",
              backgroundColor: Appcolors.primary,
              textColor: Colors.black,
              borderRadius: 50.0,
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Addjournal()),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Journaling Kamu",
                  style: AppFonts.heading2,
                ),
              ),
              // Ikon "+" untuk menambah jurnal
              AppIcon(
                icon: Icons.add,
                color: Colors.black,
                size: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Addjournal()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: "Hari",
                          date: "17 Desember 2024",
                          content:
                              "Hari ini adalah hari yang paling membahagiakan dalam hidupku. Pagi dimulai dengan kejutan kecil dari sahabatku yang datang membawa kue favoritku, lengkap dengan ucapan penuh kehangatan. Kami menghabiskan hari dengan tawa, mengenang momen-momen indah, dan berbagi cerita tanpa henti.Saat matahari terbenam, kami berkumpul di tepi pantai, menyaksikan langit berubah warna dan merasa begitu damai. ",
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
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    "Hari Paling Bahagia!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("17 Desember 2024"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
