import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/delete_kunjungan_anak_stunting_response_model.dart';
import '../../service/detail_kunjungan_anak_stunting_api.dart';

part 'delete_kunjungan_anak_stunting_event.dart';
part 'delete_kunjungan_anak_stunting_state.dart';

class DeleteKunjunganAnakStuntingBloc extends Bloc<DeleteKunjunganAnakStuntingEvent, DeleteKunjunganAnakStuntingState> {
  DeleteKunjunganAnakStuntingBloc() : super(DeleteKunjunganAnakStuntingInitial()) {
    on<DeleteKunjunganAnakStuntingEvent>((event, emit) {});

    on<DeleteKunjungan>(deleteKunjungan);
  }

  Future<void> deleteKunjungan (DeleteKunjungan event, Emitter<DeleteKunjunganAnakStuntingState>emit) async {
     emit(DeleteKunjunganAnakStuntingProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DeleteKunjunganAnakStuntingTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailKunjunganAnakStuntingApi().deleteDetailAnak(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        final DeleteKunjunganAnakStuntingResponseModel deleteKunjunganAnakStuntingResponseModel = DeleteKunjunganAnakStuntingResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DeleteKunjunganAnakStuntingSuccessState(deleteKunjunganAnakStuntingResponseModel));
        } else if (statusCode == 401) {
          emit(DeleteKunjunganAnakStuntingTokenExpiredState());
        } else {
          emit(DeleteKunjunganAnakStuntingFailedState(deleteKunjunganAnakStuntingResponseModel.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(DeleteKunjunganAnakStuntingFailedState(error.toString()));
      }
    }
  }
}
