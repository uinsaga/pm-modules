# Pertemuan 2: Ideasi Produk Aplikasi, User Flow, & Low-Fi Wireframing

**Kembali ke:** [Daftar Isi](../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Merumuskan ide produk aplikasi mobile yang memiliki skop realistis untuk diselesaikan dalam 1 semester.
2. Menyusun diagram **User Flow** (alur navigasi pengguna) yang logis dan runtut.
3. Memahami aturan dasar dan simbol standar dalam perancangan antarmuka kasar.
4. Membuat sketsa antarmuka kasar **Wireframe (Low-Fidelity)** untuk 5 layar utama sebelum masuk ke Figma.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Briefing Teori** | 30 Menit | Penjelasan Batasan Skop Produk, User Flow, & Aturan Wireframing | Pemahaman Alur Kerja |
| **Sesi 2: Workshop User Flow** | 40 Menit | Pemetaan Alur Perpindahan Layar & Fitur Kelompok | Diagram User Flow |
| **Sesi 3: Hands-on Wireframing** | 60 Menit | Praktik Menggambar Sketsa Wireframe Low-Fi (5 Layar Utama) | 5 Sketsa Layar Kasar |
| **Sesi 4: Review & Asistensi** | 20 Menit | Cek Progress Kertas Sketsa / Digital & Feedback Dosen | Pengesahan Wireframe |

---

## 📖 1. Materi Utama (30 Menit)

### A. Batasan Skop Produk (Scope Control)
Karena fokus mata kuliah ini adalah **UI/UX Design & Slicing Kode Visual (Tanpa Backend/API)**, ide aplikasi kelompok harus memenuhi batasan berikut:
* **Rich Visual Layout:** Pilih topik aplikasi yang kaya akan elemen UI (e.g., E-Commerce, Food Delivery, Movie Ticket Booking, Travel App, Fitness Tracker).
* **Skala Layar:** Wajib merancang **5 Layar Utama**:
  1. *Splash / Welcome Screen*
  2. *Authentication (Login / Register)*
  3. *Home / Main Dashboard Catalog*
  4. *Detail Content View*
  5. *User Profile / Settings Page*
* **Avoid Complex Hardware Integration:** Hindari ide yang bergantung pada hardware spesifik (IoT, AR/VR, Scanner fisik) atau logika pemrosesan data yang rumit.

---

### B. Penyusunan User Flow
**User Flow** adalah langkah-langkah visual yang diambil pengguna dari saat membuka aplikasi hingga berhasil mencapai tujuan tertentu.

#### Komponen Diagram User Flow:
* **[ Lingkaran / Capsule ]** ➡️ Menandakan titik awal (*Start*) atau akhir (*End*).
* **[ Persegi Panjang ]** ➡️ Menandakan Layar / Tampilan UI.
* **< Belah Ketupat >** ➡️ Menandakan Keputusan Pengguna (*Decision Point*, misal: Sudah Login? Ya / Tidak).

#### Contoh Alur Navigasi Aplikasi E-Commerce:
```text
( Start ) ➡️ [ Splash Screen ] ➡️ < Sudah Login? >
                                     │
                        ┌────────────┴────────────┐
                     (Tidak)                     (Ya)
                        │                         │
                        ▼                         ▼
               [ Login / Register ] ────► [ Home Dashboard ]
                                                  │
                                                  ▼ (Klik Item)
[ Checkout / Cart ] ◄─── (Klik Beli) ─── [ Detail Produk ]

```

---

### C. Konsep & Aturan Wireframing (Low-Fidelity)

**Wireframe** adalah cetak biru kasar yang digunakan untuk menyusun hirarki informasi dan fungsi tanpa terdistraksi visual.

#### Aturan Emas (Golden Rules) Wireframing:

1. **No Color:** Gunakan skala abu-abu, hitam, dan putih saja. Jangan gunakan warna estetik!
2. **No Real Fonts:** Gunakan tulisan tangan polos atau font generik. Ukuran font disesuaikan dengan skenario hirarki (*Heading vs Body*).
3. **Use Placeholders:** Gunakan simbol standar untuk menghemat waktu:
* Kotak Silang `[ X ]` ➡️ Placeholder untuk Gambar / Foto.
* Garis Horizontal `════` ➡️ Placeholder untuk Teks / Paragraf.
* Kotak Bertuliskan Teks `[ Tombol ]` ➡️ Placeholder untuk Button.
* Lingkaran Berlogo `( O )` ➡️ Placeholder untuk Avatar / Profile Picture.



---

## 🛠️ 2. Aktivitas Praktik Studio (100 Menit)

### Tahap 1: Penyusunan Diagram User Flow (40 Menit)

Diskusikan dengan kelompok dan buat diagram alur perpindahan antar 5 layar utama aplikasi kalian.

* *Media:* Kertas HVS, Whiteboard, atau software diagraming digital (Whimsical / Excalidraw / Miro).

### Tahap 2: Hands-on Menggambar Wireframe Low-Fi (60 Menit)

Setiap kelompok menggambar **5 Sketsa Layar Kasar** berdasarkan diagram *User Flow* yang telah dibuat.

#### Panduan Tata Letak Layar Utama:

1. **Layar 1 (Splash/Auth):** Logo aplikasi, *tagline*, tombol *Login/Register*, dan opsi masukan form.
2. **Layar 2 (Home Dashboard):** Header profil pengguna, *Search Bar*, Banner Promosi, Category Chips, dan List/Grid produk.
3. **Layar 3 (Detail View):** Gambar besar hero section, judul item, rating, deskripsi teks, harga, dan tombol *Action* melayang (*Bottom Sticky Button*).
4. **Layar 4 (Profile/Settings):** Foto profil, nama pengguna, menu opsi list (Riwayat, Keamanan, Keluar), dan *Bottom Navigation Bar*.
5. **Layar 5 (Sekunder/Form):** Layar tambahan sesuai spesifikasi aplikasi kalian (Keranjang / Checkout / Edit Profile).

---

## 🔍 3. Asistensi & Review (20 Menit)

Sebelum meninggalkan kelas, persiapkan hasil sketsa kalian untuk dicek oleh Dosen/Asisten Lab:

* Apakah alur perpindahan antar layar logis?
* Apakah letak elemen navigasi utama (*Bottom Navigation Bar*) sudah konsisten di setiap layar?
* Apakah posisi informasi penting sudah menonjol (*Visual Hierarchy*)?

---

## 📝 Checkpoint & Tugas Minggu 2

* [ ] Diagram **User Flow** selesai dan disetujui.
* [ ] 5 Sketsa **Wireframe Low-Fi** selesai digambar (Foto/Scan jika menggambar di kertas).
* [ ] Dokumentasikan diagram dan sketsa ke dalam folder proyek kelompok (File ini akan menjadi acuan utama saat pembuatan **Design System & Slicing Figma** di Pertemuan 3 dan 4).
