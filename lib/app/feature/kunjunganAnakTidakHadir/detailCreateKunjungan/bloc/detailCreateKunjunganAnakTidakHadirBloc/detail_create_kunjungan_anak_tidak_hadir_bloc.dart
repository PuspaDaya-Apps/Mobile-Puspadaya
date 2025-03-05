import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_create_kunjungan_anak_tidak_hadir_response_model.dart';
import '../../service/detail_create_kunjungan_anak_tidak_hadir_api.dart';

part 'detail_create_kunjungan_anak_tidak_hadir_event.dart';
part 'detail_create_kunjungan_anak_tidak_hadir_state.dart';

class DetailCreateKunjunganAnakTidakHadirBloc extends Bloc<DetailCreateKunjunganAnakTidakHadirEvent, DetailCreateKunjunganAnakTidakHadirState> {
  DetailCreateKunjunganAnakTidakHadirBloc() : super(DetailCreateKunjunganAnakTidakHadirInitial()) {
    on<DetailCreateKunjunganAnakTidakHadirEvent>((event, emit) {});

    on<GetDetailKunjunganAnak>(getDetailKunjunganAnak);
  }

  Future<void> getDetailKunjunganAnak (GetDetailKunjunganAnak event, Emitter<DetailCreateKunjunganAnakTidakHadirState> emit) async {
    emit(DetailCreateKunjunganAnakTidakHadirProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailCreateKunjunganAnakTidakHadirTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailCreateKunjunganAnakTidakHadirApi().getDetailAnak(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        

        if(statusCode == 200) {
          final DetailCreateKunjunganAnakTidakHadirResponseModel detailCreateKunjunganAnakTidakHadirResponseModel = DetailCreateKunjunganAnakTidakHadirResponseModel.fromJson(response[1]);
          emit(DetailCreateKunjunganAnakTidakHadirSuccessState(detailCreateKunjunganAnakTidakHadirResponseModel));
        } else if (statusCode == 401) {
          emit(DetailCreateKunjunganAnakTidakHadirTokenExpiredState());
        } else {
          final ErrorMessage message = ErrorMessage.fromJson(response[1]);
          emit(DetailCreateKunjunganAnakTidakHadirFailedState(message.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(DetailCreateKunjunganAnakTidakHadirFailedState(error.toString()));
      }
    }
  }
}
