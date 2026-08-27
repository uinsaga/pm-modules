# Pertemuan 3: Design System di Figma (Color Palette, Typography, Tokens, & Auto Layout)

**Kembali ke:** [Daftar Isi](../README.md)

---

## 🎯 Target Pembelajaran
Di akhir pertemuan ini, mahasiswa diharapkan mampu:
1. Mengoperasikan *tools* dasar perancangan antarmuka pada Figma (Frame, Shapes, Text, Pen Tool).
2. Menyusun **Design System** (Palette Warna, Typography Styles, dan Iconography).
3. Menguasai fitur **Auto Layout** untuk membuat tata letak antarmuka yang responsif.
4. Membuat komponen yang dapat digunakan kembali (*Reusable Components & Variants*).

---

## ⏱️ Rincian Alokasi Waktu (150 Menit)

| Sesi | Durasi | Aktivitas Utama | Output |
| :--- | :---: | :--- | :--- |
| **Sesi 1: Briefing & Demo** | 30 Menit | Penjelasan Konsep Design System, Color Tokens, & Demo Auto Layout | Pemahaman Tools Figma |
| **Sesi 2: Hands-on Design System** | 40 Menit | Membuat Palette Warna, Typo Styles, dan Koleksi Ikon di Canvas Figma | Halaman Design System |
| **Sesi 3: Hands-on Component** | 60 Menit | Praktik Auto Layout & Pembuatan Atom Component (Button & Text Input) | Library Component Fix |
| **Sesi 4: Review & Asistensi** | 20 Menit | Evaluasi Struktur Tokens & Kerapian Component Figma | Pengesahan System |

---

## 📖 1. Materi Utama (30 Menit)

### A. Anatomi Design System (Atomic Design)
Sebelum menggambar layar penuh, desainer profesional membangun fondasi komponen dari skala paling kecil:

```text
[ Atoms ]           ➡️        [ Molecules ]       ➡️        [ Organisms ]
Warna, Font, Icons            Tombol, Input Field           Card, Navigation Bar

```

* **Color Tokens:** Mengelompokkan warna berdasarkan peran (*Primary, Secondary, Background, Text Main, State Success/Error*).
* **Typography Scale:** Menentukan hirarki teks yang konsisten (H1, H2, Body, Caption) beserta ukuran, ketebalan, dan *line-height*.
* **Auto Layout (`Shift + A`):** Fitur utama Figma untuk membuat elemen bergerak otomatis mengikuti isi konten (seperti fleksibilitas `Flexbox` / `Row` & `Column` pada CSS/Flutter).

---

### B. Aturan Emas Auto Layout

1. **Direction:** Tentukan arah tata letak — Vertikal (*Down*) atau Horizontal (*Right*).
2. **Padding:** Atur jarak ruang di dalam *frame* (Atas-Bawah dan Kiri-Kanan).
3. **Gap / Spacing:** Atur jarak antarelemen anak (*child items*) di dalam *frame*.
4. **Resizing Property:**
* **Fixed:** Ukuran lebar/tinggi dikunci secara manual.
* **Hug Contents:** Ukuran *frame* menyesuaikan besar konten di dalamnya.
* **Fill Container:** Ukuran elemen melebar memenuhi kapasitas ruang *parent frame*.



---

## 🛠️ 2. Aktivitas Praktik Studio (100 Menit)

### Tahap 1: Setup Workspace & Design System (40 Menit)

1. Buka Figma dan buat file baru dengan format nama: `[NamaKelompok] - Mobile Project`.
2. Buat halaman baru bernama **`🎨 Design System`**.
3. **Buat Color Styles:**
* Buat bentuk kotak (`R`), tentukan kode warna Hex.
* Daftarkan ke Figma Color Styles (`+` Color Styles):
* `Primary/Base` (Warna utama aplikasi)
* `Neutral/Text-Main` (Warna gelap untuk judul/teks)
* `Neutral/Background` (Warna latar aplikasi, e.g., `#F8F9FA`)
* `State/Error` (Warna merah indikasi error)




4. **Buat Text Styles:**
* Ketik teks sampel, daftarkan ke Figma Text Styles (`+` Text Styles):
* `Heading 1` (Poppins / Inter - Bold - 24px)
* `Heading 2` (Poppins / Inter - SemiBold - 18px)
* `Body` (Poppins / Inter - Regular - 14px)
* `Caption` (Poppins / Inter - Regular - 12px)





---

### Tahap 2: Hands-on Auto Layout & Reusable Component (60 Menit)

#### Latihan 1: Membuat Custom Button (Primary & Disabled)

1. Buat teks baru: `"Button Text"`, terapkan style `Body` dan warna putih.
2. Seleksi teks tersebut, tekan `Shift + A` untuk mengaktifkan **Auto Layout**.
3. Atur Padding: Kiri-Kanan `24px`, Atas-Bawah `12px`.
4. Beri warna latar (*Fill*) menggunakan warna `Primary/Base` dan beri *Border Radius* `8px`.
5. Ubah *frame* menjadi Component (`Ctrl + Alt + K` atau `Cmd + Option + K`).
6. Tambahkan **Variant** untuk membuat kondisi `Disabled` (Warna latar abu-abu).

#### Latihan 2: Membuat Form Input Field

1. Buat teks label `"Email Address"` (Style: `Caption`).
2. Buat *frame* masukan teks berisi placeholder `"Masukkan email kamu..."` dengan Auto Layout.
3. Gabungkan Label dan Frame Masukan ke dalam satu Auto Layout Vertikal.
4. Jadikan sebagai Component `Input Field`.

---

## 🔍 3. Asistensi & Review (20 Menit)

Persiapkan Canvas Figma kelompok untuk diuji oleh Dosen/Asisten Lab:

* Apakah seluruh warna dan font sudah terdaftar resmi sebagai **Styles** di panel kanan Figma?
* Apakah komponen tombol sudah menggunakan **Auto Layout** dengan benar (saat teks diubah, tombol melebar otomatis)?
* Apakah struktur penamaan komponen rapi dan mudah dicari?

---

## 📝 Checkpoint & Tugas Minggu 3

* [ ] Halaman `🎨 Design System` pada Figma selesai disiapkan.
* [ ] Terdaftar minimal 4 Color Styles dan 4 Text Styles resmi.
* [ ] Terbuat minimal 2 Reusable Component utama (*Custom Button* & *Input Field*) berbasis Auto Layout.
* [ ] Siap mengimplementasikan Design System ini ke perancangan layar visual (**Hi-Fi UI Design**) di Pertemuan 4.
