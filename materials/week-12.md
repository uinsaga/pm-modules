# Pertemuan 12: Slicing UI 4 - Detail View, Form Sekunder, & User Profile Screen

**Kembali ke:** [Daftar Isi](../../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Merancang antarmuka **Detail View** dengan tata letak visual kaya informasi (*Hero Image*, deskripsi, & *Sticky Bottom Bar*).
2. Membangun **Form Sekunder** (Form Checkout/Filter/Edit Data) yang memanfaatkan komponen input dinamis.
3. Mengimplementasikan halaman **User Profile & Settings** menggunakan komponen daftar (*ListTile*) yang rapi.
4. Menyelesaikan kelengkapan *Slicing UI High-Fidelity* untuk seluruh 5 layar utama aplikasi.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Briefing & Demo Layout** | 20 Menit | Pemaparan Layout Detail View (*Stack & Sticky Button*) & Profile Screen | Pemahaman UI Patterns |
| **Sesi 2: Slicing Detail View** | 45 Menit | *Slicing* Layar Detail mencakup Gambar Hero, Teks Panjang, & Floating Bar | Layar Detail Selesai |
| **Sesi 3: Slicing Form & Profile** | 65 Menit | Koding Layar Profile User & Form Sekunder (Checkout / Settings) | 2 Layar Tambahan Fix |
| **Sesi 4: Review & Asistensi** | 20 Menit | Evaluasi kelengkapan Slicing 5 Layar Utama secara menyeluruh | Pengesahan Code Base UI |

---

## 📖 1. Materi Utama (20 Menit)

### A. Pola UI Detail View & Sticky Bottom Bar
Layar detail memerlukan struktur khusus agar tombol aksi utama (*Call to Action / CTA*) seperti **"Beli Sekarang"** atau **"Tambah ke Keranjang"** tetap terlihat di bagian bawah tanpa tertutup saat konten di-*scroll*:

```text
[ Scaffold ]
  ├── body: SingleChildScrollView (Konten Utama: Gambar + Judul + Deskripsi)
  └── bottomNavigationBar: Container (Sticky Action Button / Floating Bar)

```

---

### B. Efisiensi Profile Screen dengan ListTile

Untuk menyusun menu pengaturan pada halaman profil, gunakan **`ListTile`** yang dipadukan dengan **`ListView`** atau **`Column`** agar spasi ikon, judul, dan panah navigasi (*chevron*) konsisten:

```dart
ListTile(
  leading: Icon(Icons.person_outline, color: AppColors.primary),
  title: Text('Edit Profil'),
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)

```

---

## 🛠️ 2. Aktivitas Praktik Studio (110 Menit)

### Tahap 1: Slicing Detail View Screen (45 Menit)

Buat file **`lib/features/detail/detail_screen.dart`**:

```dart
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String price;

  const DetailScreen({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Detail Produk'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image Container
            Container(
              height: 260,
              width: double.infinity,
              color: AppColors.grey,
              child: const Center(
                child: Icon(Icons.image, size: 80, color: Colors.grey),
              ),
            ),
            
            // Content Information
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text(
                            '4.8 (120 ulasan)',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ini adalah deskripsi rinci dari produk atau konten yang dipilih. Teks ini memberikan penjelasan lengkap mengenai spesifikasi, keunggulan, dan informasi penting lainnya yang dibutuhkan oleh pengguna.',
                    style: TextStyle(color: Colors.black54, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Sticky Bottom Action Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: CustomButton(
          text: 'TAMBAH KE KERANJANG',
          onPressed: () {},
        ),
      ),
    );
  }
}

```

---

### Tahap 2: Slicing User Profile Screen (65 Menit)

Buat file **`lib/features/profile/profile_screen.dart`**:

```dart
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // User Header Info
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Mahasiswa Developer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'mahasiswa@kampus.ac.id',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Settings Section Group
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_outline, color: AppColors.primary),
                    title: const Text('Edit Profil'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.notifications_none, color: AppColors.primary),
                    title: const Text('Notifikasi'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.lock_outline, color: AppColors.primary),
                    title: const Text('Keamanan & Sandi'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Logout Group
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Keluar Akun',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  // Action Logout
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

---

## 🔍 3. Asistensi & Review (20 Menit)

Tunjukkan kelengkapan **5 Layar Utama** yang telah di-*slicing* kepada Dosen/Asisten Lab:

* Apakah 5 Layar Utama (Splash/Auth, Home, Detail, Form Sekunder, dan Profile) sudah 100% selesai dibuat di Flutter?
* Apakah navigasi antar 5 layar berfungsi dengan lancar tanpa ada alur terputus?
* Apakah tampilan di layar HP/Emulator sudah presisi visual (*pixel-perfect*) jika dibandingkan dengan hasil desain Figma Pertemuan 4-5?

---

## 📝 Checkpoint & Tugas Minggu 12

* [ ] Seluruh 5 layar utama aplikasi versi **High-Fidelity** selesai di-*slicing* ke dalam kode Flutter.
* [ ] Implementasi *Sticky Bottom Bar* pada Layar Detail dan pengelompokan *ListTile* pada Layar Profil berjalan rapi.
* [ ] Fase Slicing UI Statis **Resmi Selesai 100%**.
* [ ] Siap melanjutkan ke **Pertemuan 13: Local Data Management & State Handling Sederhana (Provider / Riverpod / Bloc Basic)**.