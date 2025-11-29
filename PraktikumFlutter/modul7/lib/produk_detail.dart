import 'package:flutter/material.dart';

class ProdukDetail extends StatelessWidget {
  // Variabel untuk menerima data dari halaman form
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  // Konstruktor menerima data dari ProdukForm
  const ProdukDetail({
    super.key,
    required this.kodeProduk,
    required this.namaProduk,
    this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
      ),

      // Isi utama halaman
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shadowColor: Colors.deepPurple.shade100,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menampilkan data produk
                Row(
                  children: [
                    const Icon(Icons.qr_code, color: Colors.deepPurple),
                    const SizedBox(width: 10),
                    Text(
                      "Kode: ${kodeProduk ?? '-'}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.shopping_cart, color: Colors.deepPurple),
                    const SizedBox(width: 10),
                    Text(
                      "Nama: ${namaProduk ?? '-'}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.attach_money, color: Colors.deepPurple),
                    const SizedBox(width: 10),
                    Text(
                      "Harga: Rp ${harga?.toString() ?? '-'}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),

                // Tombol kembali ke form
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali ke Form'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6,
                    ),
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