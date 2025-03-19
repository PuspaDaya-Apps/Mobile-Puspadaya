class ChartDataModel {
  final int x; // Bulan (usia anak dalam bulan)
  double? y; // Nilai dari API (bisa null)
  final String? tanggalPengukuran; // Tambahan tanggal pengukuran dari server
  final double yellowLowLow;
  final double yellowLowHigh;
  final double greenLightLowLow;
  final double greenLightLowHigh;
  final double greenLow;
  final double greenLine;
  final double greenHigh;
  final double greenLightHighLow;
  final double greenLightHighHigh;
  final double yellowHighLow;
  final double yellowHighHigh;

  ChartDataModel({
    required this.x,
    this.y,
    this.tanggalPengukuran,
    required this.yellowLowLow,
    required this.yellowLowHigh,
    required this.greenLightLowLow,
    required this.greenLightLowHigh,
    required this.greenLow,
    required this.greenLine,
    required this.greenHigh,
    required this.greenLightHighLow,
    required this.greenLightHighHigh,
    required this.yellowHighLow,
    required this.yellowHighHigh,
  });

  // Factory method untuk parsing dari List<double>
  factory ChartDataModel.fromList(List<dynamic> values) {
    return ChartDataModel(
      x: values[0].toInt(),
      y: values[1], // Bisa null, tergantung API
      tanggalPengukuran: values.length > 9 ? values[9] : null, // Tambahkan tanggal jika ada
      yellowLowLow: values[2],
      yellowLowHigh: values[3],
      greenLightLowLow: values[4],
      greenLightLowHigh: values[5],
      greenLow: values[6],
      greenLine: values[7],
      greenHigh: values[8],
      greenLightHighLow: values[8],
      greenLightHighHigh: values[9],
      yellowHighLow: values[9],
      yellowHighHigh: values[10],
    );
  }

  factory ChartDataModel.fromJson(Map<String, dynamic> json) {
    return ChartDataModel(
      x: json['x'],
      y: json['y'], // Bisa null, tergantung API
      tanggalPengukuran: json['tanggal_pengukuran'], // Tambahkan parsing tanggal
      yellowLowLow: json['yellowLowLow'],
      yellowLowHigh: json['yellowLowHigh'],
      greenLightLowLow: json['greenLightLowLow'],
      greenLightLowHigh: json['greenLightLowHigh'],
      greenLow: json['greenLow'],
      greenLine: json['greenLine'],
      greenHigh: json['greenHigh'],
      greenLightHighLow: json['greenLightHighLow'],
      greenLightHighHigh: json['greenLightHighHigh'],
      yellowHighLow: json['yellowHighLow'],
      yellowHighHigh: json['yellowHighHigh'],
    );
  }

  void updateY(double? newY) {
    y = newY;
  }
}
