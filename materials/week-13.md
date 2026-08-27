# Pertemuan 13: Local Data Management & State Handling Sederhana (Provider)

**Kembali ke:** [Daftar Isi](../../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep **State Management** (Ephemeral State vs App State) di Flutter.
2. Mengkonfigurasi paket **Provider** (`ChangeNotifier`, `ChangeNotifierProvider`, dan `Consumer` / `context.watch`).
3. Mengubah antarmuka *UI Statis* (Pertemuan 9-12) menjadi *UI Dinamis* yang terhubung dengan data lokal.
4. Mengimplementasikan fitur **Tambah/Hapus Favorit** atau **Keranjang Belanja** secara interaktif real-time.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Briefing Konsep State** | 20 Menit | Pemaparan *State Management*, *Reactive UI*, & Arsitektur Provider | Pemahaman Konsep State |
| **Sesi 2: Setup Model & Provider** | 30 Menit | Membuat Data Model `Product` & Class Provider `CartProvider` | State Store Terbentuk |
| **Sesi 3: Integrasi State ke UI** | 70 Menit | Menyambungkan State Provider ke `HomeScreen`, `DetailScreen`, & `CartScreen` | Aplikasi Reaktif Dinamis |
| **Sesi 4: Review & Asistensi** | 20 Menit | Pengujian interaksi real-time data & evaluasi arsitektur kode | Pengesahan Code State |

---

## 📖 1. Materi Utama (20 Menit)

### A. Ephemeral State vs App State
* **Ephemeral State (Local State):** State yang hanya dibutuhkan oleh 1 widget tunggal (misal: status *show/hide password* atau animasi indikator tab). Cukup dikelola menggunakan `setState()`.
* **App State (Global State):** State yang diakses oleh banyak layar sekaligus (misal: data keranjang belanja, status login pengguna, tema aplikasi). Dikelola menggunakan State Management seperti **Provider**.

```text
[ User Action ] ──► [ Call Method Provider ] ──► [ Mutate State Data ]
                                                          │
  [ Redraw UI ]  ◄── [ notifyListeners() ] ───────────────┘

```

---

### B. Tiga Komponen Utama Provider

1. **`ChangeNotifier`**: Class penyimpan state yang memberikan notifikasi saat data berubah (`notifyListeners()`).
2. **`ChangeNotifierProvider`**: Widget pembungkus di root aplikasi agar Provider dapat diakses dari layar mana saja.
3. **`Consumer` / `context.watch<T>()**`: Widget/metode untuk membaca data dari Provider dan otomatis melakukan *re-build* saat data berubah.

---

## 🛠️ 2. Aktivitas Praktik Studio (110 Menit)

### Tahap 1: Persiapan Package & Data Model (15 Menit)

Tambahkan package `provider` di file `pubspec.yaml` atau jalankan via terminal:

```bash
flutter pub add provider

```

Buat file model **`lib/core/models/product_model.dart`**:

```dart
class Product {
  final String id;
  final String title;
  final String price;
  final String rating;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    this.isFavorite = false,
  });
}

```

---

### Tahap 2: Membuat Class Provider (20 Menit)

Buat file **`lib/core/providers/cart_provider.dart`**:

```dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  // Master Data Produk Demo
  final List<Product> _products = [
    Product(id: '1', title: 'Sepatu Running Sport', price: 'Rp 250.000', rating: '4.8'),
    Product(id: '2', title: 'Tas Ransel Laptop', price: 'Rp 185.000', rating: '4.6'),
    Product(id: '3', title: 'Jam Tangan Digital', price: 'Rp 320.000', rating: '4.9'),
    Product(id: '4', title: 'Headphone Wireless', price: 'Rp 450.000', rating: '4.7'),
  ];

  final List<Product> _cartItems = [];

  List<Product> get products => _products;
  List<Product> get cartItems => _cartItems;
  int get cartCount => _cartItems.length;

  // Toggle Favorit
  void toggleFavorite(String id) {
    final index = _products.indexWhere((item) => item.id == id);
    if (index != -1) {
      _products[index].isFavorite = !_products[index].isFavorite;
      notifyListeners(); // Mengabarkan UI untuk update
    }
  }

  // Tambah ke Keranjang
  void addToCart(Product product) {
    if (!_cartItems.contains(product)) {
      _cartItems.add(product);
      notifyListeners();
    }
  }

  // Hapus dari Keranjang
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}

```

---

### Tahap 3: Register Provider di Root Application (10 Menit)

Update file **`lib/main.dart`** untuk membungkus aplikasi dengan `ChangeNotifierProvider`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/cart_provider.dart';
import 'main_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Mobile Studio',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const MainScreen(),
    );
  }
}

```

---

### Tahap 4: Hubungkan Provider ke Layar Home & Detail (65 Menit)

Update **`lib/features/home/home_screen.dart`** agar membaca data secara dinamis dari `CartProvider`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/providers/cart_provider.dart';
import '../detail/detail_screen.dart';
import 'widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengakses instance provider
    final cartProvider = context.watch<CartProvider>();
    final productList = cartProvider.products;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Badge Keranjang
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Halo, Mahasiswa 👋', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Temukan item favoritmu hari ini', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  Stack(
                    children: [
                      const Icon(Icons.shopping_bag_outlined, size: 28),
                      if (cartProvider.cartCount > 0)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                            child: Text(
                              '${cartProvider.cartCount}',
                              style: const TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text('Katalog Produk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Dynamic GridView dari Provider
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return ProductCard(
                    title: product.title,
                    price: product.price,
                    rating: product.rating,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

---

## 🔍 3. Asistensi & Review (20 Menit)

Tunjukkan implementasi **State Management Provider** kepada Dosen/Asisten Lab:

* Apakah perubahan data (seperti menambah ke keranjang/favorit) langsung memperbarui tampilan secara otomatis?
* Apakah `context.watch` atau `Consumer` sudah digunakan dengan tepat tanpa melakukan *re-build* berlebihan pada widget yang tidak perlu?
* Apakah struktur file `models` dan `providers` terorganisir dengan rapi sesuai arsitektur folder proyek?

---

## 📝 Checkpoint & Tugas Minggu 13

* [ ] Package `provider` berhasil terintegrasi ke dalam struktur proyek.
* [ ] Model `Product` dan Provider `CartProvider` selesai diimplementasikan.
* [ ] Data produk pada `HomeScreen` dan `DetailScreen` bersumber dari Provider (bukan *hardcoded*).
* [ ] Fitur interaktif (tambah keranjang & badge count) berjalan secara dinamis dan real-time.
* [ ] Siap melanjutkan ke **Pertemuan 14: Final Review App Architecture & Gelar Karya Studio (Showcase)**.