class OrangTuaItemModel {
  final String kk;
  final String husband;
  final String wife;
  final String initial;
  final String ayahId;
  final String ibuId;
  DateTime? updatedAtAyah;
  DateTime? updatedAtIbu;
  OrangTuaItemModel(
      {required this.ayahId,
      required this.ibuId,
      required this.kk,
      required this.husband,
      required this.wife,
      required this.initial,
      this.updatedAtAyah,
      this.updatedAtIbu});
}
