import '../../feature/PengukuranTamu/detail/model/detail_pengukuran_tamu_response_model.dart';

class PaketToUpdatePengukuranTamuModel {
  String pengukuranId;
  DetailPengukuranTamuResponseModel data;

  PaketToUpdatePengukuranTamuModel({
    required this.pengukuranId,
    required this.data
  });
}