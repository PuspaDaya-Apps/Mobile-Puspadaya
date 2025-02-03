import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/hapus_beban_kerja_response_model.dart';
import '../../service/detail_beban_kerja_api.dart';

part 'hapus_beban_kerja_event.dart';
part 'hapus_beban_kerja_state.dart';

class HapusBebanKerjaBloc extends Bloc<HapusBebanKerjaEvent, HapusBebanKerjaState> {
  HapusBebanKerjaBloc() : super(HapusBebanKerjaInitial()) {
    on<HapusBebanKerjaEvent>((event, emit) {});

    on<SendHapusBebanKerja>(hapusBebanKerja);
  }

  Future<void> hapusBebanKerja (SendHapusBebanKerja event, Emitter<HapusBebanKerjaState> emit) async {
    emit(HapusBebanKerjaProccesState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailBebanKerjaApi().hapusBebanKerjaService(accessToken, event.bebanKerjaId);

        int statusCode = response[0] as int;
        final HapusBebanKerjaResponseModel hapusBebanKerjaResponseModel = HapusBebanKerjaResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
            emit(HapusBebanKerjaSuccessState());
          } else if (statusCode == 401) {
            emit(TokenExpiredState());
          } else {
            emit(HapusBebanKerjaFailedState(hapusBebanKerjaResponseModel.message));
          }
      } catch (error) {
        emit(HapusBebanKerjaFailedState(error.toString()));
      }
    }
  }
}
