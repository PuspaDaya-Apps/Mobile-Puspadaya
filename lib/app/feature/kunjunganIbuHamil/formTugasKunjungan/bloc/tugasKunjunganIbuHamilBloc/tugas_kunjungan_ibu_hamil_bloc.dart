import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/tugas_kunjungan_ibu_hamil_response_model.dart';
import '../../service/form_tugas_kunjungan_anak_stunting_api.dart';

part 'tugas_kunjungan_ibu_hamil_event.dart';
part 'tugas_kunjungan_ibu_hamil_state.dart';

class TugasKunjunganIbuHamilBloc extends Bloc<TugasKunjunganIbuHamilEvent, TugasKunjunganIbuHamilState> {
  TugasKunjunganIbuHamilBloc() : super(TugasKunjunganIbuHamilProccessState()) {
    on<TugasKunjunganIbuHamilEvent>((event, emit) {});

    on<GetTugasKunjungan>(getTugasKunjungan);
  }

  Future<void> getTugasKunjungan (GetTugasKunjungan event, Emitter<TugasKunjunganIbuHamilState> emit) async {
    emit(TugasKunjunganIbuHamilProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(TugasKunjunganIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await FormTugasKunjunganIbuHamilApi().getTugasKunjunganService(accessToken);

        int statusCode = response[0] as int;
        final TugasKunjunganIbuHamilResponseModel tugasKunjunganIbuHamilResponseModel = TugasKunjunganIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(TugasKunjunganIbuHamilSuccessState(tugasKunjunganIbuHamilResponseModel));
        } else if (statusCode == 401) {
          emit(TugasKunjunganIbuHamilTokenExpiredState());
        } else {
          emit(TugasKunjunganIbuHamilFailedState(tugasKunjunganIbuHamilResponseModel.message));
        }
      } catch (error) {
        emit(TugasKunjunganIbuHamilFailedState(error.toString()));
      }
    }
  }
}
