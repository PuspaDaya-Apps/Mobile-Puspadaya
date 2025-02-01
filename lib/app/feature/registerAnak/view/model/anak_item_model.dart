class AnakItemModel {
  final String name;
  final String nik;
  final String gender;
  int? year;
  final int month;
  AnakItemModel(
      {required this.name,
      required this.nik,
      required this.gender,
      required this.month,
      this.year});
}
