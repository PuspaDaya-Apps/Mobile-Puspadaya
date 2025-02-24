import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/tugas_kunjungan_anak_stunting_response_model.dart';
import '../../service/form_tugas_kunjungan_anak_stunting._api.dart';

part 'tugas_kunjungan_anak_stunting_event.dart';
part 'tugas_kunjungan_anak_stunting_state.dart';

class TugasKunjunganAnakStuntingBloc extends Bloc<TugasKunjunganAnakStuntingEvent, TugasKunjunganAnakStuntingState> {
  TugasKunjunganAnakStuntingBloc() : super(TugasKunjunganAnakStuntingProccessState()) {
    on<TugasKunjunganAnakStuntingEvent>((event, emit) {});

    on<GetTugasKunjungan>(getTugasKunjungan);
  }

  Future<void> getTugasKunjungan (GetTugasKunjungan event, Emitter<TugasKunjunganAnakStuntingState> emit) async {
    emit(TugasKunjunganAnakStuntingProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(TugasKunjunganAnakStuntingTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await FormTugasKunjunganAnakStuntingApi().getTugasKunjunganService(accessToken);

        int statusCode = response[0] as int;
        final TugasKunjunganAnakStuntingResponseModel tugasKunjunganAnakStuntingResponseModel = TugasKunjunganAnakStuntingResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(TugasKunjunganAnakStuntingSuccessState(tugasKunjunganAnakStuntingResponseModel));
        } else if (statusCode == 401) {
          emit(TugasKunjunganAnakStuntingTokenExpiredState());
        } else {
          emit(TugasKunjunganAnakStuntingFailedState(tugasKunjunganAnakStuntingResponseModel.message));
        }
      } catch (error) {
        emit(TugasKunjunganAnakStuntingFailedState(error.toString()));
      }
    }
  }
}
