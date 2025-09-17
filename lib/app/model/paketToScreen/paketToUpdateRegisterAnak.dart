import '../../feature/detailRegisterAnak/model/get_detail_anak_response.dart' as GetDetailAnakModel;

class PaketToUpdateRegisterAnak {
  final GetDetailAnakModel.Data data;
  int? statusAnak;
  PaketToUpdateRegisterAnak({required this.data, this.statusAnak});
}
