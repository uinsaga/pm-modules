# Pertemuan 5: Interactive Prototyping, Micro-Interactions, & Figma Hand-Off

**Kembali ke:** [Daftar Isi](../README.md)

---

## 🎯 Target Pembelajaran

Di akhir pertemuan ini, mahasiswa diharapkan mampu:

1. Mengubah rancangan _High-Fidelity_ statis menjadi **Interactive Prototype** yang dapat disimulasikan di perangkat mobile.
2. Mengimplementasikan **Micro-Interactions** (seperti _Hover/Pressed State_, _Overlays_, dan _Smart Animate_).
3. Mengatur struktur alur navigasi aplikasi sesuai diagram _User Flow_ (Pertemuan 2).
4. Melakukan persiapan **Figma Hand-Off** (membaca ukuran _spacing_, mengekstrak warna, dan mengunduh aset gambar/ikon untuk koding Flutter).

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi                                      |  Durasi  | Aktivitas Utama                                                   | Output                    |
| :---------------------------------------- | :------: | :---------------------------------------------------------------- | :------------------------ |
| **Sesi 1: Briefing & Demo**               | 20 Menit | Demo Prototyping Connections, Smart Animate, & Overlay Pop-up     | Pemahaman Prototyping     |
| **Sesi 2: Hands-on Prototyping**          | 60 Menit | Hubungkan 5 Layar Utama & Atur Transisi Halaman di Canvas Figma   | Prototype Interaktif      |
| **Sesi 3: Micro-Interactions & Hand-Off** | 50 Menit | Menambahkan State Tombol, Pop-up Modal, & Inspeksi Dev Mode Figma | Asset & Spec Siap Slicing |
| **Sesi 4: Review & Asistensi**            | 20 Menit | Uji Coba Running Prototype di Figma Mirror / Mobile App           | Pengesahan Prototype      |

---

## 📖 1. Materi Utama (20 Menit)

### A. Anatomi Interactive Prototyping

_Prototyping_ di Figma memungkinkan kita menguji alur aplikasi (_usability testing_) tanpa harus menulis sebaris kode pun.

- **Nodal Connections (Hotspots):** Elemen pemicu (contoh: tombol) yang ditarik gariskaitnya menuju layar tujuan.
- **Triggers:** Aksi pengguna yang memicu reaksi (`On Click`, `On Drag`, `While Hovering`, `While Pressing`).
- **Action Types:**
  - `Navigate to`: Perpindahan layar standar.
  - `Open Overlay`: Membuka jendela dialog/modal/bottom sheet melayang di atas layar aktif.
  - `Scroll to`: Berpindah posisi ke bagian tertentu dalam satu layar (_anchor link_).
- **Smart Animate:** Fitur animasi otomatis Figma yang mencocokkan layer identik antar layar untuk memberikan transisi halus (seperti animasi _hero image_ yang membesar).

---

### B. Konsep Figma Hand-Off untuk Developer

Sebelum masuk ke Flutter minggu depan, mahasiswa harus paham cara membaca spesifikasi dari Figma ke dalam kode:

1. **Dev Mode (`Shift + D`):** Fitur khusus untuk menginspeksi nilai CSS/Flutter (_padding, margin, border-radius, color hex_).
2. **Asset Exporting:** Menandai ikon dan gambar agar siap diunduh dalam format PNG/SVG untuk dimasukkan ke folder proyek Flutter (`assets/images/` atau `assets/icons/`).

---

## 🛠️ 2. Aktivitas Praktik Studio (110 Menit)

### Tahap 1: Menghubungkan Alur Layar Utama (60 Menit)

1. Buka tab **`Prototype`** di panel sebelah kanan Figma.
2. **Splash / Auth Flow:**
   - Sambungkan tombol `Get Started` pada Splash Screen ke Layar **Login**.
   - Sambungkan tombol `Login` ke **Home Dashboard**.
3. **Home & Navigation Flow:**
   - Sambungkan item kartu produk pada Home Dashboard ke Layar **Detail View**.
   - Hubungkan ikon _Profile_ di _Bottom Navigation Bar_ ke Layar **User Profile**.
   - Atur agar _Bottom Navigation Bar_ bersifat **Fixed (Stay in position)** saat konten layar di-_scroll_.

---

### Tahap 2: Micro-Interactions & Prep Hand-Off (50 Menit)

1. **Membuat Interactive Components (State Button):**
   - Masuk ke halaman `🎨 Design System`.
   - Pada komponen `Button`, hubungkan state `Default` ke state `Hover/Pressed` menggunakan trigger `While Hovering` / `While Pressing` dengan transisi `Smart Animate (Ease In 150ms)`.
2. **Modal Overlay (Bottom Sheet / Dialog Box):**
   - Buat layar kecil untuk konfirmasi Logout / Filter Produk.
   - Hubungkan pemicu ke layar tersebut dengan opsi `Open Overlay` (Centang _Close when clicking outside_ & _Add background overlay_).
3. **Exporting Assets:**
   - Seleksi ikon-ikon utama dan gambar logo.
   - Pada panel kanan bawah, buka opsi **Export** ➡️ Pilih format **SVG** (untuk ikon) atau **PNG @2x** (untuk foto) ➡️ Export ke folder lokal laptop.

---

## 🔍 3. Asistensi & Review (20 Menit)

Demonstrasikan **Figma Prototype** kelompok ke Dosen/Asisten Lab:

- Jalankan fitur **Present Mode (`Ctrl + Alt + Enter` / `Cmd + Option + Enter`)** atau buka via aplikasi **Figma Mirror** di HP.
- Uji coba alur dari _Splash Screen_ ➡️ _Login_ ➡️ _Home_ ➡️ _Detail_ ➡️ _Profile_.
- Pastikan tidak ada tombol "mati" (tombol yang diklik tetapi tidak merespons alur).

---

## 📝 Checkpoint & Tugas Minggu 5

- [ ] Interactive Prototype untuk 5 Layar Utama berfungsi 100% tanpa _break_ alur.
- [ ] Terdapat animasi _Smart Animate_ / Micro-Interactions sederhana pada tombol atau navigasi.
- [ ] Seluruh aset gambar dan ikon telah di-export dalam format PNG/SVG.
- [ ] Proyek Figma Fase 1 **Resmi Fix** dan siap di-hand-off ke Flutter pada Pertemuan 6 (Setup & Basic Flutter 1).
