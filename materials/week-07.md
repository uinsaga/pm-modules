# Handout Pertemuan 7: Dynamic List (`ListView.builder`), Interactive Forms, dan State Management

**Mata Kuliah:** Pemrograman Mobile

**Modul:** Pertemuan 7

**Topik Utama:** Rendering Data Dinamis (`ListView.builder`), Pengolahan Form Input ke State List, Komponen `ModalBottomSheet`, dan State Management (`setState`)

---

## 1. Pendahuluan & Tujuan Pembelajaran

Setelah mengimplementasikan struktur navigasi *Named Routes* pada Pertemuan 6, modul Pertemuan 7 ini berfokus pada pengolahan data dinamis di **Home Page**. Mahasiswa akan belajar cara menampilkan array objek ke dalam antarmuka, mengubah status data secara langsung (*real-time*), serta menambahkan data baru ke dalam daftar (*state array*).

---

### Tujuan Pembelajaran:

1. Memahami perbedaan performa antara `ListView` statis dan `ListView.builder` (*lazy loading*).
2. Mengubah status variabel lokal dan memperbarui tampilan UI menggunakan `setState()`.
3. Membuat form *input* interaktif menggunakan `showModalBottomSheet` untuk menambahkan elemen baru ke dalam daftar data.
4. Menerapkan fitur interaksi lengkap: **Tambah Data**, **Tandai Favorit**, dan **Hapus Data** dari daftar.

---

## 2. Arsitektur Komponen & Data Flow

```text
[ ModalBottomSheet / Form Input ]
              │
    (Input Data Baru)
              │
              ▼
    [ List<Item> State ] ──(setState)──► [ ListView.builder ]
              ▲                                   │
              │                             (Klik Item)
              └───────── (Tandai / Hapus) ────────┘

```

---

## 3. Struktur Berkas Proyek

Pastikan direktori proyek Anda tertata sebagai berikut:

```text
lib/
├── models/
│   └── item_model.dart     (Model Data & Initial Array)
├── pages/
│   ├── login_page.dart    
│   ├── register_page.dart 
│   ├── home_page.dart     (Halaman Utama - Dynamic List & Form Input)
│   └── profile_page.dart  
└── main.dart              

```

---

## 4. Langkah Praktikum

---

### Langkah 1: Model Data & Initial State (`lib/models/item_model.dart`)

Buat kelas `Item` sebagai cetak biru data yang akan ditampilkan di dalam daftar.

```dart
class Item {
  final String id;
  final String title;
  final String description;
  bool isFavorite;

  Item({
    required this.id,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });
}

// Data Awal (Dummy Data)
List<Item> initialItems = [
  Item(
    id: '1',
    title: 'Pengenalan Flutter & Dart',
    description: 'Materi dasar framework Flutter dan sintaks bahasa Dart.',
  ),
  Item(
    id: '2',
    title: 'Layouting & Input Widget',
    description: 'Membuat tampilan form login dan register dengan TextField.',
  ),
  Item(
    id: '3',
    title: 'Named Routes & Data Passing',
    description: 'Mengelola navigasi terpusat dan mengirim data email antarhalaman.',
  ),
];

```

---

### Langkah 2: Mengembangkan Home Page (`lib/pages/home_page.dart`)

Halaman ini mengelola daftar `List<Item>` di dalam State. Pengguna dapat:

1. Menandai item favorit (`setState`).
2. Menghapus item dari daftar (*Dismissible/Delete*).
3. Membuka *FloatingActionButton* untuk mengisi form penambahan data baru.

```dart
import 'package0:flutter/material.dart';
import '../models/item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Salinan data yang dikelola oleh State
  final List<Item> _items = List.from(initialItems);

  // Controller untuk Form Tambah Data
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  // Fungsi untuk Menambahkan Data Baru ke dalam List State
  void _addItem() {
    String title = _titleController.text.trim();
    String desc = _descController.text.trim();

    if (title.isEmpty || desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Judul dan Deskripsi wajib diisi!')),
      );
      return;
    }

    setState(() {
      _items.add(
        Item(
          id: DateTime.now().toString(),
          title: title,
          description: desc,
        ),
      );
    });

    _titleController.clear();
    _descController.clear();
    Navigator.pop(context); // Menutup BottomSheet

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Materi berhasil ditambahkan!')),
    );
  }

  // Fungsi untuk Menampilkan Form Bottom Sheet Input
  void _showAddBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Tambah Materi Baru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul Materi',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Singkat',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('SIMPAN MATERI'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tangkap data email dari Login Page
    final String emailDiterima =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'User';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Daftar Materi'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile', arguments: emailDiterima);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Pengguna Login
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selamat Datang,', style: TextStyle(color: Colors.grey)),
                    Text(
                      emailDiterima,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Chip(
                  label: Text('Total: ${_items.length}'),
                  backgroundColor: Colors.blue.shade100,
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Daftar Modul Praktikum:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // Tampilan jika data kosong
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Text('Belum ada materi. Klik + untuk menambah.'),
                  )
                : ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 6.0,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Tombol Favorit
                              IconButton(
                                icon: Icon(
                                  item.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: item.isFavorite ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    item.isFavorite = !item.isFavorite;
                                  });
                                },
                              ),
                              // Tombol Hapus Data
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _items.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      // Tombol Tambah Data
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddBottomSheet,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Materi'),
      ),
    );
  }
}

```

---

## 5. Penjelasan Komponen Penting

| Komponen / Method | Fungsi Teknis |
| --- | --- |
| **`ListView.builder`** | Menggambar ulang baris daftar secara efisien berdasarkan kapasitas data yang ada (*lazy loading*). |
| **`showModalBottomSheet`** | Menampilkan dialog formulir dari bawah layar tanpa berpindah halaman (*route* baru). |
| **`setState(() {})`** | Memberitahu framework Flutter bahwa terjadi pembaruan data lokal (`_items.add` atau `_items.removeAt`), sehingga UI akan dirender ulang. |
| **`MediaQuery.of(context).viewInsets.bottom`** | Mengatur jarak bawah form agar input tidak tertutup saat papan ketik (*virtual keyboard*) muncul. |

---

## 6. Tugas Praktikum Mandiri

1. **Fitur Filter Favorit:**
Tambahkan tombol di `AppBar` untuk memfilter daftar, sehingga `ListView.builder` hanya menampilkan item yang status `isFavorite == true`.
2. **Validasi Karakter:**
Tambahkan aturan bahwa judul materi baru tidak boleh kurang dari 5 karakter. Tunjukkan pesan peringatan jika syarat tidak terpenuhi.