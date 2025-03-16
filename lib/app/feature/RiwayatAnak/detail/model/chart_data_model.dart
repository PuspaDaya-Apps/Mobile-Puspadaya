class ChartDataModel {
  final int x; // Bulan
  double? y; // Nilai dari API (bisa null)
  // String tanggalPengukuran;
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
    // required this.tanggalPengukuran,
    required this.x,
    required this.y,
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
  factory ChartDataModel.fromList(List<double> values) {
    return ChartDataModel(
      // tanggalPengukuran: '',
      x: values[0].toInt(),
      y: values[1], // Bisa null, tergantung API
      yellowLowLow: values[2],
      yellowLowHigh: values[3],
      greenLightLowLow: values[3], // Sama dengan batas kuning atas bawah
      greenLightLowHigh: values[4],
      greenLow: values[4], // Sama dengan batas hijau bawah
      greenLine: values[5],
      greenHigh: values[6], // Sama dengan batas hijau muda bawah atas
      greenLightHighLow: values[6],
      greenLightHighHigh: values[7], // Sama dengan batas kuning bawah atas
      yellowHighLow: values[7],
      yellowHighHigh: values[8], // Batas kuning atas
    );
  }

  factory ChartDataModel.fromJson(Map<String, dynamic> json) {
    return ChartDataModel(
      // tanggalPengukuran: json['tanggal_pengukuran'],
      x: json['x'],
      y: json['y'], // Bisa null, tergantung API
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
