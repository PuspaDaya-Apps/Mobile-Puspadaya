import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/tugas_kunjungan_anak_tidak_hadir_response_model.dart';
import '../../service/form_tugas_kunjungan_anak_tidak_hadir_api.dart';

part 'tugas_kunjungan_anak_tidak_hadir_event.dart';
part 'tugas_kunjungan_anak_tidak_hadir_state.dart';

class TugasKunjunganAnakTidakHadirBloc extends Bloc<TugasKunjunganAnakTidakHadirEvent, TugasKunjunganAnakTidakHadirState> {
  TugasKunjunganAnakTidakHadirBloc() : super(TugasKunjunganAnakTidakHadirInitial()) {
    on<TugasKunjunganAnakTidakHadirEvent>((event, emit) {});

    on<GetTugasKunjungan>(getTugasKunjungan);
  }

  Future<void> getTugasKunjungan (GetTugasKunjungan event, Emitter<TugasKunjunganAnakTidakHadirState> emit) async {
    emit(TugasKunjunganAnakTidakHadirProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();
 
    if(accessToken == null) {
      emit(TugasKunjunganAnakTidakHadirTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await FormTugasKunjunganAnakTidakHadirApi().getTugasKunjunganService(accessToken);

        int statusCode = response[0] as int;
        final TugasKunjunganAnakTidakHadirResponseModel tugasKunjunganAnakTidakHadirResponseModel = TugasKunjunganAnakTidakHadirResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(TugasKunjunganAnakTidakHadirSuccessState(tugasKunjunganAnakTidakHadirResponseModel));
        } else if (statusCode == 401) {
          emit(TugasKunjunganAnakTidakHadirTokenExpiredState());
        } else {
          emit(TugasKunjunganAnakTidakHadirFailedState(tugasKunjunganAnakTidakHadirResponseModel.message));
        }
      } catch (error) {
        emit(TugasKunjunganAnakTidakHadirFailedState(error.toString()));
      }
    }
  }
}
