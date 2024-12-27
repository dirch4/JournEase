import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurnease/core/constants/color.dart';
import 'package:jurnease/pages/addjournal.dart';
import 'package:jurnease/pages/detail.dart';
import 'package:jurnease/pages/login.dart';
import 'package:jurnease/pages/author.dart';
import 'package:jurnease/core/components/button.dart';
import 'package:jurnease/core/components/font.dart';
import 'package:jurnease/core/components/icon.dart';
import 'package:jurnease/core/components/container.dart';
import 'package:jurnease/providers/auth_provider.dart';
import 'package:jurnease/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool isDescending = true;

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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                    onPressed: () async {
                      final authProvider = AuthProvider();
                      // Proses logout
                      await authProvider.logout();
                      // Navigasi ke halaman Login
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                  ),
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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor:
            // Colors.transparent,
            Appcolors.secondary, 
        elevation: 0,
        leading: AppIcon(
          icon: Icons.info_outline,
          color: Colors.black,
          size: 30,
          onPressed: () {
            Navigator.push( 
              context,
              MaterialPageRoute(
                builder: (context) => const AuthorPage(),
              ),
            );
          },
        ),
        actions: [
          AppIcon(
            icon: Icons.power_settings_new,
            color: Colors.black,
            size: 30,
            onPressed: () {
              showOffAlert(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          DynamicContainer(
            height: 200.0,
            width: double.infinity,
            backgroundColor: Appcolors.secondary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ // Naikkan ikon sedikit
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Text(
                        "Selamat Datang!",
                        textAlign: TextAlign.start,
                        style: AppFonts.heading1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Apa niat kamu untuk hari ini?",
                        textAlign: TextAlign.start,
                        style: AppFonts.heading2,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: -30,
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
          DynamicContainer(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            backgroundColor: Colors.transparent,
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
                  MaterialPageRoute(builder: (context) => Addjournal()),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DynamicContainer(
                margin: const EdgeInsets.only(left: 20.0),
                backgroundColor: Colors.transparent,
                child: Text(
                  "Journaling Kamu",
                  style: AppFonts.heading2,
                ),
              ),
              AppIcon(
                icon: isDescending ? Icons.arrow_downward : Icons.arrow_upward,
                color: Colors.black,
                size: 30,
                onPressed: () {
                  setState(() {
                    isDescending = !isDescending; // Toggle urutan
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _db
                  .collection('journaling')
                  .where("userId", isEqualTo: AuthProvider().currentUser?.uid)
                  .orderBy('timestamp', descending: isDescending)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  print("Error: ${snapshot.error}");
                  return const Center(
                    child: Text(
                      "Terjadi kesalahan saat memuat jurnal.",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada journaling kamu.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                // Menampilkan daftar jurnal
                final journals = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: journals.length,
                  itemBuilder: (context, index) {
                    final journal = journals[index];
                    final title = journal["title"] ?? "Judul Tidak Ada";
                    final body = journal["body"] ?? "Isi Tidak Ada";
                    final timestamp = journal["timestamp"] as Timestamp;
                    final date = DateTime.fromMillisecondsSinceEpoch(
                        timestamp.millisecondsSinceEpoch);
                    final formattedDate =
                        DateFormat("d MMMM yyyy", "id_ID").format(date);

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              title: title,
                              date: formattedDate,
                              content: body,
                            ),
                          ),
                        );
                      },
                      leading: DynamicContainer(
                        width: 50,
                        height: 50,
                        backgroundColor: Appcolors.secondary,
                        borderRadius: BorderRadius.circular(10),
                        child: const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(formattedDate),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
