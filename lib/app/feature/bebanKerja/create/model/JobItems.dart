class Jobitems {
  String? id;
  bool status;
  String label;
  int? bobot;
  List<Jobitems>? subItems;
  bool? isExpanded;
  Jobitems({
    this.id,
    required this.label,
    this.bobot,
    required this.status,
    this.isExpanded,
    this.subItems, // Menambahkan parameter opsional untuk sub-items
  });
}
