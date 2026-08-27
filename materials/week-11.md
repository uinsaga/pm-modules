# Pertemuan 10: Slicing UI 2 - Auth Screens & Custom Reusable Widgets

**Kembali ke:** [Daftar Isi](../../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Mengekstraksi elemen UI Figma yang berulang menjadi **Custom Reusable Widgets** (misal: `CustomButton`, `CustomTextField`).
2. Menangani form input kompleks menggunakan **`TextEditingController`** dan **Form State Validation**.
3. Melakukan *slicing visual High-Fidelity* untuk layar **Splash Screen**, **Login**, dan **Register**.
4. Membangun alur navigasi otentikasi yang mulus menuju *Main Shell Navigation* (Pertemuan 9).

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Briefing & Live Demo** | 20 Menit | Pemaparan *DRY Principle*, *Form Validation*, & Ekstraksi Reusable Widget | Pemahaman Modul Widgets |
| **Sesi 2: Koding Reusable Widgets** | 30 Menit | Hands-on pembuatan komponen input teks & tombol yang fleksibel | `CustomButton` & `CustomInput` Fix |
| **Sesi 3: Slicing Layar Auth** | 80 Menit | *Slicing UI* presisi untuk Splash Screen, Form Login, & Form Register | 3 Layar Auth Selesai |
| **Sesi 4: Review & Asistensi** | 20 Menit | Pengujian validasi form & evaluasi presisi layouting dibanding Figma | Pengesahan Code Auth |

---

## 📖 1. Materi Utama (20 Menit)

### A. Prinsip Reusable Component (Komponen Berulang)
Dalam perancangan *Design System* di Figma, tombol utama dan kolom input dibuat menjadi komponen induk (*Master Component*). Di Flutter, pola ini diterapkan dengan membuat *Custom Widget*:

```text
[ Figma Component ] ────► [ Flutter Reusable Widget ]
  Button (Primary)   --->   CustomButton(title: '...', onPressed: () {})
  Input Field        --->   CustomTextField(hint: '...', controller: ...)

```

* **Keuntungan:** Mengurangi duplikasi kode hingga 60%, mempercepat proses koding layar berikutnya, dan memudahkan kustomisasi warna/spasi secara terpusat.

---

### B. Pengelolaan Form Input & Validasi

Gunakan **`GlobalKey<FormState>`** dan **`TextEditingController`** untuk membaca serta memvalidasi input dari pengguna sebelum di-submit:

```dart
final _formKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();

// Contoh Penggunaan Validasi Teks
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Email tidak boleh kosong';
  }
  return null;
}

```

---

## 🛠️ 2. Aktivitas Praktik Studio (110 Menit)

### Tahap 1: Membuat Reusable Widgets (30 Menit)

Buat file baru **`lib/core/widgets/custom_button.dart`**:

```dart
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

```

---

### Tahap 2: Slicing Login Screen dengan Validasi (80 Menit)

Buat file baru **`lib/features/auth/login_screen.dart`**:

```dart
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Selamat Datang! 👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masukkan email dan password untuk melanjutkan.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 40),

                // Input Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'nama@email.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (val) =>
                      val!.contains('@') ? null : 'Masukkan email yang valid',
                ),
                const SizedBox(height: 20),

                // Input Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (val) =>
                      val!.length < 6 ? 'Password minimal 6 karakter' : null,
                ),
                const SizedBox(height: 32),

                // Button Login Reusable
                CustomButton(
                  text: 'MASUK',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    }
                  },
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

Tunjukkan hasil koding modul otentikasi kepada Dosen/Asisten Lab:

* Apakah tampilan **Splash**, **Login**, dan **Register** sudah presisi sesuai layout Figma?
* Apakah fungsi validasi form berjalan (muncul pesan error merah saat input kosong/salah)?
* Apakah navigasi berpindah ke `MainScreen` menggunakan `Navigator.pushReplacement` (sehingga user tidak bisa *back* ke halaman login)?

---

## 📝 Checkpoint & Tugas Minggu 10

* [ ] Komponen Reusable (`CustomButton` & `CustomTextField`) selesai dibuat.
* [ ] Layar **Splash**, **Login**, dan **Register** sudah 100% di-*slicing* dengan presisi visual.
* [ ] Validasi input form berjalan dengan baik tanpa *bug*.
* [ ] Siap melanjutkan ke **Pertemuan 11: Slicing UI 3 - Home Dashboard, Complex Grid, & Scroll Views**.
