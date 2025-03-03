import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_create_kunjungan_anak_stunting_response_model.dart';
import '../../service/detail_create_kunjungan_anak_stunting_api.dart';

part 'detail_create_kunjungan_anak_stunting_event.dart';
part 'detail_create_kunjungan_anak_stunting_state.dart';

class DetailCreateKunjunganAnakStuntingBloc extends Bloc<DetailCreateKunjunganAnakStuntingEvent, DetailCreateKunjunganAnakStuntingState> {
  DetailCreateKunjunganAnakStuntingBloc() : super(DetailCreateKunjunganAnakStuntingInitial()) {
    on<DetailCreateKunjunganAnakStuntingEvent>((event, emit) {});

    on<GetDetailKunjunganAnak>(getDetailKunjunganAnak);
  }

  Future<void> getDetailKunjunganAnak (GetDetailKunjunganAnak event, Emitter<DetailCreateKunjunganAnakStuntingState> emit) async {
    emit(DetailCreateKunjunganAnakStuntingProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailCreateKunjunganAnakStuntingTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailCreateKunjunganAnakStuntingApi().getDetailAnak(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        

        if(statusCode == 200) {
          final DetailCreateKunjunganAnakStuntingResponseModel detailCreateKunjunganAnakStuntingResponseModel = DetailCreateKunjunganAnakStuntingResponseModel.fromJson(response[1]);
          emit(DetailCreateKunjunganAnakStuntingSuccessState(detailCreateKunjunganAnakStuntingResponseModel));
        } else if (statusCode == 401) {
          emit(DetailCreateKunjunganAnakStuntingTokenExpiredState());
        } else {
          final ErrorMessage message = ErrorMessage.fromJson(response[1]);
          emit(DetailCreateKunjunganAnakStuntingFailedState(message.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(DetailCreateKunjunganAnakStuntingFailedState(error.toString()));
      }
    }
  }
}
