import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../create/model/get_all_anak_by_posyadu.dart';
import '../../create/model/get_all_ibu_hamil_by_posyandu.dart';
import '../../create/model/post_create_kehadiran_model.dart';
import '../../create/service/create_kehadiran_service.dart';
import '../service/update_kehadiran_service.dart';

part 'update_kehadiran_event.dart';
part 'update_kehadiran_state.dart';

class UpdateKehadiranBloc
    extends Bloc<UpdateKehadiranEvent, UpdateKehadiranState> {
  UpdateKehadiranBloc() : super(UpdateKehadiranInitial()) {
    on<UpdateKehadiranEvent>((event, emit) {});
    on<UpdateKehadiranEventSubmit>(UpdateKehadiranSubmit);
  }

  Future<void> UpdateKehadiranSubmit(UpdateKehadiranEventSubmit event,
      Emitter<UpdateKehadiranState> emit) async {
    emit(UpdateKehadiranSubmitLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await UpdateKehadiranService()
            .patchKehadiran(event.id, accessToken,event.data);
        int statusCode = response[0] as int;
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes patch data kehadiran');
          emit(UpdateKehadiranSubmitSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(UpdateKehadiranSubmitFailed(
              'error: ada yang salah ketika update data kehadiran'));
        }
      } catch (error) {
        emit(UpdateKehadiranSubmitFailed(error.toString()));
      }
    }
  }
}
