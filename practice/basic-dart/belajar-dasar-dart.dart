class Manusia {
  String nama = "";
  String tempatLahir = "";
  DateTime? tanggalLahir = null;
  String alamat = "";
  String pekerjaan = "";
  String jenisKelamin = "";
  String status = "";
  String golonganDarah = "";

  static instantiate({required String nama, required String tempatLahir}) {
    return Manusia()
      ..nama = nama
      ..tempatLahir = tempatLahir
      ..tanggalLahir = DateTime.parse("2010-01-01")
      ..alamat = "Solo"
      ..pekerjaan = "Belajar yang giat, banggain orang tua"
      ..jenisKelamin = "Laki-laki"
      ..status = "Jomblo"
      ..golonganDarah = "A";
  }

  void cetak() {
    print("Nama : $nama");
    // print("Umur : $umur");
    print("Tempat Lahir : $tempatLahir");
    print("Tanggal Lahir : $tanggalLahir");
    print("Alamat : $alamat");
    print("Pekerjaan : $pekerjaan");
    print("Jenis Kelamin : $jenisKelamin");
    print("Status : $status");
    print("Golongan Darah : $golonganDarah");
  }
}

class Mahasiswa extends Manusia {
  String nim = "";

  Mahasiswa(String nim) {
    this.nim = nim;
  }

  void cetak() {
    print("NIM : $nim");
    super.cetak();
  }
}

class Dosen extends Manusia {
  String nidn = "";

  void cetak() {
    print("NIDN: $nidn");
    super.cetak();
  }
}

void main() {
  //object

  //pak budi
  Manusia mp = Manusia();
  mp.nama = "Mulyono";
  mp.tempatLahir = "Solo";
  mp.tanggalLahir = DateTime.parse("1986-01-01");
  mp.alamat = "Solo";
  mp.pekerjaan = "Mantan Pepsodent";
  mp.jenisKelamin = "Laki-laki";
  mp.status = "Menikah";
  mp.golonganDarah = "O";

  mp.cetak();

  print("--------------------------");

  Manusia mn2 = Manusia.instantiate(nama: "Naim", tempatLahir: "Solo");
  mn2.cetak();

  Mahasiswa mh1 = Mahasiswa("0001");
  mh1.nama = "Naim";
  mp.tempatLahir = "Solo";
  mp.tanggalLahir = DateTime.parse("2010-01-01");
  mp.alamat = "Solo";
  mp.pekerjaan = "Belajar yang giat, banggain orang tua";
  mp.jenisKelamin = "Laki-laki";
  mp.status = "Jomblo";
  mp.golonganDarah = "A";

  mh1.cetak();
}
