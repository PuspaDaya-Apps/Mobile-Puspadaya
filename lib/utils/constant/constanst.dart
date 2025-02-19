import '../../app/feature/createKunjunganStunting/view/model/CheckBoxKunjungan.dart';

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
  'A',
  'B',
  'AB',
  'O',
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

List<CheckboxKunjungan> listOfCheckboxKunjunganAnakTidakHadir = [
  CheckboxKunjungan(
    isChecked: false,
    label: 'Pengukuran di Rumah',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Penggunaan Buku KIA',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Isi Piringku',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Aktivitas Fisik',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Imunisasi',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Vitamin A',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Obat Cacing',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Stimulasi Perkembangan',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Hasil Penimbangan dan Pengukuran, Serta Tindak Lanjut nya',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Pemantauan Tanda Bahaya Bayi dan Anak',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Anak Tidak Berada di Rumah',
  ),
];

List<CheckboxKunjungan> listOfCheckboxAnakStunting = [
  CheckboxKunjungan(
    isChecked: false,
    label: 'Pemberian Makanan Tambahan (PMT)',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Penyuluhan PMT',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Pengukuran di Rumah',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Penggunaan Buku KIA',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Isi Piringku',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Aktivitas Fisik',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Imunisasi',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Vitamin A',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Obat Cacing',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Stimulasi Perkembangan',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Hasil Penimbangan dan Pengukuran, Serta Tindak Lanjut nya',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Pemantauan Tanda Bahaya Bayi dan Anak',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Anak Tidak Berada di Rumah',
  ),
];

List<CheckboxKunjungan> listOfCheckboxIbuHamil = [
  CheckboxKunjungan(
    isChecked: false,
    label: 'Pemberian Makanan Tambahan',
  ),
  CheckboxKunjungan(
    isChecked: false,
    label: 'Ibu Tidak Berada di Rumah',
  ),
];
