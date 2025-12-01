import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===========================================================
      // AppBar otomatis menampilkan tombol kembali (Back)
      // ===========================================================
      appBar: AppBar(title: const Text('Second Page'), centerTitle: true),

      // ===========================================================
      // Isi utama halaman
      // ===========================================================
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: Colors.deepPurple,
                size: 90,
              ),
              const SizedBox(height: 30),

              const Text(
                "Halo dari Second Page 👋",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),

              // Tombol kembali ke halaman sebelumnya
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  // Kembali ke halaman sebelumnya
                  Navigator.pop(context);
                },
                child: const Text('Go Back', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
