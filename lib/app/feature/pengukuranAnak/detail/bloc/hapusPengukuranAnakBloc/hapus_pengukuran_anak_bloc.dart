import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/hapus_pengukuran_anak_response_model.dart';
import '../../service/detail_pengukuran_anak_api.dart';

part 'hapus_pengukuran_anak_event.dart';
part 'hapus_pengukuran_anak_state.dart';

class HapusPengukuranAnakBloc extends Bloc<HapusPengukuranAnakEvent, HapusPengukuranAnakState> {
  HapusPengukuranAnakBloc() : super(HapusPengukuranAnakInitial()) {
    on<HapusPengukuranAnakEvent>((event, emit) {});

    on<SendHapusPengukuranAnak>(hapusPengukuran);
  }

  Future<void> hapusPengukuran (SendHapusPengukuranAnak event, Emitter<HapusPengukuranAnakState> emit) async {
    emit(HapusPengukuranAnakProccesState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailPengukuranAnakApi().hapusPengukuranAnakService(accessToken, event.pengukuranId);

        int statusCode = response[0] as int;
        final HapusPengukuranAnakResponseModel hapusPengukuranAnakResponseModel = HapusPengukuranAnakResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
            emit(HapusPengukuranAnakSuccessState());
          } else if (statusCode == 401) {
            emit(TokenExpiredState());
          } else {
            emit(HapusPengukuranAnakFailedState(hapusPengukuranAnakResponseModel.message));
          }
      } catch (error) {
        emit(HapusPengukuranAnakFailedState(error.toString()));
      }
    }

  }
}
