import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/jadwal/create/model/post_jadwal_posyandu_model.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../../config/validator/validation_error_model.dart';
import '../service/post_jadwal_posyandu.dart';

part 'jadwal_create_event.dart';
part 'jadwal_create_state.dart';

class JadwalCreateBloc extends Bloc<JadwalCreateEvent, JadwalCreateState> {
  JadwalCreateBloc() : super(JadwalCreateInitial()) {
    on<JadwalCreateEvent>((event, emit) {});
    on<CreateJadwalEvent>(createJadwal);
  }
  Future<void> createJadwal(
      CreateJadwalEvent event, Emitter<JadwalCreateState> emit) async {
    emit(JadwalCreateProccess());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await CreateJadwalPosyandu()
            .createJadwalPosyandu(event.postJadwalPosyanduModel, accessToken);
        int statusCode = response[0] as int;
        if (statusCode == 201) {
          emit(JadwalCreateSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          ValidationErrorModel validationError =
              ValidationErrorModel.fromJson(response[1]);
          // logger.e(validationError.errors.toString());

          emit(JadwalCreateFailed(validationError.message));
        }
      } catch (error) {
        emit(JadwalCreateFailed(error.toString()));
      }
    }
  }
}
