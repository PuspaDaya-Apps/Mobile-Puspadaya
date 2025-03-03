import '../../feature/detailRegisterIbuHamil/model/get_detail_ibu_hamil_model.dart'
    as GetDetailIbuHamilModel;

class PaketToUpdateRegisterIbuHamil {
  final String id;
  final GetDetailIbuHamilModel.Data data;
  PaketToUpdateRegisterIbuHamil({required this.id, required this.data});
}
