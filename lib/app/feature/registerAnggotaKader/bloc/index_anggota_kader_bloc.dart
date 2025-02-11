import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/index_anggota_kader_response_model.dart';
import '../service/index_anggota_kader_api.dart';

part 'index_anggota_kader_event.dart';
part 'index_anggota_kader_state.dart';

class IndexAnggotaKaderBloc
    extends Bloc<IndexAnggotaKaderEvent, IndexAnggotaKaderState> {
  IndexAnggotaKaderBloc() : super(IndexAnggotaKaderInitial()) {
    on<IndexAnggotaKaderEvent>((event, emit) {});

    on<GetListAnggotaKaderEvent>(getListAnggotaKader);
  }

  Future<void> getListAnggotaKader(GetListAnggotaKaderEvent event,
      Emitter<IndexAnggotaKaderState> emit) async {
    emit(IndexAnggotaKaderProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(IndexAnggotaKaderTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexAnggotaKaderApi()
            .getListAnggotaKaderService(accessToken);

        int statusCode = response[0] as int;
        final IndexAnggotaKaderResponseModel indexAnggotaKaderResponseModel =
            IndexAnggotaKaderResponseModel.fromJson(response[1]);

        if (statusCode == 200) {
          emit(IndexAnggotaKaderSuccessState(indexAnggotaKaderResponseModel));
        } else if (statusCode == 401) {
          emit(IndexAnggotaKaderTokenExpiredState());
        } else {
          if (statusCode == 500) {}
          logger.d("error interna server");
        }
      } catch (error) {
        // logger.d('error internal server ${error}');
        try {
          String errorAutorized = error.toString();
          final Map<String, dynamic> errorResponse =
              jsonDecode(errorAutorized.replaceFirst('Exception: ', ''));
          String message = errorResponse['message'] ?? 'Terjadi kesalahan';
          String trueMessage = message.replaceFirst(
              'Gagal mendapatkan data user, UnauthorizedException: ', '');
          // logger.d('error internal server ${trueMessage}');
          emit(IndexAnggotaKaderUnauthorizedException(trueMessage));
        } catch (e) {
          emit(IndexAnggotaKaderFailedState(error.toString()));
        }
      }
    }
  }
}
