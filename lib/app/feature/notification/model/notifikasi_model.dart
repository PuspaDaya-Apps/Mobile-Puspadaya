// Model untuk menyimpan data notifikasi
enum Category{
  def, // notifikasi umum
  home,
  pengukuran,
  kunjungan,
  jadwal,
  profile,
  register,
  alatUkur,
  monitoing,
  faktorResiko,
  parmteterGizi,
  bebanKerja,
  laporan,
  eppgbm
}
class NotifikasiModel {
  final String title;
  final String message;
  final DateTime timestamp;
  Category? category;

  NotifikasiModel({required this.title, required this.message, required this.timestamp, this.category});
}