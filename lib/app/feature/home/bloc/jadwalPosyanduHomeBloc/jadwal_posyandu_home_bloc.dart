import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/home/model/total_point_response_model.dart';

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
        // ignore: use_build_context_synchronously
        List<dynamic> response =
            await HomeApi().getJadwalHomeService(accessToken, event.context);
        List<dynamic> responseTotalPoint =
            await HomeApi().getTotalPoint(accessToken, event.context);

        int statusCode = response[0] as int;
        final JadwalHomeResponseModel cardHomeResponseModel =
            JadwalHomeResponseModel.fromJson(response[1]);

        final TotalPointResponseModel totalPointResponseModel =
            TotalPointResponseModel.fromJson(responseTotalPoint[1]);

        if (statusCode == 200) {
          if (cardHomeResponseModel.data!.isNotEmpty) {
            List<Data> dataTemp = cardHomeResponseModel.data!
                .where((value) =>
                    value.tanggalPelaksanaan.isAfter(DateTime.now()) ||
                    value.tanggalPelaksanaan.isAtSameMomentAs(DateTime.now()))
                .toList();

            dataTemp.sort(
                (a, b) => a.tanggalPelaksanaan.compareTo(b.tanggalPelaksanaan));

            // logger.d('dataTemp ${dataTemp[0].tanggalPelaksanaan}');
            emit(JadwalPosyanduHomeSuccessState(
                dataTemp.isEmpty ? null : dataTemp[0],
                totalPointResponseModel));
          } else {
            // Data kosong, tapi tetap success
            emit(JadwalPosyanduHomeSuccessState(
              null,
              totalPointResponseModel,
            ));
          }
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
