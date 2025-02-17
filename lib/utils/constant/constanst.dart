final List<String> selectGender = [
  'Laki-laki',
  'Perempuan',
];

final List<String> selectCaraLahir = [
  'normal',
  'caesar',
];
final List<String> selectStatusKelahiran = [
  'normal',
  'prematur',
];
final List<String> selectStatusOrangTuaAnak = [
  'Orang Tua',
  'Wali',
];

final List<String> disabilities = [
  'Tunanetra',
  'Tunarungu',
  'Tunawicara',
  'Tunadaksa',
  'Tunagharita',
  "Autisme",
];

List<String> selectGolDarah = [
  // A+, A-, B+, B-, AB+, AB-, O+, O-, Tidak Tahu, -
  'A+',
  'A-',
  'B+',
  'B-',
  'AB+',
  'AB-',
  'O+',
  'O-',
  'Tidak Tahu',
  '-',
];

final List<String> selectStatusHubunganDenganAnak = [
  'Nenek',
  'Kakek',
  'Bibi',
  'Paman',
  'Kakak',
];

final List<String> selectJenisKB = [
  'PIL',
  'IUD',
  'SUNTIK',
  'IMPLANT',
  'LAINNYA'
];

final List<Map<String, String>> policy = [
  {
    "title": "Puspadaya",
    "desc":
        "Kami di PUSPADAYA berkomitmen untuk menjaga privasi dan keamanan data Anda. Kebijakan ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi Anda saat menggunakan aplikasi kami.",
  },
  {
    "title": "1. Pengumpulan Data",
    "desc":
        "Kami hanya mengumpulkan informasi yang diperlukan untuk menjalankan aplikasi, seperti data pribadi (misalnya, nama dan alamat email). Semua informasi yang kami kumpulkan digunakan untuk memberikan layanan terbaik bagi Anda.",
  },
  {
    "title": "2. Penggunaan Data",
    "desc":
        "Data yang kami kumpulkan digunakan untuk meningkatkan pengalaman pengguna dan memberikan layanan yang lebih baik. Kami tidak akan menjual atau membagikan data pribadi Anda kepada pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum.",
  },
  {
    "title": "3. Keamanan Data",
    "desc":
        "Kami menggunakan langkah-langkah keamanan yang sesuai untuk melindungi data Anda dari akses yang tidak sah, perubahan, atau pengungkapan.",
  },
];

List<String> hari = [
  "Senin",
  "Selasa",
  "Rabu",
  "Kamis",
  "Jum'at",
  "Sabtu",
  "Minggu"
];
List<String> bulan = [
  "Januari",
  "Februari",
  "Maret",
  "April",
  "Mei",
  "Juni",
  "July",
  "Agustus",
  "September",
  "Oktober",
  "November",
  "Desember"
];

List<String> selectTahun = [
  (DateTime.now().year - 1).toString(),
  DateTime.now().year.toString(),
  (DateTime.now().year + 1).toString(),
  (DateTime.now().year + 2).toString(),
];
