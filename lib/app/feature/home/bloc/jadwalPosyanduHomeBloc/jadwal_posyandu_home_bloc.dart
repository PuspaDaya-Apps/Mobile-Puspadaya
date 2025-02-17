import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/jadwal_home_response_model.dart';
import '../../service/home_api.dart';

part 'jadwal_posyandu_home_event.dart';
part 'jadwal_posyandu_home_state.dart';

class JadwalPosyanduHomeBloc
    extends Bloc<JadwalPosyanduHomeEvent, JadwalPosyanduHomeState> {
  JadwalPosyanduHomeBloc() : super(JadwalPosyanduHomeProcessState()) {
    on<JadwalPosyanduHomeEvent>((event, emit) {});

    on<GetJadwalHome>(getJadwalHome);
  }

  Future<void> getJadwalHome(
      GetJadwalHome event, Emitter<JadwalPosyanduHomeState> emit) async {
    emit(JadwalPosyanduHomeProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(JadwalPosyanduHomeTokenExpiredState());
    } else {
      try {
        List<dynamic> response =
            await HomeApi().getJadwalHomeService(accessToken);

        int statusCode = response[0] as int;
        final JadwalHomeResponseModel cardHomeResponseModel =
            JadwalHomeResponseModel.fromJson(response[1]);

        if (statusCode == 200) {
          List<Data> dataTemp = cardHomeResponseModel.data!
              .where((value) =>
                  value.tanggalPelaksanaan.isAfter(DateTime.now()) ||
                  value.tanggalPelaksanaan.isAtSameMomentAs(DateTime.now()))
              .toList();

          dataTemp.sort(
              (a, b) => a.tanggalPelaksanaan.compareTo(b.tanggalPelaksanaan));

          logger.d('dataTemp ${dataTemp[1].tanggalPelaksanaan}');
          emit(JadwalPosyanduHomeSuccessState(
              dataTemp.isEmpty ? null : dataTemp[0]));
        } else if (statusCode == 401) {
          emit(JadwalPosyanduHomeTokenExpiredState());
        } else {
          emit(JadwalPosyanduHomeFailedState(cardHomeResponseModel.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(JadwalPosyanduHomeFailedState(error.toString()));
      }
    }
  }
}
