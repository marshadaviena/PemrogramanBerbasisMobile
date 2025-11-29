import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // PERBAIKAN: Menggunakan super.key (gaya Dart 3+)
  // yang memperbaiki warning 'use_super_parameters'.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah widget root yang penting
    return MaterialApp(
      title: 'Registrasi Form',
      // Mengatur tema warna ke Deep Purple (untuk membedakan)
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const RegistrasiPage(), // Halaman awal aplikasi
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}

// Halaman Registrasi (Stateful karena perlu state form, loading, dan visibilitas password)
class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({super.key});

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  // 1. GlobalKey untuk mengidentifikasi dan mengelola state Form
  final _formKey = GlobalKey<FormState>();
  // State untuk melacak status loading
  bool _isLoading = false;

  // *** PENAMBAHAN UNTUK SHOW/HIDE PASSWORD ***
  bool _isPasswordVisible = false;
  bool _isConfirmationPasswordVisible = false;
  // *******************************************

  // 2. Controller untuk setiap TextFormField
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmasiPasswordController = TextEditingController();

  // 3. Penting: Dispose controller saat widget dihancurkan
  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _konfirmasiPasswordController.dispose();
    super.dispose();
  }

  // 4. Fungsi untuk menangani logika submit
  void _submitRegistrasi() {
    // 5. Validasi form menggunakan GlobalKey
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      // Jika form tidak valid, tampilkan pesan error dan hentikan proses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap perbaiki error pada form.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Jika form valid, lanjutkan proses
    setState(() {
      _isLoading = true; // Tampilkan loading indicator
    });

    // Ambil data dari controller
    final nama = _namaController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    debugPrint('Data Registrasi (Valid):');
    debugPrint('Nama: $nama');
    debugPrint('Email: $email');
    debugPrint('Password: $password');

    // 6. Simulasi proses network/API call (Operasi Asynchronous)
    Future.delayed(const Duration(seconds: 3), () {

      if (!mounted) return;

      setState(() {
        _isLoading = false; // Sembunyikan loading
      });

      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi Berhasil!'),
          backgroundColor: Colors.green,
        ),
      );

      // Opsional: Reset form setelah sukses
      _formKey.currentState?.reset();
      _namaController.clear();
      _emailController.clear();
      _passwordController.clear();
      _konfirmasiPasswordController.clear();
    });
  }

  // 8. Bangun UI
  @override
  Widget build(BuildContext context) {
    // Ambil warna tema
    final primaryColor = Theme.of(context).primaryColor;
    final bodySmallColor =
        Theme.of(context).textTheme.bodySmall?.color ?? Colors.black;

    return Scaffold(
      appBar: AppBar(title: const Text("Form Registrasi")),
      // 9. Gunakan SingleChildScrollView agar form bisa di-scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // 10. Widget Form yang terhubung dengan GlobalKey
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                // 11. Gunakan TextFormField dengan validator
                TextFormField(
                  controller: _namaController,
                  // Menggunakan 'const' karena semua argumennya konstan
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    if (value.length < 3) {
                      return 'Nama minimal 3 karakter';
                    }
                    return null; // Valid
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Format email tidak valid';
                    }
                    return null; // Valid
                  },
                ),
                const SizedBox(height: 16),

            
                TextFormField(
                  controller: _passwordController,
                  // Tentukan apakah teks disembunyikan berdasarkan state
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    // Tombol untuk toggle visibilitas
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Toggle state saat tombol ditekan
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null; // Valid
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _konfirmasiPasswordController,
                  // Tentukan apakah teks disembunyikan berdasarkan state
                  obscureText: !_isConfirmationPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Konfirmasi Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),
                    // Tombol untuk toggle visibilitas
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmationPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Toggle state saat tombol ditekan
                        setState(() {
                          _isConfirmationPasswordVisible =
                              !_isConfirmationPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password tidak boleh kosong';
                    }
                    if (value != _passwordController.text) {
                      return 'Konfirmasi password tidak cocok';
                    }
                    return null; // Valid
                  },
                ),
                const SizedBox(height: 32),

                // 12. Tampilkan loading atau tombol
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      ) // Tampilkan loading
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              primaryColor, // Menggunakan warna tema
                          foregroundColor: Colors.white, // Teks tombol putih
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: _submitRegistrasi, // Panggil fungsi submit
                        child: const Text(
                          'REGISTRASI',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                const SizedBox(height: 60),

                // KREDIT NAMA
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
      ),
    );
  }
}
