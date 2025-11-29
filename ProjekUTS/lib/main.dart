import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeMenuApp());
}

/// StatelessWidget
class CoffeeMenuApp extends StatelessWidget {
  const CoffeeMenuApp({super.key}); // Implementasi UI dinamis dengan super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //MaterialApp → pembungkus utama aplikasi Flutter
      debugShowCheckedModeBanner: false,
      title: 'Coffee Menu Card',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const CoffeeMenuPage(), // Pindah ke halaman utama
    );
  }
}

/// StatefulWidget
/// bikin tampilan favorit bisa berubah .
class CoffeeMenuPage extends StatefulWidget {
  const CoffeeMenuPage({super.key}); // Implementasi super.key, supaya kalo teken like flutter cuma update bagian itu aja

  @override
  State<CoffeeMenuPage> createState() => _CoffeeMenuPageState();
}

class _CoffeeMenuPageState extends State<CoffeeMenuPage> {
  //  Variabel state untuk tombol like & animasi
  bool isLiked1 = false; //nandain menu udah di like belom
  bool isLiked2 = false;
  bool isLiked3 = false;

  int likeCount1 = 0; //nampilin jumlah like
  int likeCount2 = 0;
  int likeCount3 = 0;

  bool tapped1 = false; // efek kartu waktu diteken
  bool tapped2 = false;
  bool tapped3 = false;

  bool likeBounce1 = false; // efek mantul waktu fu klik
  bool likeBounce2 = false;
  bool likeBounce3 = false;

  void triggerLikeBounce(int index) { // nagtur efek mantul berdasarkan menu mana yg ditekan
    setState(() {
      if (index == 1) likeBounce1 = true;
      if (index == 2) likeBounce2 = true;
      if (index == 3) likeBounce3 = true;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        if (index == 1) likeBounce1 = false;
        if (index == 2) likeBounce2 = false;
        if (index == 3) likeBounce3 = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //  Scaffold → struktur dasar halaman (AppBar + Body)
      backgroundColor: const Color(0xFFF7F3EE),
      appBar: AppBar( //  AppBar → menampilkan judul di atas halaman
        backgroundColor: Colors.brown[700],
        title: const Text(
          '☕ Starbucks Coffee Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/sbc.png'), // Gambar dari asset lokal
        ),
      ),
      body: SafeArea(// agar tampilan ga ketutup kamera depan
        child: SingleChildScrollView( //bisa scroll
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column( // Column Widget → menyusun kartu menu secara vertikal
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
              // 🍯 Caramel Macchiato
              GestureDetector(//respon tap kartu
                onTapDown: (_) => setState(() => tapped1 = true),
                onTapUp: (_) => setState(() => tapped1 = false),
                onTapCancel: () => setState(() => tapped1 = false),
                child: AnimatedScale(
                  scale: tapped1 ? 0.97 : (likeBounce1 ? 1.05 : 1.0),
                  duration: const Duration(milliseconds: 150),
                  child: CoffeeCard( //isi kartu
                    name: "Caramel Macchiato",
                    price: "Rp 58.000",
                    description:
                        "Espresso yang dipadukan dengan susu steamed dan vanilla syrup, diberi sentuhan karamel di atasnya.",
                    imagePath: "assets/images/cm.png", // Gambar dari asset lokal
                    isLiked: isLiked1,
                    likeCount: likeCount1,
                    onLikePressed: () {
                      setState(() {
                        isLiked1 = !isLiked1;
                        likeCount1 += isLiked1 ? 1 : -1;
                      });
                      triggerLikeBounce(1);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ❄ Cold Brew
              GestureDetector(
                onTapDown: (_) => setState(() => tapped2 = true),
                onTapUp: (_) => setState(() => tapped2 = false),
                onTapCancel: () => setState(() => tapped2 = false),
                child: AnimatedScale(
                  scale: tapped2 ? 0.97 : (likeBounce2 ? 1.05 : 1.0),
                  duration: const Duration(milliseconds: 150),
                  child: CoffeeCard(
                    name: "Starbucks Cold Brew",
                    price: "Rp 52.000",
                    description:
                        "Kopi arabika pilihan yang diseduh perlahan selama 20 jam, menghasilkan rasa halus dan segar khas Cold Brew.",
                    imagePath: "assets/images/cb.jpeg", // Gambar dari asset lokal
                    isLiked: isLiked2,
                    likeCount: likeCount2,
                    onLikePressed: () {
                      setState(() {
                        isLiked2 = !isLiked2;
                        likeCount2 += isLiked2 ? 1 : -1;
                      });
                      triggerLikeBounce(2);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 🍫 Iced Caffè Mocha
              GestureDetector(
                onTapDown: (_) => setState(() => tapped3 = true),
                onTapUp: (_) => setState(() => tapped3 = false),
                onTapCancel: () => setState(() => tapped3 = false),
                child: AnimatedScale(
                  scale: tapped3 ? 0.97 : (likeBounce3 ? 1.05 : 1.0),
                  duration: const Duration(milliseconds: 150),
                  child: CoffeeCard(
                    name: "Iced Caffè Mocha",
                    price: "Rp 75.000",
                    description:
                        "Perpaduan espresso, cokelat, dan susu steamed dengan topping whipped cream yang lembut.",
                    imagePath:
                        "https://images.ctfassets.net/v601h1fyjgba/5x572mICLA8SIK06LaRxV8/9cd38d07f301c1f62dae04246722c750/Iced_Cafe_Mocha.jpg", // ✅ Gambar dari internet
                    isLiked: isLiked3,
                    likeCount: likeCount3,
                    onLikePressed: () {
                      setState(() {
                        isLiked3 = !isLiked3;
                        likeCount3 += isLiked3 ? 1 : -1;
                      });
                      triggerLikeBounce(3);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🍵 StatelessWidget untuk menampilkan satu kartu menu kopi.
/// Karena setiap kartu hanya menerima data (props) tanpa mengubah state.
class CoffeeCard extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  final String imagePath;
  final bool isLiked;
  final int likeCount;
  final VoidCallback onLikePressed;

  const CoffeeCard({
    super.key, // super.key digunakan agar setiap widget bisa dilacak secara unik di tree Flutter
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.isLiked,
    required this.likeCount,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.brown.withOpacity(0.3), //bayangan
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row( // Row Widget → menyusun gambar dan teks secara horizontal
          children: [
            ClipRRect( // 
              borderRadius: BorderRadius.circular(12),
              child: imagePath.startsWith('http')
                  ? Image.network( // Menampilkan gambar dari internet
                      imagePath,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    )
                  : Image.asset( // Menampilkan gambar dari asset lokal
                      imagePath,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column( // Column Widget → menyusun teks secara vertikal
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( // Text Widget → menampilkan nama menu
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text( // Text Widget → menampilkan harga
                    price,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFB8860B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text( // Text Widget → menampilkan deskripsi
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.redAccent : Colors.grey,
                  ),
                  onPressed: onLikePressed,
                ),
                if (likeCount > 0)
                  Text(
                    '$likeCount',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
