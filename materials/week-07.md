# Pertemuan 6: Setup Environment Tools & Basic Flutter 1 (Core Widgets & Layouting Row/Column)

**Kembali ke:** [Daftar Isi](../../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami struktur folder bawaan proyek Flutter (*Project Directory Structure*).
2. Memahami konsep **Widget Tree** (`StatelessWidget` vs `StatefulWidget`).
3. Menguasai 5 *Core Widgets* dasar: `Container`, `Text`, `Image`, `Column`, dan `Row`.
4. Mengimplementasikan tata letak layouting responsif sederhana menggunakan properti `MainAxisAlignment` dan `CrossAxisAlignment`.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Setup & Briefing** | 30 Menit | Penjelasan Anatomi Kode Flutter, Widget Tree, & Inisialisasi Proyek Baru | Proyek Baru Siap |
| **Sesi 2: Demo Core Widgets** | 30 Menit | Live Coding Dosen: Penjelasan `Container`, `Text`, dan Layouting Sederhana | Pemahaman Sintaks |
| **Sesi 3: Hands-on Layouting** | 70 Menit | Praktik Slicing Kartu Layout Sederhana Menggunakan Kombinasi `Row` & `Column` | 1 Layar Tampilan Siap |
| **Sesi 4: Review & Asistensi** | 20 Menit | Cek Running App di HP Fisik / Emulator Setiap Mahasiswa | Pengesahan Code |

---

## 📖 1. Materi Utama (60 Menit)

### A. Anatomi Proyek & Konsep Widget Tree
Di Flutter, **segala sesuatu adalah Widget** (*Everything is a Widget*). Tampilan antarmuka dibentuk secara berhirarki seperti pohon (*Widget Tree*).

```text
[ MaterialApp ] 
       └── [ Scaffold ] (Struktur Layar Utama)
                ├── [ AppBar ] (Header Atas)
                └── [ Body ] (Area Konten Utam)
                         └── [ Column ]
                                  ├── [ Text ]
                                  └── [ Row ]

```

* **`StatelessWidget`:** Widget statis yang tampilannya tidak berubah secara dinamis setelah di-render (cocok untuk halaman profil statis, layout kartu, ikon).
* **`StatefulWidget`:** Widget dinamis yang tampilannya dapat berubah sewaktu-waktu sesuai dengan perubahan data/keadaan (*state*) aplikasi.

---

### B. Cheat Sheet Core Widgets

#### 1. Column (Menyusun Elemen Vertikal ke Bawah)

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,  // Alignment Vertikal
  crossAxisAlignment: CrossAxisAlignment.start, // Alignment Horizontal
  children: [
    Text('Header Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    SizedBox(height: 8), // Spacing
    Text('Sub-title deskripsi...'),
  ],
)

```

#### 2. Row (Menyusun Elemen Horizontal ke Samping)

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Memberi jarak rata kanan-kiri
  children: [
    Text('Harga:'),
    Text('Rp 150.000', style: TextStyle(color: Colors.blue)),
  ],
)

```

#### 3. Container (Box Styling: Margin, Padding, Border, Color)

```dart
Container(
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10),
    ],
  ),
  child: Text('Card Content'),
)

```

---

## 🛠️ 2. Aktivitas Praktik Studio (70 Menit)

### Langkah 1: Inisialisasi Proyek Flutter

1. Buka Terminal / VS Code, jalankan perintah berikut untuk membuat proyek baru:
```bash
flutter create mobile_project_kelompok
cd mobile_project_kelompok
code .

```


2. Hubungkan HP Android fisik via kabel USB (Pastikan *USB Debugging* aktif) atau jalankan Emulator.
3. Buka file `lib/main.dart`, bersihkan kode bawaan (*Counter App*), dan gantikan dengan struktur dasar `StatelessWidget`.

---

### Langkah 2: Hands-on Slicing Component "Profile Card"

Buat tampilan komponen kartu profil sederhana di `lib/main.dart` dengan menggabungkan `Container`, `Column`, `Row`, dan `Image`:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text('Basic Flutter Layouting'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, color: Colors.white, size: 35),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nama Mahasiswa',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Developer Mobile - Kelompok 01',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
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

```

---

## 🔍 3. Asistensi & Review (20 Menit)

Tunjukkan tampilan aplikasi di HP/Emulator kepada Dosen/Asisten Lab:

* Pastikan proyek berhasil berjalan (*running*) tanpa error kompilasi.
* Buktikan fungsi **Hot Reload (`r`)** di VS Code berfungsi dengan mengubah teks nama pada kode.
* Pastikan pemahaman struktur hirarki `Row` di dalam `Column` atau sebaliknya sudah benar.

---

## 📝 Checkpoint & Tugas Minggu 6

* [ ] Proyek Flutter berhasil dibuat dan dijalankan di HP/Emulator.
* [ ] Berhasil membuat komponen visual menggunakan kombinasi `Column`, `Row`, `Container`, dan `Text`.
* [ ] Kode terbebas dari *warning/error* kritis.
* [ ] Siap melanjutkan ke **Pertemuan 7: Basic Flutter 2 (Form Input, Scrollable List, & Navigation)**.
