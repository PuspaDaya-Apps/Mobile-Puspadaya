import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/create_kunjungan_anak_stunting_model.dart';
import '../../model/create_kunjungan_anak_stunting_response_model.dart';
import '../../service/list_anak_stunting_kunjungan_api.dart';

part 'create_kunjungan_anak_stunting_event.dart';
part 'create_kunjungan_anak_stunting_state.dart';

class CreateKunjunganAnakStuntingBloc extends Bloc<CreateKunjunganAnakStuntingEvent, CreateKunjunganAnakStuntingState> {
  CreateKunjunganAnakStuntingBloc() : super(CreateKunjunganAnakStuntingInitial()) {
    on<CreateKunjunganAnakStuntingEvent>((event, emit) {});

    on<CreateKunjunganEvent>(createKunjungan);
  }
  Future<void> createKunjungan (CreateKunjunganEvent event, Emitter<CreateKunjunganAnakStuntingState> emit)async {
     emit(CreateKunjunganAnakStuntingProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreateKunjunganAnakStuntingTokenExpiredState());
    } else {
      try {
        double jarak = Random().nextDouble() * (7 - 0.1) + 0.1 ;
        CreateKunjunganAnakStuntingModel kunjunganAnakModel = CreateKunjunganAnakStuntingModel(
          anakId: event.idAnak, 
          mulaiPada: DateFormat("HH:mm:ss", "ID_id").format(DateTime.now()), 
          jarakTotal: "${jarak.toStringAsFixed(1)} Km",
          tanggalKunjungan: DateTime.now()
        );
        debugPrint(kunjunganAnakModel.jenisKunjungan);

        List<dynamic> response = await ListAnakStuntingKunjunganApi().createKunjunganAnakService(accessToken, kunjunganAnakModel);

        int statusCode = response[0] as int;
        final CreateKunjunganAnakStuntingResponseModel createKunjunganAnakStuntingResponseModel = CreateKunjunganAnakStuntingResponseModel.fromJson(response[1]);

        if(statusCode == 201) {
          emit(CreateKunjunganAnakStuntingSuccessState(createKunjunganAnakStuntingResponseModel.data!.id));
        } else if (statusCode == 401) {
          emit(CreateKunjunganAnakStuntingTokenExpiredState());
        } else {
          emit(CreateKunjunganAnakStuntingFailedState(createKunjunganAnakStuntingResponseModel.message));
        }
      } catch (error) {
        emit(CreateKunjunganAnakStuntingFailedState(error.toString()));
      }
    }
  }
}
