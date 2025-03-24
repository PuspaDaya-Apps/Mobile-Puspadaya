import 'dart:math';

class HelperData {
  String generateRandomNikBanyuwangi() {
    Random random = Random();
    String kodeWilayah = '351002'; // Contoh kode wilayah
    String tanggalLahir = '${random.nextInt(30) + 1}'.padLeft(2, '0') +
        '${random.nextInt(12) + 1}'.padLeft(2, '0') +
        '${random.nextInt(99) + 1}'.padLeft(2, '0'); // DDMMYY
    String nomorUnik = '${random.nextInt(999999)}'.padLeft(6, '0');

    return kodeWilayah + tanggalLahir + nomorUnik;
  }

  String generateRandomNikMaluku() {
    Random random = Random();
    String kodeWilayah = '81012'; // Contoh kode wilayah
    String tanggalLahir = '${random.nextInt(30) + 1}'.padLeft(2, '0') +
        '${random.nextInt(12) + 1}'.padLeft(2, '0') +
        '${random.nextInt(99) + 1}'.padLeft(2, '0'); // DDMMYY
    String nomorUnik = '${random.nextInt(999999)}'.padLeft(6, '0');

    return kodeWilayah + tanggalLahir + nomorUnik;
  }

  int countYearFromDateTime(DateTime tanggalLahir) {
    DateTime sekarang = DateTime.now();
    int tahun = sekarang.year - tanggalLahir.year;

    // Jika bulan dan hari saat ini sebelum bulan dan hari lahir, kurangi 1 tahun
    if (sekarang.month < tanggalLahir.month ||
        (sekarang.month == tanggalLahir.month &&
            sekarang.day < tanggalLahir.day)) {
      tahun--;
    }

    return tahun;
  }

  int countMonthFromDateTime(DateTime tanggalLahir) {
    DateTime sekarang = DateTime.now();
    int totalBulan = (sekarang.year - tanggalLahir.year) * 12 +
        (sekarang.month - tanggalLahir.month);

    // Jika hari sekarang lebih kecil dari hari lahir, kurangi 1 bulan
    if (sekarang.day < tanggalLahir.day) {
      totalBulan--;
    }

    // Sisa bulan setelah dikurangi tahun
    int bulan = totalBulan % 12;

    return bulan;
  }

  int countAge(DateTime tanggalLahir) {
    // Tanggal saat ini
    DateTime sekarang = DateTime.now();

    // Hitung umur
    int umur = sekarang.year - tanggalLahir.year;

    // Periksa apakah sudah melewati tanggal lahir tahun ini
    if (sekarang.month < tanggalLahir.month ||
        (sekarang.month == tanggalLahir.month &&
            sekarang.day < tanggalLahir.day)) {
      umur--;
    }

    return umur;
  }

  /// Fungsi untuk mengekstrak jumlah tahun dari teks
  int extractYears(String text) {
    int years = 0;
    List<String> parts = text.split(" ");

    for (int i = 0; i < parts.length; i++) {
      if (parts[i] == "tahun" && i > 0) {
        years = int.tryParse(parts[i - 1]) ?? 0;
      }
    }
    return years;
  }

  /// Fungsi untuk mengekstrak jumlah bulan dari teks
  int extractMonths(String text) {
    int months = 0;
    List<String> parts = text.split(" ");

    for (int i = 0; i < parts.length; i++) {
      if (parts[i] == "bulan" && i > 0) {
        months = int.tryParse(parts[i - 1]) ?? 0;
      }
    }
    return months;
  }

  String hitungUsia(DateTime birthDate) {
    DateTime today = DateTime.now();

    int tahun = today.year - birthDate.year;
    int bulan = today.month - birthDate.month;

    // Koreksi jika ulang tahun belum terjadi tahun ini
    if (today.day < birthDate.day) {
      bulan--;
    }
    if (bulan < 0) {
      tahun--;
      bulan += 12;
    }

    return "$tahun tahun";
  }

  String konversiDurasiHHMMKeString(String durasi) {
    // Memisahkan jam dan menit
    List<String> parts = durasi.split(':');
    int jam = int.parse(parts[0]);
    int menit = int.parse(parts[1]);

    // Mengembalikan string dalam format yang diinginkan
    return '$jam jam $menit menit';
  }

}
