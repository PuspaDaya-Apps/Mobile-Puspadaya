import '../../feature/pengukuranAnak/detail/model/detail_pengukuran_anak_response_model.dart';

class PaketToUpdatePengukuranTamuModel {
  String pengukuranId;
  DetailPengukuranAnakResponseModel data;

  PaketToUpdatePengukuranTamuModel({
    required this.pengukuranId,
    required this.data
  });
}