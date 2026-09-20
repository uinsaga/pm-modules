# Handout Pertemuan 5: Praktikum Layouting, Input Widget, Navigation, dan Pembuatan Halaman Login & Register

**Mata Kuliah:** Pemrograman Mobile

**Modul:** Pertemuan 5

**Topik Utama:** Layouting Basic (`Column`, `Row`, `Container`, `Padding`), Input Widget (`TextField`), Form Validation, Navigation (`Navigator`), serta Implementasi Halaman Login dan Register

---

## 1. Konsep Dasar Layouting & Input Widget

Pada pertemuan sebelumnya, kita telah mempelajari bahwa di Flutter **segala sesuatu adalah Widget**. Untuk membangun halaman Login dan Register, kita perlu memahami beberapa widget utama berikut:

### 1.1 Widget Tata Letak (Layouting)

* **`Column`**: Menyusun widget anak (*children*) secara **vertikal** (dari atas ke bawah).
* **`Row`**: Menyusun widget anak secara **horizontal** (dari kiri ke kanan).
* **`Container`**: Widget serbaguna untuk mengatur dekorasi (warna latar, border, border-radius) serta ukuran (*width*, *height*).
* **`Padding` / `SizedBox**`:
* `Padding`: Memberikan jarak di dalam tepi widget (*margin/padding*).
* `SizedBox`: Memberikan jarak kosong vertikal atau horizontal yang pasti antar-widget.


* **`SingleChildScrollView`**: Membungkus layout agar layar **bisa di-scroll** secara otomatis saat keyboard muncul (mencegah error *Overflow*).

### 1.2 Widget Form & Input Teks

* **`Form`**: Container pembungkus yang mengelola status validasi kumpulan input field.
* **`TextFormField`**: Widget tempat pengguna mengetikkan teks, dilengkapi fitur *validator*, pemformatan, dan kustomisasi dekorasi (`InputDecoration`).
* **`GlobalKey<FormState>`**: Kunci unik yang digunakan untuk mengakses status form dan memicu proses validasi (`formKey.currentState!.validate()`).

---

## 2. Konsep Navigasi Halaman (Navigation & Routing)

Navigasi di Flutter bekerja dengan prinsip tumpukan (**Stack / LIFO - Last In, First Out**):

```text
[ Halaman Register ]  <-- Berada di paling atas (Tampak di Layar)
[ Halaman Login    ]  <-- Berada di bawahnya

```

### Fungsi Utama `Navigator`:

1. **`Navigator.push()`**: Menambahkan halaman baru ke atas tumpukan (user bisa kembali ke halaman sebelumnya).
2. **`Navigator.pop()`**: Menghapus halaman teratas dari tumpukan (kembali ke halaman sebelumnya).
3. **`Navigator.pushReplacement()`**: Mengganti halaman teratas dengan halaman baru (user **tidak bisa** kembali ke halaman sebelumnya, sangat cocok setelah Login berhasil menuju Dashboard).

---

## 3. Langkah Praktikum: Membuat Aplikasi Login & Register

Mari kita buat aplikasi sederhana dengan alur berikut:

1. **Halaman Login** (`login_page.dart`)
2. **Halaman Register** (`register_page.dart`)
3. **Halaman Home / Dashboard** (`home_page.dart`)

---

### Langkah 1: Persiapan Struktur Project

1. Buka project Flutter Anda di VS Code.
2. Di dalam folder `lib/`, buat folder baru bernama `pages/`.
3. Buat 3 berkas baru di dalam folder `lib/pages/`:
* `login_page.dart`
* `register_page.dart`
* `home_page.dart`



Struktur folder `lib/` akan menjadi seperti ini:

```text
lib/
├── pages/
│   ├── home_page.dart
│   ├── login_page.dart
│   └── register_page.dart
└── main.dart

```

---

### Langkah 2: Membuat Halaman Home (`lib/pages/home_page.dart`)

Halaman sederhana yang akan dituju setelah pengguna berhasil login.

```dart
import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Utama'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              const Text(
                'Selamat Datang,',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 48),
                ),
                onPressed: () {
                  // Logout dan kembali ke Halaman Login (Replace stack)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

---

### Langkah 3: Membuat Halaman Register (`lib/pages/register_page.dart`)

Halaman untuk pendaftaran akun baru dengan validasi konfirmasi password.

```dart
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirm = true;

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitRegister() {
    if (_formKey.currentState!.validate()) {
      // Jika validasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi Berhasil! Silakan Login.'),
          backgroundColor: Colors.green,
        ),
      );
      // Kembali ke halaman Login
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun Baru'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Buat Akun Anda',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lengkapi data di bawah ini untuk mendaftar',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // Field Nama Lengkap
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Field Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!value.contains('@')) {
                      return 'Masukkan format email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Field Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscurePassword = !_isObscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Field Konfirmasi Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _isObscureConfirm,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password',
                    prefixIcon: const Icon(Icons.lock_reset_outlined),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureConfirm = !_isObscureConfirm;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password tidak boleh kosong';
                    }
                    if (value != _passwordController.text) {
                      return 'Password tidak cocok!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Tombol Register
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _submitRegister,
                  child: const Text(
                    'DAFTAR SEKARANG',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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

### Langkah 4: Membuat Halaman Login (`lib/pages/login_page.dart`)

Halaman utama tempat pengguna memasukkan akun atau berpindah ke halaman Register.

```dart
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      // Pindah ke HomePage dan hapus stack Login (pushReplacement)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(email: _emailController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo / Icon Aplikasi
                  const Icon(
                    Icons.lock_person_rounded,
                    size: 90,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Selamat Datang',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Silakan masuk ke akun Anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  // Field Email
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!value.contains('@')) {
                        return 'Format email salah';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Field Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Tombol Login
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _submitLogin,
                    child: const Text(
                      'MASUK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Navigasi ke Halaman Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun? '),
                      GestureDetector(
                        onTap: () {
                          // Navigasi push ke Halaman Register
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Daftar di sini',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

```

---

### Langkah 5: Memperbarui Berkas `lib/main.dart`

Buka berkas `lib/main.dart`, lalu ubah isi kodenya untuk mengarahkan halaman pertama (*home*) ke `LoginPage`.

```dart
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Login & Register',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

```

---

## 4. Penjelasan Komponen Penting Praktikum

| Komponen / Method | Fungsi Utama |
| --- | --- |
| **`TextEditingController`** | Menangkap nilai masukan ketikan pengguna secara *real-time* dan memanipulasi isi teks. |
| **`obscureText: true`** | Menyembunyikan karakter password menjadi titik-titik (`•••`). |
| **`dispose()`** | Menghapus controller dari memori saat widget ditutup untuk mencegah *memory leak*. |
| **`validator`** | Fungsi logika pengecekan input field (mengembalikan pesan error jika tidak sesuai, atau `null` jika valid). |
| **`SingleChildScrollView`** | Menghindari error piksel melebihi layar (*bottom overflowed by xx pixels*) saat papan ketik (*keyboard*) muncul. |

---

## 5. Tugas Praktikum Pertemuan 5

Lakukan modifikasi pada aplikasi yang telah dibuat dengan ketentuan berikut:

1. **Kustomisasi Tampilan:**
Ubah warna utama tema aplikasi (contoh: dari `Colors.blueAccent` menjadi warna kesukaan Anda seperti `Colors.teal` atau `Colors.indigo`).
2. **Tambah Input Field Baru pada Form Register:**
Tambahkan input field **"Nomor Telepon"** pada Halaman Register (`register_page.dart`) dengan validasi:
* Tidak boleh kosong.
* Hanya boleh menerima karakter angka (`keyboardType: TextInputType.phone`).


3. **Uji Validasi Form:**
* Coba tekan tombol **MASUK** saat email/password kosong, amati pesan error yang muncul.
* Coba isi password dan konfirmasi password dengan teks yang berbeda pada form pendaftaran, amati pesan validasinya.