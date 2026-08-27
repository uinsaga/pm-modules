# Pertemuan 7: Basic Flutter 2 (Styling, Form Input, Scrollable List, & Simple Navigation)

**Kembali ke:** [Daftar Isi](../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Mengimplementasikan komponen form input (`TextField`) dan tombol aksi (`ElevatedButton`).
2. Menampilkan daftar data yang dapat di-scroll menggunakan **`ListView`** dan **`ListView.builder`**.
3. Memahami dan menerapkan navigasi antar halaman dasar menggunakan **`Navigator.push`** dan **`Navigator.pop`**.
4. Mempersiapkan *environment* dan materi untuk pelaksanaan **UTS (Pertemuan 8)**.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Briefing & Demo** | 30 Menit | Pemaparan Form Input, Scrollable Views, & Konsep Navigasi Stack | Pemahaman Sintaks |
| **Sesi 2: Hands-on Form & List** | 50 Menit | Praktik Membuat Form Login & Daftar Kartu Konten (`ListView`) | 2 Komponen Layout Fix |
| **Sesi 3: Hands-on Navigation** | 50 Menit | Praktik Menghubungkan 2 Layar (Halaman Form ➡️ Halaman Daftar) | Multi-Page App Sederhana |
| **Sesi 4: Review & UTS Prep** | 20 Menit | Checklist Kesiapan Prototype Figma & Project Flutter untuk UTS | Briefing UTS Fix |

---

## 📖 1. Materi Utama (30 Menit)

### A. Form Input (`TextField`) & Custom Styling
`TextField` digunakan untuk menangkap input teks dari pengguna (seperti Form Login/Search Bar).

```dart
TextField(
  obscureText: true, // Untuk password
  decoration: InputDecoration(
    hintText: 'Masukkan password kamu...',
    labelText: 'Password',
    prefixIcon: Icon(Icons.lock),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)

```

---

### B. Scrollable Views (`ListView`)

Gunakan `ListView` agar tampilan tidak mengalami *overflow* (layar error garis kuning-hitam) saat konten melebihi batas tinggi layar HP.

* **`ListView` (Static):** Digunakan jika jumlah elemen sedikit dan sudah pasti.
* **`ListView.builder` (Dynamic):** Sangat efisien untuk data dalam jumlah banyak karena hanya merender elemen yang terlihat di layar (*lazy loading*).

```dart
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(Icons.shopping_bag),
        title: Text('Produk ke-${index + 1}'),
        subtitle: Text('Rp 50.000'),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  },
)

```

---

### C. Navigasi Antar Halaman (`Navigator 1.0 Stack`)

Navigasi di Flutter bekerja seperti tumpukan piring (*Stack*):

* **`Navigator.push`**: Menumpuk halaman baru di atas halaman saat ini (Berpindah maju).
* **`Navigator.pop`**: Mengambil/menghapus halaman paling atas dari tumpukan (Kembali ke halaman sebelumnya).

```text
[ Halaman Detail ] ──► (Navigator.pop)  ──► [ Halaman Home ] (Kembali)
[ Halaman Home   ] ──► (Navigator.push) ──► [ Halaman Detail ] (Maju)

```

---

## 🛠️ 2. Aktivitas Praktik Studio (100 Menit)

### Tahap 1: Hands-on Form Input & Navigation (50 Menit)

Buat file baru `lib/login_page.dart` dan buat tampilan form sederhana yang berpindah ke halaman utama saat tombol diklik:

```dart
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selamat Datang',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke HomePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}

```

---

### Tahap 2: Hands-on ListView & Pop Navigation (50 Menit)

Buat file baru `lib/home_page.dart` untuk menampilkan daftar barang dan tombol kembali:

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Catalog'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke LoginPage
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.store)),
              title: Text('Item Katalog #${index + 1}'),
              subtitle: const Text('Deskripsi singkat item...'),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

```

---

## 🔍 3. Review & Briefing UTS (20 Menit)

### Format Ujian Tengah Semester (UTS - Pertemuan 8):

1. **Demo Figma Interactive Prototype (Kelompok):**
* Mempresentasikan *Interactive Prototype* (5 Layar Utama) yang telah selesai di Figma.
* Menunjukkan kesesuaian antara *User Flow* dan rancangan *Design System*.


2. **Live Coding Checkpoint (Individu/Kelompok):**
* Menunjukkan bahwa laptop masing-masing sudah siap dengan SDK Flutter & VS Code.
* Mendemonstrasikan aplikasi dasar (Form + List + Navigation) berjalan lancar di HP/Emulator.



---

## 📝 Checkpoint & Tugas Minggu 7

* [ ] Kode praktikum `TextField`, `ListView`, dan `Navigator` berhasil berjalan tanpa error.
* [ ] File Figma **Interactive Prototype** kelompok sudah 100% final.
* [ ] Laptop & perangkat pengujian (HP/Emulator) dipastikan siap untuk **UTS di Pertemuan 8**.