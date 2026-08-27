# Roadmap Kuliah: Pemrograman Mobile (Figma to Flutter)

**Target Utama:** Paham alur membuat tampilan aplikasi mobile modern — dari ideasi UI/UX di Figma sampai jadi kode Flutter presisi (*pixel-perfect*).

* **Pra-UTS:** Full Desain & Prototype Interaktif di **Figma** (No Code).
* **Pra-UAS:** Full Slicing Kode & Navigasi di **Flutter** (No API/Backend).

---

## 🎯 Capaian Pembelajaran (Sub-CPMK)

* **Sub-CPMK 1:** Memahami konsep dan alur perancangan UI/UX hingga menghasilkan *interactive prototype* di Figma.
* **Sub-CPMK 2:** Memahami alur *design hand-off* serta cara mengekstrak aset visual dan spesifikasi desain Figma.
* **Sub-CPMK 3:** Memahami struktur dasar framework Flutter, konsep *widget*, dan prinsip tata letak (*layouting*).
* **Sub-CPMK 4:** Mengimplementasikan rancangan Figma menjadi kode antarmuka (*UI Slicing*) berbasis Flutter secara modular dan presisi.

---

## 🛠️ Prasyarat & Perangkat Pembelajaran

* **Mata Kuliah Prasyarat:** Algoritma & Pemrograman / Pemrograman Terstruktur, Pemrograman Berorientasi Objek (PBO / OOP).
* **Tools Desain:** Figma (Browser / Desktop App).
* **Tools Development:** Flutter SDK, Dart SDK, VS Code / Android Studio, Git & GitHub.
* **Hardware:** Laptop (Min. RAM 8GB disarankan), Smartphone Android/iOS atau Emulator.

---

## 📅 Roadmap Pembelajaran 16 Pertemuan

### **Fase 1: Desain UI/UX & Prototype (Figma)**

#### **Minggu 1: Kenalan & Install Tools**
* **Materi & Aktivitas:** 
  * Overview alur kerja *mobile development*.
  * Instalasi dan konfigurasi Flutter SDK, VS Code / Android Studio, serta Android Emulator atau peranti fisik.
* **Target Output:** *Environment development* siap digunakan di laptop mahasiswa.

#### **Minggu 2: Ide Aplikasi & Wireframing**
* **Materi & Aktivitas:** 
  * Penentuan ide aplikasi proyek (kelompok/mandiri).
  * Penyusunan alur pengguna (*User Flow*).
  * Pembuatan sketsa layar (*Wireframe / Low-Fidelity*).
* **Target Output:** Dokumen ideasi dan sketsa alur aplikasi (*User Flow*).

#### **Minggu 3: Bikin Design System di Figma**
* **Materi & Aktivitas:** 
  * Pengenalan interface dan tools dasar Figma (Frame, Shapes, Text, Vector).
  * Pembentukan *Design System*: Penentuan standar warna (Hex Palette), *Typography Styles*, dan *Iconography*.
* **Target Output:** Halaman *Design System* di Canvas Figma.

#### **Minggu 4: Desain Visual (Hi-Fi)**
* **Materi & Aktivitas:** 
  * Penerapan *Design System* ke tampilan asli aplikasi (*Splash, Auth/Login, Home, Detail, Profile*).
  * Penggunaan fitur *Auto Layout*, *Constraints*, dan *Grid System* agar tata letak rapi dan responsif.
* **Target Output:** Desain visual *High-Fidelity* (Hi-Fi) 5 layar utama.

#### **Minggu 5: Bikin Prototype Interaktif**
* **Materi & Aktivitas:** 
  * Menghubungkan antar-layar (*Screen Transitions*).
  * Penggunaan *Component*, *Variants*, dan *Micro-interactions* (efek tombol klik, hover, dan overlay).
* **Target Output:** *Interactive Prototype* Figma yang siap diuji.

#### **Minggu 6: Uji Desain (Usability Testing)**
* **Materi & Aktivitas:** 
  * Simulasi pengujian prototype ke calon pengguna/rekan sekelas (*Usability Testing*).
  * Evaluasi umpan balik mengenai tata letak dan keterbacaan antarmuka.
  * Perbaikan dan penyempurnaan desain.
* **Target Output:** Laporan singkat pengujian dan file Figma terevisi.

#### **Minggu 7: Serah Terima Desain (Design Hand-Off)**
* **Materi & Aktivitas:** 
  * Penguncian desain akhir (*Design Hand-off preparation*).
  * Pencatatan spesifikasi desain: ukuran font, jarak margin/padding, border radius, dan kode warna.
  * Ekspor aset visual (gambar PNG/JPEG, ikon SVG).
* **Target Output:** Aset visual terekspor dan lembar panduan spesifikasi slicing.

---

#### 🏆 **Pertemuan 8: Ujian Tengah Semester (UTS)**
* **Bentuk Evaluasi:** Presentasi Proyek & Demo *Interactive Prototype* Figma.
* **Komponen Penilaian:** Kejelasan ide produk/User Flow, kerapian *Design System* & *Auto Layout*, dan kelancaran interaksi prototype.
* **Output Evaluasi:** Link Prototype Figma yang disetujui untuk di-slicing ke kode Flutter.

---

### **Fase 2: Slicing Kode UI (Flutter)**

#### **Minggu 9: Setup Project & Aset**
* **Materi & Aktivitas:** 
  * Sintaks dasar bahasa Dart yang sering digunakan pada UI (Tipe data, Class, Constructor).
  * Memahami struktur folder project Flutter (`lib/`, `assets/`).
  * Mendaftarkan gambar, ikon, dan font kustom dari Figma ke file `pubspec.yaml`.
* **Target Output:** Project Flutter baru dengan konfigurasi aset & font yang sukses termuat.

#### **Minggu 10: Slicing 1 - Layout Dasar**
* **Materi & Aktivitas:** 
  * Memahami konsep *"Everything is a Widget"*.
  * Menggunakan core layout widgets: `Container`, `Column`, `Row`, `Padding`, `Center`, dan `SizedBox`.
  * Slicing halaman pertama (*Splash Screen* / *Welcome Screen*).
* **Target Output:** Kode Flutter halaman *Splash / Welcome Screen*.

#### **Minggu 11: Slicing 2 - Form Input & Tombol**
* **Materi & Aktivitas:** 
  * Pembuatan komponen masukan pengguna: `TextField`, `TextFormField`.
  * Custom styling tombol: `ElevatedButton`, `OutlinedButton`, `TextButton`.
  * Penyesuaian warna, shadow, border, dan *border radius* sesuai Figma.
* **Target Output:** Kode Flutter halaman *Login* dan *Register*.

#### **Minggu 12: Slicing 3 - Tampilan List (Scrollable)**
* **Materi & Aktivitas:** 
  * Penanganan tampilan berulang (*List*): `ListView`, `ListView.builder`, dan `GridView`.
  * Membuat komponen *Card* statis menggunakan data dummy (*List of Maps / Objects* statis).
* **Target Output:** Kode Flutter halaman *Home / Dashboard* dengan daftar item yang dapat di-scroll.

#### **Minggu 13: Slicing 4 - Rapikan Kode (Modular Widget)**
* **Materi & Aktivitas:** 
  * Teknik *Clean Code* & Refactoring UI: Memecah kode panjang menjadi komponen kecil.
  * Penggunaan `StatelessWidget` untuk membuat *Custom Widgets* (misal: Custom Button, Custom Card).
  * Penyusunan folder `widgets/` agar kode terstruktur dan *reusable*.
* **Target Output:** Folder `widgets/` berisi komponen-komponen modular.

#### **Minggu 14: Navigasi Antar-Halaman**
* **Materi & Aktivitas:** 
  * Mengimplementasikan rute navigasi: `Navigator.push`, `Navigator.pop`, dan `Navigator.pushReplacement`.
  * Pembuatan menu utama: `BottomNavigationBar` atau `TabBar`.
* **Target Output:** Seluruh halaman aplikasi terhubung satu sama lain sesuai alur prototype Figma.

#### **Minggu 15: Finetuning Visual & Build APK**
* **Materi & Aktivitas:** 
  * Penyesuaian detail layout agar presisi 1:1 (*Pixel-Perfect*) dengan Figma.
  * Visual debugging (menghilangkan error *Overflown Pixel* / banner kuning-hitam).
  * Kompilasi proyek menjadi file installer `.apk` (Android).
* **Target Output:** File installer `.apk` aplikasi yang siap diinstal di HP.

---

#### 🏆 **Pertemuan 16: Ujian Akhir Semester (UAS)**
* **Bentuk Evaluasi:** Demo Aplikasi di HP/Emulator & *Code Review*.
* **Komponen Penilaian:** Tingkat kemiripan visual (*Pixel-Perfect*) terhadap Figma UTS, kerapian struktur kode (*Modular Widgets*), kelancaran navigasi, dan keberhasilan build file APK.
* **Output Evaluasi:** Repository GitHub (Source Code Flutter) & File `.apk`.

---

## 📊 Skema Penilaian

| Komponen Penilaian | Persentase |
| :--- | :---: |
| **Tugas Praktikum Mingguan (14 Minggu x 7.14%)** | 40% |
| **Ujian Tengah Semester (UTS - Figma Prototype)** | 25% |
| **Ujian Akhir Semester (UAS - Flutter UI Slicing & APK)** | 35% |
| **Total** | **100%** |