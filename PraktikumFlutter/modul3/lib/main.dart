import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

// Bisa StatelessWidget karena hanya UI statis
class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Ganti tema warna
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // State untuk mengontrol visibilitas password
  bool _isPasswordVisible = false; 
  
  // Fungsi untuk membalik status visibilitas
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ambil warna utama dari tema (Teal)
    final primaryColor = Theme.of(context).primaryColor;
    final bodySmallColor = Theme.of(context).textTheme.bodySmall?.color;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'), // Judul AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Padding spesifik
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Membuat tombol full-width
            children: <Widget>[
              // Ikon disesuaikan dengan warna tema
              Icon(Icons.lock_outline, size: 80, color: primaryColor),
              const SizedBox(height: 40),

              // Input Username
              TextField(
                keyboardType: TextInputType.emailAddress, // Keyboard type
                decoration: InputDecoration(
                  hintText: 'Enter your username or email',
                  labelText: 'Username/Email',
                  prefixIcon: Icon(Icons.person_outline, color: primaryColor), // Ikon di depan
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Input Password 
              TextField(
          
                obscureText: !_isPasswordVisible, 
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open_outlined, color: primaryColor), // Ikon di depan
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                 
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off, 
                      color: primaryColor,
                    ),
                    onPressed: _togglePasswordVisibility, // Panggil fungsi toggle
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Login
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                   backgroundColor: primaryColor,
                   foregroundColor: Colors.white,
                   padding: const EdgeInsets.symmetric(vertical: 16.0), // Tinggi tombol
                   shape: RoundedRectangleBorder( // Tombol dengan sudut bulat
                      borderRadius: BorderRadius.circular(8.0),
                   ),
                ),
                onPressed: (){
                  debugPrint('Login button pressed');
                },
                child: const Text('LOGIN', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Teks tombol
              ),
              const SizedBox(height: 16),
              // Link lupa password
              TextButton(
                 onPressed: () {
                    debugPrint('Forgot password tapped');
                 },
                 child: const Text('Forgot Password?'),
              ),
              const SizedBox(height: 50),

              Center(
                child: Text(
                  'Created by Marsha Daviena Zalyadieza A',
                  style: TextStyle(fontSize: 12, color: bodySmallColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}