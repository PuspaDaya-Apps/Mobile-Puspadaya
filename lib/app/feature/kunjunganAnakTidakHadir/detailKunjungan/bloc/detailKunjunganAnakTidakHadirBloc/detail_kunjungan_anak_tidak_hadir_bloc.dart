import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_kunjungan_anak_tidak_hadir_response_model.dart';
import '../../service/detail_kunjungan_anak_tidak_hadir_api.dart';

part 'detail_kunjungan_anak_tidak_hadir_event.dart';
part 'detail_kunjungan_anak_tidak_hadir_state.dart';

class DetailKunjunganAnakTidakHadirBloc extends Bloc<DetailKunjunganAnakTidakHadirEvent, DetailKunjunganAnakTidakHadirState> {
  DetailKunjunganAnakTidakHadirBloc() : super(DetailKunjunganAnakTidakHadirInitial()) {
    on<DetailKunjunganAnakTidakHadirEvent>((event, emit) {});

    on<GetDetailKunjunganAnak>(getDetailKunjunganAnak);
  }

  Future<void> getDetailKunjunganAnak (GetDetailKunjunganAnak event, Emitter<DetailKunjunganAnakTidakHadirState>emit) async {
    emit(DetailKunjunganAnakTidakHadirProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailKunjunganAnakTidakHadirTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailKunjunganAnakTidakHadirApi().getDetailAnak(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        

        if(statusCode == 200) {
          final DetailKunjunganAnakTidakHadirResponseModel detailKunjunganAnakTidakHadirResponseModel = DetailKunjunganAnakTidakHadirResponseModel.fromJson(response[1]);
          emit(DetailKunjunganAnakTidakHadirSuccessState(detailKunjunganAnakTidakHadirResponseModel));
        } else if (statusCode == 401) {
          emit(DetailKunjunganAnakTidakHadirTokenExpiredState());
        } else {
          final ErrorMessage message = ErrorMessage.fromJson(response[1]);
          emit(DetailKunjunganAnakTidakHadirFailedState(message.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(DetailKunjunganAnakTidakHadirFailedState(error.toString()));
      }
    }
  }
}
