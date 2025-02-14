import '../../feature/detailRegisterAnggotaKader/model/detail_anggota_kader_response_model.dart';

class PaketToUpdateAnggotaKaderModel {
  final String anggotaKaderId;
  final DetailAnggotaKaderResponseModel detailAnggotaKaderResponseModel;

  PaketToUpdateAnggotaKaderModel({
    required this.anggotaKaderId,
    required this.detailAnggotaKaderResponseModel
  });
}