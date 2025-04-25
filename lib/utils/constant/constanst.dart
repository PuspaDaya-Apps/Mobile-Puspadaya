import '../../app/model/CheckBoxKunjungan.dart';

  final List<String> selectPosyandu = [
    'Posyandu', 
    'Rumah'
  ];

  final List<String> selectPosition = [
    '-'
    'Terlentang',
    'Berdiri',
  ];

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
  'MOP',
  'KONDOM',
  '-'
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
    id: '',
    isChecked: false,
    label: 'Pengukuran di Rumah',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Penggunaan Buku KIA',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Isi Piringku',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Aktivitas Fisik',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Imunisasi',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Vitamin A',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Obat Cacing',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Stimulasi Perkembangan',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Hasil Penimbangan dan Pengukuran, Serta Tindak Lanjut nya',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Pemantauan Tanda Bahaya Bayi dan Anak',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Anak Tidak Berada di Rumah',
  ),
];

List<CheckboxKunjungan> listOfCheckboxAnakStunting = [
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Pemberian Makanan Tambahan (PMT)',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Penyuluhan PMT',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Pengukuran di Rumah',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Penggunaan Buku KIA',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Isi Piringku',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Aktivitas Fisik',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Imunisasi',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Vitamin A',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Obat Cacing',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Stimulasi Perkembangan',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Hasil Penimbangan dan Pengukuran, Serta Tindak Lanjut nya',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Pemantauan Tanda Bahaya Bayi dan Anak',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Anak Tidak Berada di Rumah',
  ),
];

List<CheckboxKunjungan> listOfCheckboxIbuHamil = [
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Pemberian Makanan Tambahan',
  ),
  CheckboxKunjungan(
    id: '',
    isChecked: false,
    label: 'Ibu Tidak Berada di Rumah',
  ),
];
const String lakiLakiTinggiBadan =
    "https://docs.google.com/spreadsheets/d/1kVDOFy5vmZSCtnnl4zVNOXS-kuloHPqx/edit?gid=1214439835#gid=1214439835export?format=xlsx";
const String lakiLakiBeratBadan =
    "https://docs.google.com/spreadsheets/d/19NN0rpN0PkXMdE-uezOb7-FykvBFyjkG/edit?gid=769493304#gid=769493304export?format=xlsx";
const String perempuanTinggiBadan =
    "https://docs.google.com/spreadsheets/d/1qe93X_z8-vK7Y4rGPheQTplSs1cb35bi/edit?gid=304078473#gid=304078473/export?format=xlsx";
const String perempuanBeratBadan =
    "https://docs.google.com/spreadsheets/d/1MbZFuIm6Lpz8EbtDpTOd6OMML7ZRuTgJ/edit?gid=690794909#gid=690794909export?format=xlsx";
