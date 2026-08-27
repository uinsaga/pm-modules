# Setup Flutter di Windows

## 🖥️ 1. Spesifikasi Komputer yang Disarankan

### Spesifikasi Minimum

- **Sistem Operasi**: Windows 10/11 (64-bit)
- **Processor**: Intel Core i3 generasi ke-5 atau setara
- **RAM**: 8 GB DDR4
- **Storage**: SSD 256 GB (minimal 50 GB ruang kosong)
- **Port USB**: USB 2.0/3.0 yang berfungsi dengan baik

### Spesifikasi Recommended

- **Processor**: Intel Core i5 generasi ke-8 atau lebih tinggi/AMD Ryzen 5
- **RAM**: 16 GB DDR4
- **Storage**: NVMe SSD 512 GB
- **Graphics**: Integrated graphics atau GPU dedicated 2GB

## 📦 2. Persiapan Awal

### File yang Harus Disiapkan

1. `flutter-source.iso` (dari dosen/asisten)
2. Kabel USB data original (bukan kabel charging saja)
3. HP Android dengan minimal OS Android 8.0 (Oreo)

### Software Pendukung (Optional)

- Visual Studio Code (disarankan)
- 7-Zip atau WinRAR untuk extract file
- Driver USB untuk device Android (jika diperlukan)

## 📁 3. Extract Paket Flutter

### Lokasi Extract yang Disarankan:

```
D:\tools\flutter_windows_portable\
```

### Struktur Folder Setelah Extract

```
D:\tools\flutter_windows_portable\
 ├─ flutter\           → Flutter SDK utama
 ├─ pub-cache\         → Cache packages (sudah terisi)
 ├─ gradle\            → Cache Gradle (sudah terisi)
 └─ README.txt         → Petunjuk tambahan
```

### ⚠️ Hal yang Harus Dihindari:

- Jangan extract di `C:\Program Files` atau `C:\Program Files (x86)`
- Jangan letakkan di folder dengan path yang panjang
- Jangan ubah nama folder setelah di-extract

## ⚙️ 4. Set Environment Variable

### Langkah-langkah

1. Tekan `Win + S`, ketik "Environment Variables"
2. Pilih "Edit the system environment variables"
3. Klik tombol "Environment Variables"
4. Di bagian "System variables", pilih "Path" → "Edit"
5. Klik "New" dan tambahkan path:

   ```cmd
   D:\tools\flutter_windows_portable\flutter\bin
   ```

6. Klik "OK" sampai semua jendela tertutup

### Verifikasi

Buka Command Prompt baru dan ketik:

```cmd
flutter --version
```

→ Jika muncul versi Flutter, setup berhasil

## 📂 5. Salin Cache Package

### Cache Pub

- **Sumber**: `pub-cache\`
- **Tujuan**: `C:\Users\<username>\AppData\Roaming\Pub\Cache`

### Cache Gradle

- **Sumber**: `gradle\`
- **Tujuan**: `C:\Users\<username>\.gradle`

### ⚠️ Penting

- Pastikan folder tujuan sudah ada atau buat baru jika belum ada
- Copy seluruh isi folder, jangan hanya sebagian
- Jika ada file yang sama, timpa dengan file yang baru

## 📱 6. Setup HP Android

### Aktifkan Developer Options

1. Buka **Settings** → **About phone**
2. Tap **Build number** 7 kali sampai muncul notifikasi
3. Kembali ke **Settings** → **System** → **Developer options**

### Aktifkan Fitur

- ✅ **USB debugging**
- ✅ **Install via USB**
- ✅ **USB debugging (Security settings)** - jika ada

### Tips

- Gunakan kabel USB original yang mendukung data transfer
- Jika muncul popup "Allow USB debugging?" → pilih **Always allow from this computer**
- Pastikan HP tidak dalam mode charge only

## 🧪 7. Uji Coba Flutter

### Periksa Setup

```cmd
flutter doctor
```

→ Abaikan warning tentang Android Studio jika tidak perlu

### Buat Project Test

```cmd
flutter create test_project
cd test_project
flutter run
```

### Expected Result

- Aplikasi terinstall otomatis di HP
- Tampilan aplikasi default Flutter muncul
- Tidak ada error selama proses build

## 🚨 8. Troubleshooting Umum

### Problem: Device tidak terdeteksi

**Solusi**:

- Install driver USB untuk device tersebut
- Ganti kabel USB
- Restart ADB: `adb kill-server` lalu `adb start-server`

### Problem: Flutter command not found

**Solusi**:

- Pastikan path environment variable sudah benar
- Buka Command Prompt baru setelah setting path

### Problem: Storage penuh

**Solusi**:

- Hapus folder `C:\Users\<username>\.gradle\wrapper\dists` (jika ada)
- Hapus folder `C:\Users\<username>\AppData\Local\Temp`

## 💾 9. Manajemen Storage

### Folder yang Bisa Dihapus (jika perlu ruang):

- `C:\Users\<username>\.android\avd` (jika tidak menggunakan emulator)
- `C:\Users\<username>\.android\cache`
- `C:\Users\<username>\AppData\Local\Temp`

### Folder yang JANGAN Dihapus:

- `C:\Users\<username>\.gradle`
- `C:\Users\<username>\AppData\Roaming\Pub\Cache`
- `D:\tools\flutter_windows_portable\`

## 📝 10. Checklist Final

Sebelum mulai development, pastikan:

- [ ] Flutter terinstall (`flutter --version`)
- [ ] Device terdeteksi (`flutter devices`)
- [ ] Cache sudah disalin ke lokasi yang benar
- [ ] USB debugging aktif
- [ ] Cukup storage tersedia
- [ ] Project test berhasil di-run

## 🆘 Bantuan

Jika mengalami masalah:

1. Periksa kembali semua langkah di atas
2. Pastikan tidak melewati langkah apapun
3. Hubungi asisten jika masalah terus berlanjut
