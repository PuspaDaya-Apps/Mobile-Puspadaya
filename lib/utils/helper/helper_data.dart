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
}
