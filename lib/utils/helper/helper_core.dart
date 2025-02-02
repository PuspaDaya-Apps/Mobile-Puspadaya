import 'package:intl/intl.dart';

class HelperCore {
  static String convertNameToInitial(String name) {
    List<String> words = name.trim().split(RegExp(r'\s+'));

    if (words.length == 1) {
      // Jika hanya satu kata, ambil huruf pertama dan terakhir
      return words[0].substring(0, 1).toUpperCase() +
          words[0]
              .substring(words[0].length - 1, words[0].length)
              .toUpperCase();
    } else {
      // Jika dua kata atau lebih, ambil huruf pertama dari dua kata pertama
      return words[0][0].toUpperCase() + words[1][0].toUpperCase();
    }
  }

  static Usia convertUsiaToPiece(String usia) {
    int tahun = 0;
    int bulan = 0;

    RegExp regexTahun = RegExp(r'(\d+)\s*tahun');
    RegExp regexBulan = RegExp(r'(\d+)\s*bulan');

    Match? matchTahun = regexTahun.firstMatch(usia);
    Match? matchBulan = regexBulan.firstMatch(usia);

    if (matchTahun != null) {
      tahun = int.parse(matchTahun.group(1)!);
    }

    if (matchBulan != null) {
      bulan = int.parse(matchBulan.group(1)!);
    }

    return Usia(tahun: tahun, bulan: bulan);
  }

  static String convertformatDateToIndonesian(DateTime dateTime) {
    // Format tanggal dengan format "dd MMMM yyyy"
    // Contoh: "01 Januari 2023"
    return DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);
  }

  static String formatDateYearMonthDay(DateTime date) {
    // Format tanggal dengan format "dd MMMM yyyy"
    // Contoh: "01 Januari 2023"
    return DateFormat('yyyy-MM-dd').format(date);
  }
}

class Usia {
  final int tahun;
  final int bulan;

  Usia({required this.tahun, required this.bulan});
}
