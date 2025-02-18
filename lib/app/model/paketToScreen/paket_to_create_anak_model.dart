class PaketToCreateAnakModel {
  String provinsi;
  String kabupaten;
  String kecamatan;
  String idKartuKeluarga;
  String nomorKartuKeluarga;
  String namaAyah;
  String namaIbu;

  PaketToCreateAnakModel({
    required this.idKartuKeluarga,
    required this.nomorKartuKeluarga,
    required this.namaAyah,
    required this.namaIbu,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
  });
}
