# Handout Pertemuan 6: Refactoring Navigasi ke Named Routes & Passing Data Email

**Mata Kuliah:** Pemrograman Mobile

**Modul:** Pertemuan 6

**Topik Utama:** Refactoring Navigasi menggunakan *Named Routes*, Pengiriman Data *Email* Antarhalaman, dan Penggunaan `pushReplacementNamed`

---

## 1. Pendahuluan & Tujuan Pembelajaran

Pada Pertemuan 5, kita telah membuat form **Login** dan **Register** di dalam folder `lib/pages/`. Pada saat itu, perpindahan halaman masih menggunakan *Anonymous Route* (`Navigator.push`).

Pada Pertemuan 6 ini, kita akan melakukan **Refactoring** (pembaharuan struktur kode):

1. Mengubah seluruh navigasi aplikasi menggunakan **Named Routes** yang terdaftar di `main.dart`.
2. Mengirimkan **Email** yang diinput saat Login ke **Home Page** dan **Profile Page**.
3. Menggunakan `pushReplacementNamed` agar setelah berhasil Login, pengguna **tidak bisa kembali (*back*)** ke halaman Login.

---

### Alur Navigasi Aplikasi

```text
[ Register Page ('/register') ] ──(Pop / Back)──┐
                                               ▼
                                      [ Login Page ('/') ]
                                               │
                                 (Login & Pass Email Data)
                                               │
                                               ▼ (pushReplacementNamed)
                                     [ Home Page ('/home') ]
                                               │
                                         (Pass Email Data)
                                               │
                                               ▼ (pushNamed)
                                   [ Profile Page ('/profile') ]

```

---

## 2. Struktur Berkas Proyek

Pastikan struktur berkas di dalam proyek Anda sudah sesuai dan semua file halaman berada di dalam direktori `lib/pages/`:

```text
lib/
├── pages/
│   ├── login_page.dart    (Diperbarui dari Pertemuan 5)
│   ├── register_page.dart (Diperbarui dari Pertemuan 5)
│   ├── home_page.dart     (Baru)
│   └── profile_page.dart  (Baru)
└── main.dart              (Diperbarui - Pendaftaran Route)

```

---

## 3. Langkah Praktikum

---

### Langkah 1: Registrasi Named Routes Terpusat (`lib/main.dart`)

Buka `lib/main.dart`, *import* seluruh halaman dari direktori `pages/`, lalu daftarkan nama rute aplikasi di dalam `MaterialApp`.

```dart
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Pertemuan 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

      // 1. Menentukan halaman awal saat aplikasi dibuka (Login)
      initialRoute: '/',

      // 2. Pemetaan nama rute aplikasi
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

```

---

### Langkah 2: Memperbarui Halaman Login (`lib/pages/login_page.dart`)

Mengambil data **Email** yang diinputkan pengguna, lalu mengirimkannya ke `/home` menggunakan `arguments`.

```dart
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller email dari Pertemuan 5
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _doLogin() {
    String emailInput = _emailController.text.trim();

    if (emailInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email tidak boleh kosong!')),
      );
      return;
    }

    // Pindah ke Halaman Home sambil membawa data EMAIL.
    // Menggunakan pushReplacementNamed agar halaman Login dihapus dari stack.
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: emailInput, // Passing data email (String)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_person, size: 70, color: Colors.blue),
            const SizedBox(height: 20),
            
            // Input Email
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'contoh@email.com',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 12),
            
            // Input Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Login
            ElevatedButton(
              onPressed: _doLogin,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('LOGIN'),
            ),
            const SizedBox(height: 12),

            // Ke Halaman Register
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Belum punya akun? Register'),
            ),
          ],
        ),
      ),
    );
  }
}

```

---

### Langkah 3: Memperbarui Halaman Register (`lib/pages/register_page.dart`)

```dart
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Kembali ke Halaman Login
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('DAFTAR & KEMBALI KE LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}

```

---

### Langkah 4: Membuat Halaman Home (`lib/pages/home_page.dart`)

Halaman Home menangkap **Email** yang dikirim dari Login Page dan menampilkannya pada teks ucapan selamat datang.

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tangkap data email yang dikirim dari halaman Login
    final String emailDiterima =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout: Kembali ke Login Page dan hapus stack halaman
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.home_rounded, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Selamat Datang!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              
              // Menampilkan Email yang dikirim saat Login
              Text(
                'Logged in as: $emailDiterima',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  // Meneruskan data email ke Halaman Profile
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: emailDiterima,
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text('Lihat Profile'),
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

### Langkah 5: Membuat Halaman Profile (`lib/pages/profile_page.dart`)

Halaman Profile menerima data email yang diteruskan dari `HomePage`.

```dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tangkap data email yang diteruskan dari Home Page
    final String emailDiterima =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 20),
              
              // Menampilkan email pengguna
              Text(
                emailDiterima,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Status: Mahasiswa / User Aktif',
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: () {
                  // Kembali ke Home Page
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Home'),
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

## 4. Penjelasan Sintaks Kunci

1. **`pushReplacementNamed` vs `pushNamed`:**
* Pada `LoginPage`, kita menggunakan `pushReplacementNamed(context, '/home')` agar setelah pengguna berhasil masuk ke **Home**, menekan tombol *back* HP **tidak akan membalikkan pengguna ke Halaman Login**.
* Pada `HomePage` menuju `ProfilePage`, kita menggunakan `pushNamed` biasa agar pengguna **bisa kembali** ke Home dengan `Navigator.pop`.


2. **`ModalRoute.of(context)!.settings.arguments as String`:**
* Digunakan pada halaman tujuan (`HomePage` & `ProfilePage`) untuk mengekstrak variabel string/email yang disisipkan dari halaman sebelumnya.



---

## 5. Latihan Praktikum Mandiri

1. **Perubahan Teks Email:** Coba ubah ketikan email di halaman Login (misal: `mahasiswa@kampus.ac.id`), lalu amati apakah email di Home Page dan Profile Page otomatis berubah sesuai ketikan Anda.
2. **Uji Coba Tombol Back:** Cobalah tekan tombol Login, lalu tekan tombol *Back* pada HP/Emulator Anda. Amati mengapa aplikasi tidak kembali ke layar Login (karena penggunaan `pushReplacementNamed`).