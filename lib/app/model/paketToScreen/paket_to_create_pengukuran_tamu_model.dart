// ignore_for_file: library_prefixes

import '../../feature/PengukuranTamu/create/model/get_list_tamu_response_model.dart' as DataTamu show Data;
import '../../feature/PengukuranTamu/create/model/get_list_posyandu_response_model.dart' as DataPosyandu show Data;

class PaketToCreatePengukuranTamuModel {
  final DataTamu.Data dataTamu;
  final DataPosyandu.Data dataPosyandu;

  PaketToCreatePengukuranTamuModel({
    required this.dataTamu,
    required this.dataPosyandu
  });
}