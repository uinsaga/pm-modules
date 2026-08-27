# Pertemuan 1: Pengenalan Mobile Dev, Konsep UI/UX, & Anatomi Desain

**Kembali ke:** [Daftar Isi](../../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Menjelaskan perbedaan arsitektur pengembangan aplikasi mobile (*Native* vs *Cross-Platform*).
2. Membedakan peran **UI (User Interface)** dan **UX (User Experience)** dalam produk digital.
3. Memahami hirarki perancangan antarmuka: **Wireframe**, **Mockup**, hingga **Prototype**.
4. Mengidentifikasi komponen anatomi visual pada aplikasi mobile modern.
5. Membentuk kelompok proyek dan menentukan ideasi awal aplikasi yang akan dikembangkan sepanjang semester.

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Teori Pendahuluan** | 45 Menit | Pemaparan Industri Mobile Dev, Konsep UI vs UX, & Terminologi Desain | Pemahaman Konsep Dasar |
| **Sesi 2: Bedah Anatomi App** | 35 Menit | Analisis Komponen Visual Aplikasi Populer (Gojek / Tokopedia / Spotify) | Catatan Komponen UI |
| **Sesi 3: Diskusi Kelompok** | 50 Menit | Pembentukan Kelompok & Brainstorming Kategori Aplikasi Proyek | Lembar Kerja Ideasi |
| **Sesi 4: Wrap-up & Briefing** | 20 Menit | Review Hasil Diskusi & Preparation Output Minggu 2 (Wireframing) | Arahan Tugas Mingguan |

---

## 📖 1. Materi Utama (45 Menit)

### A. Lanskap Mobile Development Modern
Dalam dunia industri pengembangan aplikasi mobile, terdapat dua pendekatan utama dalam memilih *tech stack*:

#### 1. Native Development
Mengembangkan aplikasi menggunakan bahasa dan *framework* resmi yang disediakan oleh pemilik platform (Apple atau Google).
* **Teknologi:** Swift / Objective-C (iOS), Kotlin / Java (Android).
* **Kelebihan:** 
  * Performa maksimal karena kode langsung berkomunikasi dengan sistem operasi.
  * Akses cepat dan penuh ke seluruh fitur perangkat (Kamera, Bluetooth, GPS, Sensors).
  * UI yang mengikuti standar *guideline* resmi platform (Apple Human Interface / Google Material Design).
* **Kekurangan:** 
  * *Cost* dan waktu pengembangan tinggi karena harus mengelola 2 tim dan 2 *codebase* terpisah.

#### 2. Cross-Platform Development
Menulis satu basis kode (*single codebase*) yang dapat dikompilasi untuk berjalan di platform Android dan iOS sekaligus.
* **Teknologi:** **Flutter (Dart)**, React Native (JavaScript/TypeScript).
* **Keunggulan Flutter:** 
  * **Hot Reload:** Perubahan kode langsung terlihat di layar dalam hitungan detik.
  * **Consistent UI:** Menampilkan visual yang identik di berbagai ukuran dan jenis perangkat HP.
  * **Near-Native Performance:** Menggunakan mesin render grafis (Impeller/Skia) sendiri tanpa melewati jalur *bridge* yang lambat.

---

### B. UI (User Interface) vs UX (User Experience)
Dua istilah ini sering kali tertukar, padahal memiliki fokus dan peran yang sangat berbeda namun saling melengkapi:

| Parameter | UI (User Interface) | UX (User Experience) |
| :--- | :--- | :--- |
| **Fokus Utama** | Estetika Visual & Keindahan | Kemudahan, Logika, & Kenyamanan |
| **Pertanyaan Kunci** | *"Apakah tampilan aplikasi ini estetik dan menarik?"* | *"Apakah pengguna mudah menyelesaikan masalahnya?"* |
| **Elemen Utama** | Warna, Tipografi, Icons, Spacing, Buttons | User Journey, Wireframe, Architecture Information, Usability |
| **Analogi** | Warna cat, bentuk jok, dan desain bodi mobil | Kemudahan setir diputar, posisi pedal, dan rasa nyaman saat berkendara |

---

### C. Evolusi Desain: Wireframe ➡️ Mockup ➡️ Prototype

Untuk menghindari pemborosan waktu saat *coding*, industri menggunakan 3 tahap perancangan visual:

```text
[ Wireframe ]          ➡️        [ Mockup ]          ➡️        [ Prototype ]
(Low-Fidelity)                 (High-Fidelity)               (Interactive)
Sketsa struktur &             Desain visual fix             Desain visual +
tata letak kasar              (Warna, Font, Gambar)         Interaksi & Klik

```

1. **Wireframe (Low-Fidelity):**
* Cetak biru (*blueprint*) kasar berbentuk garis hitam-putih dan kotak-kotak *placeholder*.
* **Tujuan:** Berfokus murni pada hirarki informasi dan tata letak tanpa terdistraksi oleh warna atau estetika.


2. **Mockup (High-Fidelity):**
* Hasil akhir tampilan visual aplikasi yang presisi (*pixel-perfect*).
* Menampilkan skema warna asli, tipografi pilihan, gambar resolusi tinggi, dan ikonografi lengkap (statis / belum bisa diklik).


3. **Prototype (Interactive):**
* Mockup statis yang telah diberi alur interaksi (bisa diklik, transisi antar layar, efek *hover*, *scrollable view*).
* **Tujuan:** Menguji alur aplikasi secara nyata di Figma sebelum diserahkan ke *developer* untuk di-koding.



---

## 🛠️ 2. Alur Kerja Proyek Kuliah (Figma to Flutter)

Di mata kuliah ini, kita akan menerapkan alur kerja standar industri *Product Development*:

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        PHASE 1: FIGMA STUDIO                           │
│  [ Ide Produk ] ➔ [ User Flow ] ➔ [ Wireframe ] ➔ [ Design System ]    │
│                                                          │             │
│                                            [ Interactive Prototype ]   │
└──────────────────────────────────────────────────────────┬─────────────┘
                                                           │ (UTS Hand-Off)
┌──────────────────────────────────────────────────────────▼─────────────┐
│                        PHASE 2: FLUTTER LAB                            │
│  [ Setup Project ] ➔ [ Basic Widgets ] ➔ [ Slicing Layout UI Kode ]    │
│                                                          │             │
│                                                   [ Build APK Release ]│
└────────────────────────────────────────────────────────────────────────┘

```

---

## 🔍 3. Bedah Anatomi Komponen UI Mobile (35 Menit)

Saat merancang aplikasi mobile, antarmuka dibentuk oleh komponen-komponen standar berikut:

1. **Top Bar / App Bar:** Area paling atas yang menampilkan judul halaman, tombol *back*, atau aksi utama (*search/notification*).
2. **Hero Section / Banner:** Area visual utama untuk menarik perhatian pengguna (berisi promosi, kartu pengumuman, atau *highlight*).
3. **Card Container:** Elemen pembungkus (*box*) untuk mengelompokkan informasi terkait (contoh: 1 produk = foto + judul + harga).
4. **Bottom Navigation Bar:** Navigasi utama di bagian bawah layar untuk berpindah antar halaman utama (biasanya terdiri dari 3–5 menu).
5. **Floating Action Button (FAB):** Tombol melayang untuk aksi paling penting di layar tersebut (contoh: Tombol `+` Tambah Chat di WhatsApp).

---

## 👥 4. Aktivitas Kelas & Diskusi Kelompok (50 Menit)

### Instruksi Pembentukan Kelompok:

1. Bentuk kelompok berisi **2–3 Mahasiswa**.
2. Diskusikan dan tentukan **Kategori Aplikasi** yang akan dibuat.
* *Contoh Kategori:* E-Commerce, Food Delivery, Travel Booking, Personal Finance Tracker, Event Management, Health & Fitness.



### Lembar Kerja Ideasi (Isi bersama kelompok):

* **Nama Proyek Aplikasi:** *(Contoh: Travelo - App Booking Wisata)*
* **Target Pengguna:** *(Contoh: Traveler muda / Backpacker)*
* **Masalah yang Diselesaikan:** *(Contoh: Kesulitan menemukan destinasi wisata tersembunyi yang terjangkau)*
* **Daftar 5 Layar Utama yang Akan Dibuat:**
1. *Splash Screen / Welcome Screen*
2. *Authentication (Login / Register)*
3. *Home / Main Dashboard*
4. *Detail Item View*
5. *User Profile / Settings Page*



---

## 📝 Checkpoint & Tugas Minggu 1

Sebelum masuk ke **Pertemuan 2 (Ideasi Aplikasi, User Flow & Wireframing)**, pastikan checklist berikut sudah terpenuhi:

* [ ] Kelompok proyek (2–3 orang) sudah terdaftar resmi.
* [ ] Lembar kerja ideasi aplikasi (Nama, Target User, dan 5 Layar Utama) sudah diisi.
* [ ] Setiap anggota kelompok menyiapkan buku sketsa / alat tulis / tablet untuk membuat **Wireframe Low-Fi** di pertemuan berikutnya.
* [ ] Memastikan seluruh anggota kelompok sudah memiliki akun [Figma](https://www.figma.com).
