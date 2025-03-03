import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_kunjungan_anak_stunting_response_model.dart';
import '../../service/detail_kunjungan_anak_stunting_api.dart';

part 'detail_kunjungan_anak_stunting_event.dart';
part 'detail_kunjungan_anak_stunting_state.dart';

class DetailKunjunganAnakStuntingBloc extends Bloc<DetailKunjunganAnakStuntingEvent, DetailKunjunganAnakStuntingState> {
  DetailKunjunganAnakStuntingBloc() : super(DetailKunjunganAnakStuntingProccessState()) {
    on<DetailKunjunganAnakStuntingEvent>((event, emit) {});

    on<GetDetailKunjunganAnak>(getDetailKunjunganAnak);
  }

  Future<void> getDetailKunjunganAnak (GetDetailKunjunganAnak event, Emitter<DetailKunjunganAnakStuntingState>emit) async {
    emit(DetailKunjunganAnakStuntingProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailKunjunganAnakStuntingTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailKunjunganAnakStuntingApi().getDetailAnak(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        

        if(statusCode == 200) {
          final DetailKunjunganAnakStuntingResponseModel detailKunjunganAnakStuntingResponseModel = DetailKunjunganAnakStuntingResponseModel.fromJson(response[1]);
          emit(DetailKunjunganAnakStuntingSuccessState(detailKunjunganAnakStuntingResponseModel));
        } else if (statusCode == 401) {
          emit(DetailKunjunganAnakStuntingTokenExpiredState());
        } else {
          final ErrorMessage message = ErrorMessage.fromJson(response[1]);
          emit(DetailKunjunganAnakStuntingFailedState(message.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(DetailKunjunganAnakStuntingFailedState(error.toString()));
      }
    }
  }
}
