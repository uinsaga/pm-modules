class Manusia {
  String nama = "";
  String jk = "";
  int umur = 0;
  int tb = 0;
  int bb = 0;
  String alamat = "";

  Manusia(String nama, String jk) {
    this.nama = nama;
    this.jk = jk;
  }

  void cetakData() {
    print("nama: $nama");
    print("jk: $jk");
    print("umur: $umur th");
    print("tb: $tb cm");
    print("bb: $bb kg");
    print("alamat: $alamat");
  }
}

class Mahasiswa extends Manusia {
  Mahasiswa(super.nama, super.jk, this.nim, this.kelas);

  String nim = "";
  String kelas = "";

  @override
  void cetakData() {
    super.cetakData();
    print("nim : $nim");
    print("kelas : $kelas");
  }
}

void main() {
  print("halo ini kode pertama dart kita");

  // Manusia mn1 = Manusia("Mulyono", "Laki-laki");
  // mn1.bb = 100;
  // mn1.tb = 80;
  // mn1.alamat = "Solo";
  // mn1.umur = 60;
  // mn1.cetakData();

  Mahasiswa mhs1 = Mahasiswa("Silvi", "pr", "25", "3A");
  mhs1.alamat = "Tengaran";
  mhs1.bb = 40;
  mhs1.tb = 180;
  mhs1.umur = 20;
  mhs1.cetakData();
}
