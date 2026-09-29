# Handout Pertemuan 4: Pengenalan Flutter, Dasar Bahasa Dart, Arsitektur, Setup Environment, dan Running Aplikasi Pertama

**Mata Kuliah:** Pemrograman Mobile

**Modul:** Pertemuan 4

**Topik Utama:** Pengenalan Flutter & Dart, Arsitektur Flutter, Instalasi Development Environment, Struktur Project, dan Menjalankan Aplikasi Pertama

---

## 1. Pengenalan Framework Mobile & Flutter

### 1.1 Pendekatan Pengembangan Aplikasi Mobile

Dalam industri perangkat lunak modern, terdapat tiga pendekatan utama untuk merancang dan membangun aplikasi mobile:

1. **Native Development**
* **Deskripsi:** Pembangunan aplikasi khusus untuk satu platform tertentu menggunakan *Software Development Kit* (SDK), bahasa, dan IDE resmi dari penyedia platform.
* **Android:** Bahasa Kotlin / Java, IDE Android Studio.
* **iOS:** Bahasa Swift / Objective-C, IDE Xcode.


* **Kelebihan:** Performa maksimal dan akses penuh ke seluruh API hardware (GPS, Bluetooth, Kamera, Sensor, Biometrik).
* **Kekurangan:** Membutuhkan dua *codebase* (basis kode) dan dua tim terpisah, sehingga meningkatkan biaya dan waktu pengembangan serta perawatan.


2. **Hybrid / Web-Based Development**
* **Deskripsi:** Aplikasi dibangun menggunakan teknologi web dasar (HTML5, CSS, JavaScript) lalu dibungkus (*wrapped*) menggunakan komponen *native container* atau *WebView* (contoh: Apache Cordova, Ionic).
* **Kelebihan:** Landas belajar (*learning curve*) sangat landai bagi *web developer*; satu basis kode untuk berbagai platform.
* **Kekurangan:** Performa cenderung lebih lambat karena keterbatasan lapisan *WebView* dan eksekusi JavaScript untuk antarmuka (*UI*) yang kompleks.


3. **Cross-Platform / Multi-Platform (Native-Like Rendering)**
* **Deskripsi:** Solusi modern yang memungkinkan penulisan satu basis kode (*Single Codebase*) yang dikompilasi menjadi kode native atau digambar langsung ke layar menggunakan *custom rendering engine*.
* **Contoh Utama:**
* **React Native:** Menggunakan JavaScript/TypeScript yang berkomunikasi dengan komponen UI native melalui jalur *bridge*.
* **Flutter:** Menggunakan bahasa **Dart** dan menggambar seluruh komponen UI secara independen menggunakan *rendering engine* tingkat tinggi.





---

### 1.2 Apa itu Flutter?

**Flutter** adalah *open-source UI Software Development Kit (SDK)* yang dikembangkan oleh **Google**. Flutter memungkinkan pengembang membangun aplikasi yang terkompilasi secara native untuk berbagai platform—Android, iOS, Web, Windows, macOS, dan Linux—hanya dengan menggunakan **satu basis kode** (*Single Codebase*).

---

### 1.3 Hubungan Antara Flutter dan Dart

Sering timbul pertanyaan: *"Apakah Flutter dan Dart itu sama?"* Keduanya adalah dua teknologi yang berbeda namun saling melengkapi:

```text
+-----------------------------------------------------------------------+
|                              FLUTTER                                  |
| (UI Framework, Catalog Widget, Layout Engine, Impeller/Skia Renderer) |
+-----------------------------------------------------------------------+
                                   |
                          Menggunakan Bahasa
                                   v
+-----------------------------------------------------------------------+
|                                DART                                   |
| (Bahasa Pemrograman, Type System, Garbage Collector, VM, Compiler)    |
+-----------------------------------------------------------------------+

```

* **Dart** adalah **bahasa pemrogramannya**. Dart menangani logika bisnis, struktur data, variabel, fungsi, serta konsep *Object-Oriented Programming* (OOP).
* **Flutter** adalah **framework UI-nya**. Flutter menyediakan koleksi komponen visual (*Widget* seperti Button, Text, Image, Layout) yang dirangkai menggunakan sintaks bahasa Dart.

---

### 1.4 Kenapa Flutter Menggunakan Bahasa Dart?

Google memilih dan mengembangkan Dart khusus untuk Flutter karena beberapa keunggulan teknis:

1. **Dukungan Dua Jenis Kompilasi (JIT & AOT):**
* **JIT (Just-In-Time Compilation):** Digunakan pada tahap pengembangan (*development*). Kode dieksekusi secara instan, memungkinkan fitur **Hot Reload** (perubahan kode muncul di layar dalam hitungan milidetik tanpa mereset kondisi aplikasi).
* **AOT (Ahead-Of-Time Compilation):** Digunakan saat perilisan (*production*). Kode Dart dikompilasi langsung menjadi kode mesin native (*ARM / x86 machine code*), sehingga startup aplikasi sangat cepat dan performa mulus.


2. **Object-Oriented & Strongly Typed:** Memudahkan pengelolaan basis kode skala besar serta mencegah error runtime.
3. **Single-Threaded dengan Event Loop:** Mengatur animasi dan tugas asinkron (*asynchronous*) secara efisien tanpa masalah *thread contention*.
4. **Sound Null Safety:** Mencegah terjadinya error *Null Pointer Exception* (*crash*) saat aplikasi dijalankan.

---

### 1.5 Sejarah dan Evolusi Flutter

* **2015 (Project Sky):** Dipublikasikan pertama kali pada *Dart Developer Summit 2015* dengan target merender antarmuka grafis pada kecepatan 120 FPS di sistem operasi Android.
* **2017 (Alpha Release):** Google mengumumkan status Flutter versi Alpha secara global pada Google I/O 2017.
* **Desember 2018 (Flutter 1.0):** Versi stabil pertama resmi dirilis untuk pengembangan aplikasi mobile (Android dan iOS).
* **Mei 2021 (Flutter 2.0):** Membawa dukungan resmi (*stable support*) untuk Web & Desktop, serta memperkenalkan fitur *Sound Null Safety* pada bahasa Dart.
* **Mei 2022 (Flutter 3.0):** Penyempurnaan dukungan lintas 6 platform secara native dan pengenalan *rendering engine* baru bernama **Impeller** (menggantikan Skia).

---

### 1.6 Komparasi Framework Pemrograman Mobile

| Parameter | Native (Android/iOS) | React Native | Flutter |
| --- | --- | --- | --- |
| **Bahasa Pemrograman** | Kotlin / Swift | JavaScript / TypeScript | **Dart** |
| **Pengembang / Pemilik** | Google (Android) / Apple (iOS) | Meta (Facebook) | Google |
| **Pendekatan Rendering UI** | Komponen Native OS | Komponen Native via *Bridge* | *Custom Engine Canvas* (Skia/Impeller) |
| **Kecepatan & Performa** | Maksimal (Native) | Sangat Baik | Sangat Tinggi (Terkompilasi ke Machine Code) |
| **Konsistensi Tampilan** | Berbeda mengikuti standar OS | Mengikuti gaya native OS masing-masing | Sama persis (*Pixel-Perfect*) di semua platform |
| **Single Codebase** | Tidak | Ya (Mobile, Web) | Ya (Mobile, Web, Desktop) |
| **Fitur Hot Reload** | Apply Changes (Kurang Cepat) | Fast Refresh (Cepat) | **Hot Reload (< 1 detik)** |

---

- [Comparison 2026](https://flutterindia.in/blog/flutter-vs-other-frameworks-complete-comparison-guide/)
- 

## 2. Arsitektur Berlapis Flutter (Layered Architecture)

Untuk memahami bagaimana Flutter menggambar piksel di layar dan mengeksekusi kode, perhatikan arsitektur berlapis (*Layered Architecture*) Flutter berikut:

```text
+-----------------------------------------------------------------------+
| 1. FRAMEWORK LAYER (Dart)                                             |
|    - Material / Cupertino (UI Guidelines)                             |
|    - Widgets (Stateless, Stateful, Inherited)                         |
|    - Rendering (RenderObject Tree, Layout, Painting)                  |
|    - Animation, Painting, Gestures                                    |
|    - Foundation (Core Classes, Async, Services)                       |
+-----------------------------------------------------------------------+
                                   │
                                   ▼
+-----------------------------------------------------------------------+
| 2. ENGINE LAYER (C / C++)                                             |
|    - Impeller / Skia (2D Graphic Rendering Engine)                    |
|    - Dart Runtime (Garbage Collection, AOT/JIT Compilers)             |
|    - Text Layout Engine (Libtxt / HarfBuzz)                           |
|    - Platform Channels Architecture                                   |
+-----------------------------------------------------------------------+
                                   │
                                   ▼
+-----------------------------------------------------------------------+
| 3. EMBEDDER LAYER (Platform Specific)                                 |
|    - Surface Creation (OpenGL, Vulkan, Metal, DirectX)                |
|    - Thread Setup & Lifecycle Management                              |
|    - Input Event Dispatcher (Touch, Mouse, Keyboard)                  |
|    - Target: Android (Java/Kotlin), iOS (Swift), Web/Desktop          |
+-----------------------------------------------------------------------+

```

### 2.1 Penjelasan Detail 3 Lapisan Utama

#### A. Layer 1: Framework (Tertulis dalam Bahasa Dart)

Lapisan paling atas yang berinteraksi langsung dengan pengembang (*developer*):

1. **Material & Cupertino:** Pustaka komponen antarmuka bawaan. *Material* mengikuti aturan desain Google/Android, sedangkan *Cupertino* mengikuti aturan desain iOS/Apple.
2. **Widgets Layer:** Blok pembangun utama antarmuka. Segala sesuatu yang terlihat maupun pengatur tata letak adalah *Widget*.
3. **Rendering Layer:** Lapisan yang bertanggung jawab menghitung ukuran (*layout*), posisi, dan menggambar objek visual (*RenderObject Tree*).
4. **Animation, Painting, Gestures:** Menyediakan abstraksi untuk mengolah animasi, efek visual, serta masukan sentuhan (*touch/gesture events*).
5. **Foundation:** Pustaka kelas dasar seperti penanganan data *async*, pengikatan (*binding*), dan utility.

#### B. Layer 2: Flutter Engine (Tertulis dalam C / C++)

Core/Inti dari Flutter yang menangani tugas pemrosesan berat:

* **Impeller / Skia:** Engine grafis 2D yang bertugas menggambar setiap piksel langsung ke layar perangkat.
* **Dart Runtime Management:** Mengelola eksekusi kode Dart, alokasi memori, *Garbage Collection*, serta proses kompilasi (AOT dan JIT).
* **Text Layout:** Mengelola penderetan teks dan pemrosesan font tingkat tinggi.
* **Platform Channels:** Jalur komunikasi antara kode Dart dan kode native platform.

#### C. Layer 3: Embedder Layer (Platform-Specific)

Lapisan paling bawah yang disesuaikan dengan sistem operasi tempat aplikasi dijalankan:

* Menggunakan kode native: Java/Kotlin (Android), Objective-C/Swift (iOS), C++ (Desktop).
* **Fungsi Utama:** Membuat dan mengelola permukaan gambar (*render surface*/canvas), mengatur *lifecycle* aplikasi, serta menyalurkan input perangkat (keyboard, mouse, layar sentuh) ke Flutter Engine.

---

### 2.2 Tiga Pohon Internal Flutter (The Three Trees)

Untuk menghasilkan performa render yang sangat cepat (60–120 FPS), Flutter secara internal mengelola 3 jenis struktur pohon:

```text
[ WIDGET TREE ]  ──►  [ ELEMENT TREE ]  ──►  [ RENDER OBJECT TREE ]
(Konfigurasi UI)      (Penghubung & State)     (Komputasi Layout & Pixel)

```

1. **Widget Tree (Konfigurasi):** Pohon berisi deklarasi UI yang ditulis oleh developer. Bersifat *immutable* (tidak dapat diubah) dan sangat ringan.
2. **Element Tree (Manajemen / Context):** Pohon penengah yang menghubungkan Widget dengan RenderObject. Element menyimpan kondisi (*state*) dan menentukan widget mana yang perlu diperbarui saat terjadi perubahan data.
3. **RenderObject Tree (Visual Nyata):** Pohon yang melakukan perhitungan teknis ukuran (*size*), posisi (*layout*), dan menggambar piksel (*painting*) secara nyata di layar.

---

## 3. Dasardasar Bahasa Pemrograman Dart

Sebelum membuat antarmuka di Flutter, berikut adalah konsep dan sintaks dasar bahasa **Dart** yang wajib dipahami.

### 3.1 Fungsi Utama (`main`)

Setiap program Dart membutuhkan fungsi `main()` sebagai titik awal eksekusi.

```dart
void main() {
  print("Selamat datang di Pemrograman Dart & Flutter!");
}

```

---

### 3.2 Variabel & Tipe Data

Dart bersifat *strongly typed*, namun mendukung pendeteksian tipe data otomatis menggunakan kata kunci `var`.

```dart
void main() {
  // Deklarasi Eksplisit
  String nama = "Budi";
  int umur = 20;
  double ipk = 3.75;
  bool isMahasiswa = true;

  // Type Inference (tipe data terdeteksi otomatis)
  var kota = "Semarang"; // Terdeteksi sebagai String

  // Variabel Konstanta (Nilai tidak dapat diubah)
  final String nim = "22001001"; // Diisi saat runtime
  const double pi = 3.14;        // Diisi saat kompilasi

  print("Nama: $nama, Umur: $umur tahun, IPK: $ipk");
}

```

---

### 3.3 Konsep Sound Null Safety

Di dalam Dart, variabel secara default **tidak boleh bernilai `null**`. Tanda tanya (`?`) digunakan untuk menandai variabel yang boleh bernilai kosong.

```dart
void main() {
  String nama = "Andi"; 
  // nama = null; // ERROR: Tidak diperbolehkan

  String? namaKucing; // Boleh bernilai null
  namaKucing = null;   // Valid

  // Null-aware operator (memberikan nilai default jika null)
  print(namaKucing?.length ?? "Nama kucing belum diisi");
}

```

---

### 3.4 Fungsi (Function) & Named Parameters

Di Flutter, sebagian besar Widget menerima properti berupa *Named Parameters*.

```dart
// Fungsi dengan Named Parameters & Required Keyword
void sapaUser({required String nama, int umur = 17}) {
  print("Halo $nama, umur Anda $umur tahun.");
}

void main() {
  // Pemanggilan fungsi menggunakan nama parameter
  sapaUser(nama: "Siti", umur: 20);
}

```

---

### 3.5 Pemrograman Berorientasi Objek (OOP) di Dart

Semua komponen di Flutter adalah objek yang diturunkan dari *Class*.

```dart
class Mahasiswa {
  String nama;
  String nim;

  // Constructor
  Mahasiswa({required this.nama, required this.nim});

  void tampilkanInfo() {
    print("Mahasiswa: $nama ($nim)");
  }
}

void main() {
  // Instansiasi Objek
  Mahasiswa mhs1 = Mahasiswa(nama: "Rian", nim: "22001002");
  mhs1.tampilkanInfo();
}

```

---

## 4. Prasyarat Sistem & Perangkat Lunak

Sebelum melakukan setup environment, pastikan spesifikasi perangkat komputer/laptop memenuhi kriteria berikut:

### Spesifikasi Hardware Minimum & Rekomendasi

* **Prosesor (CPU):** Intel Core i5 / AMD Ryzen 5 / Apple Silicon (M1/M2/M3/M4) atau setara.
* **RAM:**
* *Minimum:* 8 GB.
* *Rekomendasi:* 16 GB atau lebih.


* **Penyimpanan (Disk):** SSD dengan sisa ruang kosong minimal **15 GB - 20 GB**.

### Perangkat Lunak Utama

1. **Git:** Diperlukan oleh Flutter SDK untuk manajemen versi internal.
2. **Visual Studio Code (VS Code):** Text editor utama.
3. **Web Browser (Google Chrome / Microsoft Edge):** Perangkat target eksekusi terringan selama pembelajaran dasar.

---

## 5. Panduan Instalasi & Setup Environment

---

### 5.1 Panduan Instalasi di Windows

#### Langkah 1: Instalasi Git untuk Windows

1. Unduh installer Git dari situs resmi: [https://git-scm.com/downloads](https://www.google.com/search?q=https://git-scm.com/downloads&utm_source=gemini).
2. Jalankan file `.exe` dan selesaikan langkah instalasi dengan pilihan default.
3. Verifikasi di Command Prompt: `git --version`.

#### Langkah 2: Unduh & Ekstrak Flutter SDK (Termasuk Dart SDK)

> **Catatan:** Dart SDK sudah dikemas **secara otomatis di dalam Flutter SDK**. Tidak perlu mengunduh Dart SDK secara terpisah.

1. Unduh berkas ZIP Flutter SDK versi *Stable* dari [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows?utm_source=gemini).
2. Buat folder baru `C:\src\`.
3. Ekstrak file ZIP hingga lokasi folder menjadi `C:\src\flutter`.
> **PERHATIAN PENTING:** **Jangan** mengekstrak Flutter di dalam `C:\Program Files\` karena memerlukan hak akses administrator yang dapat memicu error permission.



#### Langkah 3: Konfigurasi PATH Environment Variable

1. Tekan **Windows + S**, ketik `env`, pilih **Edit the system environment variables**.
2. Klik tombol **Environment Variables...**.
3. Pada tabel **User variables**, cari variabel `Path`, pilih lalu klik **Edit...**.
4. Klik **New**, lalu tambahkan lokasi folder `bin` Flutter:
```text
C:\src\flutter\bin

```


5. Klik **OK** pada semua jendela terbuka.

---

### 5.2 Panduan Instalasi di macOS

1. Unduh Flutter SDK sesuai arsitektur prosesor Mac (Apple Silicon / Intel) dari [https://docs.flutter.dev/get-started/install/macos](https://docs.flutter.dev/get-started/install/macos?utm_source=gemini).
2. Buka **Terminal** dan ekstrak file SDK:
```bash
mkdir -p ~/development
cd ~/development
unzip ~/Downloads/flutter_macos_*.zip

```


3. Tambahkan path Flutter ke file konfigurasi shell (`.zshrc`):
```bash
echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

```



---

### 5.3 Verifikasi Instalasi dengan `flutter doctor`

Buka Terminal / Command Prompt baru, lalu jalankan perintah berikut:

```bash
flutter doctor

```

Perintah ini akan melakukan pemindaian sistem secara menyeluruh.

**Contoh Output Terverifikasi:**

```text
[✓] Flutter (Channel stable, 3.x.x, on Microsoft Windows)
[✓] Windows Version (Installed version of Windows is 10 or higher)
[✓] Chrome - develop for the web
[!] Android toolchain - develop for Android devices (Can be ignored for now)
[✓] VS Code (version 1.8x.x)
[✓] Connected device (2 available)

```

> **Catatan:** Tanda `[!]` pada *Android toolchain* atau *Xcode* **dapat diabaikan** untuk sementara waktu karena tahap awal ini menggunakan target **Chrome/Web Browser**.


## 5.4 Panduan Instalasi Android Toolchain
Untuk menyelesaikan peringatan [!] Android toolchain pada flutter doctor, Anda perlu menginstal Android Studio dan mengonfigurasi Android SDK.

Berikut adalah langkah-langkah penyelesaiannya:
## Langkah 1: Instal Android Studio

   1. Unduh installer resmi dari [android.com](https://developer.android.com/studio).
   2. Jalankan installer dan ikuti wizard setup default. Pastikan opsi Android SDK, Android SDK Platform, dan Android Virtual Device dicentang saat proses instalasi.

## Langkah 2: Instal Android SDK Command-line Tools
Flutter memerlukan komponen command-line ini untuk berinteraksi dengan Android SDK.

   1. Buka Android Studio.
   2. Pada jendela utama (atau menu Settings / Preferences), buka SDK Manager (biasanya di bawah menu More Actions atau Tools > SDK Manager).
   3. Pilih tab SDK Tools.
   4. Cari dan centang opsi Android SDK Command-line Tools (latest).
   5. Klik Apply lalu OK untuk mengunduh dan menginstal komponen tersebut.

## Langkah 3: Setujui Lisensi Android (Android Licenses)
Setelah command-line tools terinstal, Anda harus menyetujui lisensi resmi dari Android.

   1. Buka Terminal (macOS) atau Command Prompt (Windows) baru.
   2. Jalankan perintah berikut:
   
   flutter doctor --android-licenses
   
   3. Tekan y (yes) pada setiap pertanyaan lisensi yang muncul di layar hingga selesai.

## Langkah 4: Verifikasi Ulang
Jalankan kembali perintah verifikasi untuk memastikan statusnya sudah berubah menjadi hijau [✓]:

flutter doctor


---

### 5.5 Konfigurasi Editor (VS Code)

1. Jalankan **Visual Studio Code**.
2. Buka menu **Extensions** (`Ctrl + Shift + X` / `Cmd + Shift + X`).
3. Cari dan pasang ekstensi **Flutter** (diterbitkan oleh `dart-code.org`).
4. Ekstensi **Dart** akan terpasang secara otomatis.

---

## 6. Membuat Project Flutter Pertama

Proyek baru dapat dibuat melalui baris perintah (*Terminal/CLI*) atau fitur antarmuka pada VS Code.

### Opsi A: Melalui Command Line (Terminal / CMD)

1. Buka Terminal / CMD, lalu masuk ke folder kerja:
```bash
cd Documents

```


2. Jalankan perintah pembuat proyek:
```bash
flutter create aplikasi_pertama

```


> **Aturan Penamaan Proyek:** Harus menggunakan huruf kecil semua dan kata dipisahkan tanda *underscore* (`_`) (*snake_case*).


3. Masuk ke folder proyek:
```bash
cd aplikasi_pertama

```



### Opsi B: Melalui VS Code

1. Buka VS Code, tekan `Ctrl + Shift + P` (Windows) / `Cmd + Shift + P` (macOS).
2. Ketik **Flutter: New Project**, tekan **Enter**.
3. Pilih **Application**, tentukan lokasi penyimpanan, lalu masukkan nama `aplikasi_pertama`.

---

## 7. Bedah Struktur Project Flutter

Buka folder `aplikasi_pertama` pada VS Code. Struktur direktori bawaan akan terlihat sebagai berikut:

```text
aplikasi_pertama/
├── .idea/              # Konfigurasi IDE
├── android/            # Kode & konfigurasi native Android (Gradle, Manifest)
├── ios/                # Kode & konfigurasi native iOS (Xcode, Info.plist)
├── web/                # Kontainer web (index.html)
├── windows/            # Runner & konfigurasi native Windows C++
├── macos/              # Runner & konfigurasi native macOS
├── linux/              # Runner & konfigurasi native Linux
├── lib/                # FOLDER UTAMA SELURUH KODE DART & UI
│   └── main.dart       # Titik masuk utama aplikasi (Entry Point)
├── test/               # Berkas pengujian otomatis (Widget & Unit Testing)
├── pubspec.yaml        # Manajer paket, dependensi, & aset (Gambar/Font)
└── README.md           # Dokumentasi proyek

```

### Detail File Penting:

1. **`lib/main.dart`**: Berkas paling utama. Seluruh UI, logika, dan fungsi diawali dari file ini melalui fungsi `main()`.
2. **`pubspec.yaml`**: File konfigurasi proyek tempat menambahkan pustaka eksternal dari [pub.dev](https://pub.dev?utm_source=gemini) serta mendaftarkan aset lokal (gambar/font).

---

## 8. Menjalankan Aplikasi Pertama di Browser

Untuk menghemat konsumsi memori RAM, eksekusi aplikasi menggunakan **Web Browser (Google Chrome / Microsoft Edge)**.

### Langkah-Langkah Menjalankan Aplikasi:

1. **Pilih Target Device:**
* Di VS Code, klik nama perangkat di **Status Bar** (pojok kanan bawah).
* Pilih **Chrome (web-javascript)** atau **Edge (web-javascript)**.
* Atau cek daftar perangkat di Terminal: `flutter devices`.


2. **Jalankan Aplikasi:**
* Pastikan file `lib/main.dart` terbuka.
* Tekan **F5** pada keyboard, atau jalankan di Terminal:
```bash
flutter run -d chrome

```




3. **Pengamatan Aplikasi Bawaan (*Counter App*):**
* Browser akan terbuka secara otomatis.
* Uji aplikasi dengan mengklik tombol tambah (`+`) di pojok kanan bawah. Perhatikan angka di tengah layar akan bertambah secara dinamis.



---

## 9. Penjelasan Kode `lib/main.dart` & Penerapan Sintaks Dart

Buka berkas `lib/main.dart`. Berikut adalah analisis kode penyusun aplikasi tersebut:

```dart
import 'package:flutter/material.dart';

// 1. Fungsi Utama (Entry Point) - Sintaks Dasar Dart
void main() {
  runApp(const MyApp());
}

// 2. Root Widget (StatelessWidget - UI yang nilainya tidak berubah)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pertama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Praktikum Pemrograman Mobile'),
    );
  }
}

// 3. Page Widget (StatefulWidget - UI yang memiliki data dinamis)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 4. State Class - Mengelola variabel data dan fungsi logika
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Variabel angka penampung state

  void _incrementCounter() {
    setState(() {
      _counter++; // Mengubah nilai & memerintahkan Flutter merender ulang UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Jumlah tombol ditekan:'),
            Text(
              '$_counter', // String Interpolation khas Dart
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Memanggil fungsi increment
        tooltip: 'Tambah',
        child: const Icon(Icons.add),
      ),
    );
  }
}

```

---

## 10. Latihan Praktikum Mandiri

Kerjakan langkah-langkah praktikum berikut pada perangkat masing-masing:

1. **Pemeriksaan Environment:**
Jalankan `flutter doctor` di Terminal/CMD dan pastikan Flutter SDK serta Chrome sudah berstatus centang `[✓]`.
2. **Membuat Proyek Baru:**
Buat proyek baru bernama `prak_pertemuansatu`.
3. **Running Aplikasi:**
Jalankan proyek tersebut menggunakan target browser Google Chrome.
4. **Eksperimen Modifikasi Kode (Uji Fitur Hot Reload):**
* Buka berkas `lib/main.dart`.
* Ubah parameter `title` pada `MyHomePage` di dalam `MyApp` menjadi:
```dart
home: const MyHomePage(title: 'Praktikum 4 - [Nama Anda] - [NIM]'),

```


* Tambahkan variabel teks baru di dalam `_MyHomePageState`:
```dart
String pesan = "Selamat Datang di Modul Pemrograman Mobile Flutter!";

```


* Tampilkan variabel `pesan` tersebut di dalam widget `Column` tepat di atas widget `Text('$_counter')`:
```dart
Text(
  pesan,
  textAlign: TextAlign.center,
  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
),

```


* Simpan file (`Ctrl + S` / `Cmd + S`) dan amati perubahan tampilan di browser secara instan tanpa mereset aplikasi (**Hot Reload**).


Selamat Belajar :)