import '../../feature/pengukuranAnak/detail/model/detail_pengukuran_anak_response_model.dart';

class PaketToUpdatePengukuranAnakModel {
  String pengukuranId;
  DetailPengukuranAnakResponseModel data;

  PaketToUpdatePengukuranAnakModel({
    required this.pengukuranId,
    required this.data
  });
}