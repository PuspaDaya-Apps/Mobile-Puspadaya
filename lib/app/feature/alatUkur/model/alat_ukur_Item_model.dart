class AlatUkurItemModel {
  final String id;
  final String nama;
  final String merek;
  final String kondisi;
  final String? image;
  AlatUkurItemModel(
      {this.image,
      required this.id,
      required this.nama,
      required this.merek,
      required this.kondisi});
}
