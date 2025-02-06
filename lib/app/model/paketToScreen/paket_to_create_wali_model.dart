import '../../feature/createRegisterAnak/bloc/createAnakBloc/create_anak_bloc.dart';
import '../../feature/createRegisterAnak/model/create_anak_model.dart';

class PaketToCreateWaliModel {
  CreateAnakBloc createAnakBloc;
  CreateAnakModel createAnakModel;

  PaketToCreateWaliModel({
    required this.createAnakBloc,
    required this.createAnakModel
  });
}