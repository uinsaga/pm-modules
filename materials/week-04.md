# Pertemuan 4: Slicing Visual UI Design (High-Fidelity Layouting di Figma)

**Kembali ke:** [Daftar Isi](../README.md)

---

## 🎯 Target Pembelajaran

Di akhir pertemuan ini, mahasiswa diharapkan mampu:

1. Mentransformasikan sketsa _Wireframe Low-Fi_ menjadi tampilan visual **High-Fidelity (Hi-Fi)**.
2. Menerapkan _Design System_ (Color & Text Styles) secara konsisten pada seluruh layar.
3. Mengatur komposisi layouting kompleks menggunakan nested **Auto Layout** (Fill Container vs Hug Content).
4. Menyelesaikan perancangan visual presisi (_pixel-perfect_) untuk 5 layar utama aplikasi.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi                                 |  Durasi  | Aktivitas Utama                                                      | Output                   |
| :----------------------------------- | :------: | :------------------------------------------------------------------- | :----------------------- |
| **Sesi 1: Briefing & Demo**          | 20 Menit | Pemaparan Standard Hi-Fi Design & Demo Complex Nested Auto Layout    | Pemahaman Slicing UI     |
| **Sesi 2: Slicing Auth & Home**      | 50 Menit | Merancang Layar Splash, Login/Register, dan Main Home Dashboard      | 3 Layar Hi-Fi Selesai    |
| **Sesi 3: Slicing Detail & Profile** | 60 Menit | Merancang Layar Detail Content View, Form Sekunder, dan User Profile | 2 Layar Hi-Fi Selesai    |
| **Sesi 4: Review & Asistensi**       | 20 Menit | Evaluasi Konsistensi Spacing, Alignment, dan Penerapan Color Styles  | Pengesahan 5 Layar Hi-Fi |

---

## 📖 1. Materi Utama (20 Menit)

### A. Transisi dari Wireframe ke Hi-Fi Design

Proses _slicing_ visual adalah tahap menyuntikkan "nyawa" ke dalam kerangka wireframe kasar:

```text
[ Wireframe Kasar ]  +  [ Design System & Assets ]  =  [ High-Fidelity UI ]
 (Kotak & Sketsa)        (Warna, Font, Gambar, Icon)      (Tampilan Siap Koding)
```
````

- **Visual Consistency:** Gunakan _Design System_ yang telah terdaftar di Pertemuan 3. Hindari penggunaan warna _hardcoded_ (hex warna manual yang tidak terdaftar di styles).
- **Real Content over Dummy Data:** Gunakan teks dan gambar asli (bukan sekadar `Lorem Ipsum` atau kotak silang) agar proporsi tata letak presisi dengan kondisi riil.

---

### B. Formula Nested Auto Layout untuk Layar Mobile

Untuk memastikan antarmuka mudah di-slicing ke kode Flutter nantinya, struktur layer di Figma harus disusun rapi:

1. **Frame Utama Layar:** Gunakan ukuran standar ponsel (contoh: _Android Large / iPhone 14_ - Width `360px` hingga `390px`).
2. **Scrolling Section (Content Container):** Atur ke `Vertical Auto Layout` dengan properti `Fill Container` (Width) dan `Hug Contents` (Height).
3. **Fixed Elements:** Komponen yang tidak ikut ter-scroll (seperti _Top App Bar_ atau _Bottom Navigation Bar_) diletakkan di luar kontainer _scroll_.

---

## 🛠️ 2. Aktivitas Praktik Studio (110 Menit)

### Tahap 1: Setup Frame & Layar Auth (50 Menit)

1. Buka file Figma kelompok, buat halaman baru bernama **`📱 UI Design (Hi-Fi)`**.
2. **Layar 1: Splash / Welcome Screen**

- Buat Frame Ponsel baru (`F`), terapkan warna `Neutral/Background`.
- Masukkan Logo Aplikasi, Tagline, dan Ilustrasi Visual utama.
- Posisikan tombol _Action_ (Login / Register) di bagian bawah (_Bottom Alignment_).

3. **Layar 2: Authentication (Login / Register)**

- Masukkan komponen `Input Field` yang telah dibuat di Pertemuan 3.
- Tambahkan _Header Text_ ("Selamat Datang Kembali"), tombol _Login_, dan tautan _Lupa Password_.

---

### Tahap 2: Layar Utama, Detail, & Profile (60 Menit)

1. **Layar 3: Home Dashboard (Layar Utama)**

- **Header Section:** Greeting user, foto profil avatar, dan ikon notifikasi.
- **Search Bar & Banner:** Gunakan Auto Layout Horizontal untuk banner promosi.
- **Content Grid / List:** Susun _Card Component_ produk/konten menggunakan Auto Layout (Set `Fill Container` agar responsif).
- **Bottom Navigation Bar:** Tempelkan komponen navigasi di batas bawah frame.

2. **Layar 4: Detail View**

- Tampilkan _Hero Image_ resolusi tinggi di bagian atas.
- Masukkan judul item, indikator rating, deskripsi teks panjang, dan _sticky button_ di bagian paling bawah.

3. **Layar 5: User Profile / Settings**

- Susun layout informasi akun (Foto Profil, Nama, Email) dan daftar menu pilihan (_Account Settings, Push Notification, Logout_).

---

## 🔍 3. Asistensi & Review (20 Menit)

Tunjukkan canvas **`📱 UI Design (Hi-Fi)`** ke Dosen/Asisten Lab untuk diperiksa:

- Apakah 5 layar utama sudah selesai dirancang dengan presisi visual yang baik?
- Apakah seluruh komponen teks, warna, dan tombol memanfaatkan **Styles & Components** dari Pertemuan 3?
- Apakah penamaan layer rapi (tidak ada layer bernama `Frame 123` atau `Rectangle 45`)?

---

## 📝 Checkpoint & Tugas Minggu 4

- [ ] 5 Layar utama versi **High-Fidelity** selesai dibuat di Figma.
- [ ] Penggunaan komponen, warna, dan font 100% konsisten menggunakan _Design System_.
- [ ] Struktur _Auto Layout_ di setiap layar sudah rapi dan siap untuk diberi interaksi **Prototyping** di Pertemuan 5.
