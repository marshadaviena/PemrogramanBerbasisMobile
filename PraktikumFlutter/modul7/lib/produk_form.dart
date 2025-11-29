import 'package:flutter/material.dart';
import 'produk_detail.dart'; // Import halaman detail

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  // Controller untuk mengelola input dari TextField
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();

  @override
  void dispose() {
    // Membersihkan controller dari memori
    _kodeController.dispose();
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  // ===========================================================
  // Fungsi untuk mengirim data ke halaman detail
  // ===========================================================
  void _kirimData() {
    String kode = _kodeController.text;
    String nama = _namaController.text;
    int harga = int.tryParse(_hargaController.text) ?? 0;

    if (kode.isNotEmpty && nama.isNotEmpty) {
      // Navigasi ke halaman detail sambil mengirim data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ProdukDetail(kodeProduk: kode, namaProduk: nama, harga: harga),
        ),
      );
    } else {
      // Tampilkan pesan peringatan jika input kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kode dan Nama tidak boleh kosong!'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===========================================================
      // AppBar dengan judul dan ikon
      // ===========================================================
      appBar: AppBar(title: const Text('Input Data Produk'), centerTitle: true),

      // ===========================================================
      // Isi utama halaman
      // ===========================================================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===========================================================
              // Judul di bagian atas
              // ===========================================================
              const Text(
                "Masukkan Data Produk",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              // ===========================================================
              // Field input Kode Produk
              // ===========================================================
              TextField(
                controller: _kodeController,
                decoration: const InputDecoration(
                  labelText: "Kode Produk",
                  prefixIcon: Icon(Icons.qr_code_2),
                ),
              ),
              const SizedBox(height: 16),

              // ===========================================================
              // Field input Nama Produk
              // ===========================================================
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Produk",
                  prefixIcon: Icon(Icons.shopping_bag),
                ),
              ),
              const SizedBox(height: 16),

              // ===========================================================
              // Field input Harga Produk
              // ===========================================================
              TextField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  labelText: "Harga Produk",
                  prefixIcon: Icon(Icons.price_change),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),

              // ===========================================================
              // Tombol Kirim Data
              // ===========================================================
              ElevatedButton.icon(
                onPressed: _kirimData,
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Lihat Detail'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 24,
                  ),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "© 2025 Marsha Daviena Zalyadieza A",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.deepPurple,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
