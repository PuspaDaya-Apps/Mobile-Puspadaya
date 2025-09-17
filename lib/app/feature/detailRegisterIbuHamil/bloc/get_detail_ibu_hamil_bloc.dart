import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_ibu_hamil_model.dart';
import '../service/detail_ibu_hamil.dart';

part 'get_detail_ibu_hamil_event.dart';
part 'get_detail_ibu_hamil_state.dart';

class GetDetailIbuHamilBloc
    extends Bloc<GetDetailIbuHamilEvent, GetDetailIbuHamilState> {
  GetDetailIbuHamilBloc() : super(GetDetailIbuHamilInitial()) {
    on<GetDetailIbuHamilEvent>((event, emit) {});
    on<FetchDetailIbuHamil>(fetchDetailIbuHamil);
  }
  Future<void> fetchDetailIbuHamil(
      FetchDetailIbuHamil event, Emitter<GetDetailIbuHamilState> emit) async {
    emit(GetDetailIbuHamilLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response =
            await DetailIbuHamil().getDetailIbuHamil(accessToken, event.id);
        int statusCode = response[0] as int;
        GetDetailIbuHamilModel dataIbuHamil = GetDetailIbuHamilModel.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get detail data ibu hamil');

          int? statusIbuHamil;

          if(dataIbuHamil.data!.bayiLahirHidup) {
            statusIbuHamil = 0;
          }
          if(dataIbuHamil.data!.bayiLahirMeninggal) {
            statusIbuHamil = 1;
          }
          if(dataIbuHamil.data!.ibuMeninggal) {
            statusIbuHamil = 2;
          }
          if(dataIbuHamil.data!.lahirPindah) {
            statusIbuHamil = 3;
          }

          emit(GetDetailIbuHamilSuccess(dataIbuHamil, statusIbuHamil));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(GetDetailIbuHamilFailed(dataIbuHamil.message));
        }
      } catch (error) {
        emit(GetDetailIbuHamilFailed(error.toString()));
      }
    }
  }
}
