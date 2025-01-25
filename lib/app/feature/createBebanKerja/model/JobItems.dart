class Jobitems {
  bool status;
  String label;
  List<Jobitems>? subItems;
  Jobitems({
    required this.label,
    required this.status,
    this.subItems, // Menambahkan parameter opsional untuk sub-items
  });
}
