import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_kunjungan_ibu_hamil_response_model.dart';
import '../../service/detail_kunjungan_ibu_hamil_api.dart';

part 'detail_kunjungan_ibu_hamil_event.dart';
part 'detail_kunjungan_ibu_hamil_state.dart';

class DetailKunjunganIbuHamilBloc extends Bloc<DetailKunjunganIbuHamilEvent, DetailKunjunganIbuHamilState> {
  DetailKunjunganIbuHamilBloc() : super(DetailKunjunganIbuHamilProccessState()) {
    on<DetailKunjunganIbuHamilEvent>((event, emit) {});

    on<GetDetailKunjunganIbuHamil>(getDetailKunjunganIbuHamil);
  }

  Future<void> getDetailKunjunganIbuHamil (GetDetailKunjunganIbuHamil event, Emitter<DetailKunjunganIbuHamilState> emit) async {
    emit(DetailKunjunganIbuHamilProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailKunjunganIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailKunjunganIbuHamilApi().getDetailIbuHamil(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        

        if(statusCode == 200) {
          final DetailKunjunganIbuHamilResponseModel detailKunjunganIbuHamilResponseModel = DetailKunjunganIbuHamilResponseModel.fromJson(response[1]);
          emit(DetailKunjunganIbuHamilSuccessState(detailKunjunganIbuHamilResponseModel));
        } else if (statusCode == 401) {
          emit(DetailKunjunganIbuHamilTokenExpiredState());
        } else {
          final ErrorMessage message = ErrorMessage.fromJson(response[1]);
          emit(DetailKunjunganIbuHamilFailedState(message.message));
        }
      } catch (error) {
        emit(DetailKunjunganIbuHamilFailedState(error.toString()));
      }
    }
  }
}
