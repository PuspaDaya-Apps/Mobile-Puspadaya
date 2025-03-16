import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_pengukuran_ibu_hamil_response_model.dart';
import '../../service/detail_pengukuran_ibu_hamil_api.dart';

part 'detail_pengukuran_ibu_hamil_event.dart';
part 'detail_pengukuran_ibu_hamil_state.dart';

class DetailPengukuranIbuHamilBloc extends Bloc<DetailPengukuranIbuHamilEvent, DetailPengukuranIbuHamilState> {
  DetailPengukuranIbuHamilBloc() : super(DetailPengukuranIbuHamilInitial()) {
    on<DetailPengukuranIbuHamilEvent>((event, emit) {});

    on<GetDetailPengukuranIbuHamil>(getDetaiPengukuranIbuHamil);
  }

  Future<void> getDetaiPengukuranIbuHamil (GetDetailPengukuranIbuHamil event, Emitter<DetailPengukuranIbuHamilState> emit) async {
    emit(DetailPengukuranIbuHamilProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailPengukuanIbuHamilTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailPengukuranIbuHamilApi().pengukuranIbuHamilService(accessToken, event.pengukuranId);

        int statusCode = response[0] as int;
        final DetailPengukuranIbuHamilResponseModel detailPengukuranIbuHamilResponseModel = DetailPengukuranIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DetailPengukuranIbuHamilSuccesState(
            detailPengukuranIbuHamilResponseModel
          ));
        } else if (statusCode == 401) {
          emit(DetailPengukuanIbuHamilTokenExpiredState());
        } else {
          emit(DetailPengukuranIbuHamilFailedState(detailPengukuranIbuHamilResponseModel.message));
        }
      } catch (error) {
        emit(DetailPengukuranIbuHamilFailedState(error.toString()));
      }
    }
  }
}
