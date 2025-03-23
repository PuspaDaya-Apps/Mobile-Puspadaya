class GetGrafikKmsModel {
  int usiaAnak;
  double? beratBadan;
  double? tinggiBadan;
  DateTime? tanggalPengukuran;

  GetGrafikKmsModel({
    required this.usiaAnak,
    this.beratBadan,
    this.tinggiBadan,
    this.tanggalPengukuran,
  });

  // Factory method to create a GetGrafikKmsModel from JSON
  factory GetGrafikKmsModel.fromJson(Map<String, dynamic> json) {
    return GetGrafikKmsModel(
      usiaAnak: json['usia_anak'],
      beratBadan: json['berat_badan'] != null ? json['berat_badan'].toDouble() : null,
      tinggiBadan: json['tinggi_badan'] != null ? json['tinggi_badan'].toDouble() : null,
      tanggalPengukuran: json['tanggal_pengukuran'] != null ? DateTime.parse(json['tanggal_pengukuran']) : null,
    );
  }

  // Method to convert a GetGrafikKmsModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'usia_anak': usiaAnak,
      'berat_badan': beratBadan,
      'tinggi_badan': tinggiBadan,
      'tanggal_pengukuran': tanggalPengukuran?.toIso8601String(),
    };
  }
}