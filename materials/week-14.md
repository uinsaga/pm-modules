# Pertemuan 14: Final Review App Architecture & Gelar Karya Studio (Showcase)

**Kembali ke:** [Daftar Isi](../../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Melakukan **Code Audit** dan **Refactoring** akhir untuk memastikan kebersihan struktur kode (*Clean Code* & *Folder Structure*).
2. Memeriksa performa aplikasi, penanganan *error state*, serta memastikan ketiadaan *memory leak* atau *UI overflow*.
3. Mempresentasikan hasil karya aplikasi *High-Fidelity* yang telah terintegrasi dengan *State Management* dinamis.
4. Memberikan dan menerima *feedback* konstruktif melalui sesi **Peer Review & Gelar Karya Studio**.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Briefing & Check-list Audit** | 20 Menit | Pemaparan kriteria evaluasi arsitektur & persiapan showcase akhir | Check-list Audit Kode |
| **Sesi 2: Final Polishing & Refactoring** | 30 Menit | Pembersihan *warning/lints*, *formatting*, dan optimasi eksekusi Flutter | Repository Code Clean |
| **Sesi 3: Gelar Karya & Demo Aplikasi** | 80 Menit | Presentasi individu/tim, pengujian live demo aplikasi di dev-device/emulator | Demo & Presentation |
| **Sesi 4: Wrap-up & Ulasan Akhir** | 20 Menit | Rangkuman capaian pembelajaran semester dan pengumpulan artefak akhir | Pengesahan Nilai Studio |

---

## 📖 1. Materi Utama & Audit Check-list (20 Menit)

### A. Kriteria Kebersihan Kode (Clean Code Standard)
Sebelum melakukan demo karya, pastikan proyek memenuhi standar berikut:

1. **Folder Structure:** Pemisahan file yang tegas antara `core` (constants, models, providers, widgets) dan `features` (auth, home, detail, profile).
2. **Zero Linter Warnings:** Tidak ada pesan peringatan *unused imports*, variabel yang tidak digunakan, atau hilangnya anotasi `const` pada widget statis.
3. **DRY Principle:** Tidak ada duplikasi kode styling (seperti warna atau tombol utama) yang dibuat ulang di luar komponen reusable.
4. **State Isolation:** Logika manipulasi data tersimpan di class *Provider*, bukan di dalam file antarmuka UI (`Widget Build`).

---

### B. Matriks Evaluasi Gelar Karya

```text
[ Desain Figma (W4-5) ] ──► [ Slicing UI (W9-12) ] ──► [ State Provider (W13) ]
           │                         │                         │
           ▼                         ▼                         ▼
   Konsistensi Layout       Presisi Visual & Layout    Respon Reaktif Dinamis

```

---

## 🛠️ 2. Aktivitas Praktik Studio (110 Menit)

### Tahap 1: Final Code Refactoring & Cleanup (30 Menit)

Jalankan perintah berikut di terminal untuk memeriksa kesehatan sintaks dan merapikan format kode:

```bash
# 1. Format ulang seluruh file dart agar rapi
flutter format .

# 2. Periksa error sintaks dan warning dari linter
flutter analyze

```

**Perbaikan Rutin Linter Warning:**

* Tambahkan kata kunci `const` pada widget yang tidak berubah untuk menghemat penggunaan memori rendering:
```dart
// Sebelum Refactor
Text('Katalog Produk', style: TextStyle(fontSize: 18))

// Setelah Refactor
const Text('Katalog Produk', style: TextStyle(fontSize: 18))

```


* Hapus import yang tidak terpakai (*Unused Imports*) di seluruh layar.

---

### Tahap 2: Gelar Karya & Showcase Demo (80 Menit)

Setiap mahasiswa/tim mempresentasikan aplikasi di depan Dosen & Asisten Lab selama **3-5 menit** dengan alur demo berikut:

1. **Alur Otentikasi:** Tunjukkan layar *Splash Screen*, validasi input pada *Login Screen*, dan transisi ke halaman utama.
2. **Main Navigation:** Tunjukkan fungsi navigasi *BottomNavigationBar* berjalan mulus antar tab.
3. **Layar Katalog & Detail:** Tunjukkan scroll list horizontal/grid vertikal pada *Home Screen* dan navigasi menuju *Detail Screen*.
4. **Interaksi State Dinamis:** Demonstrasikan penambahan item ke *Keranjang Belanja* / *Favorit*, tunjukkan pembaruan badge angka secara real-time.
5. **Kesesuaian Figma:** Tunjukkan perbandingan bersandingan (*side-by-side*) antara prototype Figma dengan aplikasi Flutter yang berjalan.

---

## 🔍 3. Asistensi, Peer Review & Pengesahan (20 Menit)

* **Pengumpulan Repositori:** Pastikan kode terbaru telah di-*push* ke repositori GitHub masing-masing dengan *commit message* yang rapi.
* **Verifikasi Akhir:** Dosen/Asisten Lab menandatangani lembar pengesahan kelengkapan modul praktikum Pertemuan 1 hingga 14.

---

## 📝 Checkpoint & Pengumpulan Akhir Studio

* [ ] Bebas dari *linter warnings* dan *formatting errors* (`flutter analyze` bersih).
* [ ] Repositori GitHub ter-update dengan struktur folder standar produksi.
* [ ] Demonstrasi aplikasi berjalan lancar di emulator atau perangkat fisik tanpa *crash*.
* [ ] Seluruh tugas dan artefak praktikum Pertemuan 1–14 **Telah Selesai dan Diverifikasi**.
