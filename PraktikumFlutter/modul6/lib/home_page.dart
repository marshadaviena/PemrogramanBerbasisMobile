import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode; // Menyimpan status dark mode
  final ValueChanged<bool> onThemeToggle; // Callback untuk toggle tema

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    // Menampilkan SnackBar saat halaman dibuka pertama kali
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Selamat datang di Home Page! 🎉"),
          backgroundColor: Colors.deepPurple.shade400,
          duration: const Duration(seconds: 2),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Colors.deepPurpleAccent,
              ),
              Switch(
                value: isDarkMode,
                activeThumbColor: Colors.deepPurple,
                onChanged: onThemeToggle,
              ),
            ],
          ),
        ],
      ),

      // ===========================================================
      // Isi utama halaman
      // ===========================================================
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home_rounded,
                color: Colors.deepPurple,
                size: 80,
              ),
              const SizedBox(height: 25),

              // Tombol untuk navigasi ke Second Page
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                ),
                onPressed: () {
                  // Navigasi ke halaman kedua dengan animasi transisi
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text(
                  'Go to Second Page',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "© 2025 Marsha Daviena Zalyadieza A", 
                style: TextStyle(
                  color: Colors.deepPurple.shade300,
                  fontStyle: FontStyle.italic,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}