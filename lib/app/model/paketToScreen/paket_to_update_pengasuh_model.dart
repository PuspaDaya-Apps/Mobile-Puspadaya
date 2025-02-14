import '../../feature/detailRegisterPengasuh/model/detail_pengasuh_response_model.dart';

class PaketToUpdatePengasuhModel {
  String idPengasuh;
  DetailPengasuhResponseModel detailPengasuhResponseModel;

  PaketToUpdatePengasuhModel({
    required this.idPengasuh,
    required this.detailPengasuhResponseModel
  });
}