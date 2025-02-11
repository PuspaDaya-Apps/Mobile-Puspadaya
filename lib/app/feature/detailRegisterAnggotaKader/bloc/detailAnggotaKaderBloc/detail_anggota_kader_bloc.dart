import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_anggota_kader_response_model.dart';
import '../../service/detail_anggota_kader_api.dart';

part 'detail_anggota_kader_event.dart';
part 'detail_anggota_kader_state.dart';

class DetailAnggotaKaderBloc extends Bloc<DetailAnggotaKaderEvent, DetailAnggotaKaderState> {
  DetailAnggotaKaderBloc() : super(DetailAnggotaKaderInitial()) {
    on<DetailAnggotaKaderEvent>((event, emit) {});

    on<GetDetailAnggotaKader>(getDetailAnggotaKader);
  }

  Future<void> getDetailAnggotaKader (GetDetailAnggotaKader event, Emitter<DetailAnggotaKaderState> emit) async {
    emit(DetailAnggotaKaderProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailAnggotaKaderTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailAnggotaKaderApi().getDetailAnggotaKaderService(accessToken, event.anggotaKaderId);

        int statusCode = response[0] as int;
        final DetailAnggotaKaderResponseModel detailAnggotaKaderResponseModel = DetailAnggotaKaderResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DetailAnggotaKaderSuccesState(detailAnggotaKaderResponseModel));
        } else if (statusCode == 401) {
          emit(DetailAnggotaKaderTokenExpiredState());
        } else {
          emit(DetailAnggotaKaderFailedState(detailAnggotaKaderResponseModel.message));
        }
      } catch (error) {
        emit(DetailAnggotaKaderFailedState(error.toString()));
      }
    }
  }
}
