import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_jadwal_posyandu_model.dart';
import '../model/patch_jadwal_posyandu_model.dart';
import '../service/patch_jadwal_posyandu.dart';

part 'jadwal_edit_event.dart';
part 'jadwal_edit_state.dart';

class JadwalEditBloc extends Bloc<JadwalEditEvent, JadwalEditState> {
  JadwalEditBloc() : super(JadwalEditInitial()) {
    on<JadwalEditEvent>((event, emit) {});
    on<GetDetailJadwal>(getDetailJadwalPosyandu);
    on<EditJadwalEvent>(editJadwalPosyandu);
  }
  Future<void> getDetailJadwalPosyandu(
      GetDetailJadwal event, Emitter<JadwalEditState> emit) async {
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(JadwalDetailLoading());
        logger.d('id jadwal = ${event.id}');
        dynamic response = await PatchJadwalPosyandu()
            .getDetailJadwalPosyandu(event.id, accessToken);
        GetDetailJadwalPosyanduModel data =
            GetDetailJadwalPosyanduModel.fromJson(response[1]);
        int statusCode = response[0] as int;
        if (statusCode == 200) {
          logger.d('succesfull get data detail jadwal $data');
          emit(JadwalDetailLoaded(data: data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(JadwalDetailFailure(response[1].toString()));
        }
      } catch (error) {
        emit(JadwalDetailFailure(error.toString()));
      }
    }
  }

  Future<void> editJadwalPosyandu(
      EditJadwalEvent event, Emitter<JadwalEditState> emit) async {
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(JadwalEditLoading());
        dynamic response = await PatchJadwalPosyandu().patchJadwalPosyandu(
            event.id, accessToken, event.patchJadwalPosyanduModel);
        int statusCode = response[0] as int;
        if (statusCode == 200) {
          emit(JadwalEditSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(JadwalEditFailure(response[1].toString()));
        }
      } catch (error) {
        emit(JadwalEditFailure(error.toString()));
      }
    }
  }
}
