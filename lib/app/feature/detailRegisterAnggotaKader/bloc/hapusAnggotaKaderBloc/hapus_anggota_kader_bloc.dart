import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/hapus_anggota_kader_response_model.dart';
import '../../service/detail_anggota_kader_api.dart';

part 'hapus_anggota_kader_event.dart';
part 'hapus_anggota_kader_state.dart';

class HapusAnggotaKaderBloc extends Bloc<HapusAnggotaKaderEvent, HapusAnggotaKaderState> {
  HapusAnggotaKaderBloc() : super(HapusAnggotaKaderInitial()) {
    on<HapusAnggotaKaderEvent>((event, emit) {});

    on<HapusDataAnggotaKader>(hapusAnggotaKader);
  }

  Future<void> hapusAnggotaKader (HapusDataAnggotaKader event, Emitter<HapusAnggotaKaderState> emit) async {
    emit(HapusAnggotaKaderProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(HapusAnggotaKaderTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailAnggotaKaderApi().deleteAnggotaKaderService(accessToken, event.anggotaKaderId);

        int statusCode = response[0] as int;
        // final HapusAnggotaKaderResponseModel hapusAnggotaKaderResponseModel = HapusAnggotaKaderResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(HapusAnggotaKaderSuccesState());
        } else if (statusCode == 401) {
          emit(HapusAnggotaKaderTokenExpiredState());
        } else {
          emit(const HapusAnggotaKaderFailedState('ERROR SERVER'));
        }
      } catch (error) {
        emit(HapusAnggotaKaderFailedState(error.toString()));
      }
    }
  }
}
