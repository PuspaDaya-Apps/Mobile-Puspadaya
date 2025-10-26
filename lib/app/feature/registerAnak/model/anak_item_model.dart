class AnakItemModel {
  final String id;
  final String nama;
  final String nik;
  final String jenisKelamin;
  final int bulan;
  final int year;
  DateTime? updatedAtAnak;
  final String status;
  AnakItemModel({
    required this.id,
    required this.nama,
    required this.nik,
    required this.jenisKelamin,
    required this.bulan,
    required this.year,
    this.updatedAtAnak,
    required this.status
  });
}
