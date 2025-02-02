class Jobitems {
  bool status;
  String label;
  List<Jobitems>? subItems;
  bool? isExpanded;
  Jobitems({
    required this.label,
    required this.status,
    this.isExpanded,
    this.subItems, // Menambahkan parameter opsional untuk sub-items
  });
}
