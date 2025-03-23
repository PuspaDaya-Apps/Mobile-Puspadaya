import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_create_kunjungan_ibu_hamil_response_model.dart';
import '../../service/detail_create_kunjungan_ibu_hamil_api.dart';

part 'detail_create_kunjungan_ibu_hamil_event.dart';
part 'detail_create_kunjungan_ibu_hamil_state.dart';

class DetailCreateKunjunganIbuHamilBloc extends Bloc<DetailCreateKunjunganIbuHamilEvent, DetailCreateKunjunganIbuHamilState> {
  DetailCreateKunjunganIbuHamilBloc() : super(DetailCreateKunjunganIbuHamilInitial()) {
    on<DetailCreateKunjunganIbuHamilEvent>((event, emit) {});

    on<GetDetailKunjunganIbuHamil>(getDetailKunjunganIbuHamil);
  }

  Future<void> getDetailKunjunganIbuHamil (GetDetailKunjunganIbuHamil event, Emitter<DetailCreateKunjunganIbuHamilState> emit) async {
    emit(DetailCreateKunjunganIbuHamilProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailCreateKunjunganIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailCreateKunjunganIbuHamilApi().getDetailIbuHamil(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        

        if(statusCode == 200) {
          final DetailCreateKunjunganIbuHamilResponseModel detailCreateKunjunganIbuHamilResponseModel = DetailCreateKunjunganIbuHamilResponseModel.fromJson(response[1]);
          emit(DetailCreateKunjunganIbuHamilSuccessState(detailCreateKunjunganIbuHamilResponseModel));
        } else if (statusCode == 401) {
          emit(DetailCreateKunjunganIbuHamilTokenExpiredState());
        } else {
          final ErrorMessage message = ErrorMessage.fromJson(response[1]);
          emit(DetailCreateKunjunganIbuHamilFailedState(message.message));
        }
      } catch (error) {
        emit(DetailCreateKunjunganIbuHamilFailedState(error.toString()));
      }
    }
  }
}
