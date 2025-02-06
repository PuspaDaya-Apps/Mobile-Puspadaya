class FilesEPPGBMModel {
  final String url;
  final String filename;
  bool isChecked; // Tidak perlu nullable, default-nya false

  FilesEPPGBMModel({
    required this.url,
    required this.filename,
    this.isChecked = false, // Default false untuk seleksi awal
  });

  // Buat fungsi untuk mengubah status isChecked
  FilesEPPGBMModel copyWith({bool? isChecked}) {
    return FilesEPPGBMModel(
      url: url,
      filename: filename,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}