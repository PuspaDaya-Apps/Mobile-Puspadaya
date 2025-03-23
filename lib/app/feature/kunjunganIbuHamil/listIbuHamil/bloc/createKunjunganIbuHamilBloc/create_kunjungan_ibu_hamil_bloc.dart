import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/create_kunjungan_ibu_hamil_model.dart';
import '../../model/create_kunjungan_ibu_hamil_response_model.dart';
import '../../service/list_ibu_hamil_kunjungan_api.dart';

part 'create_kunjungan_ibu_hamil_event.dart';
part 'create_kunjungan_ibu_hamil_state.dart';

class CreateKunjunganIbuHamilBloc extends Bloc<CreateKunjunganIbuHamilEvent, CreateKunjunganIbuHamilState> {
  CreateKunjunganIbuHamilBloc() : super(CreateKunjunganIbuHamilInitial()) {
    on<CreateKunjunganIbuHamilEvent>((event, emit) {});

    on<CreateKunjunganEvent>(createKunjungan);
  }

  Future<void> createKunjungan (CreateKunjunganEvent event, Emitter<CreateKunjunganIbuHamilState> emit) async {
    emit(CreateKunjunganIbuHamilProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreateKunjunganIbuHamilTokenExpiredState());
    } else {
      try {
        double jarak = Random().nextDouble() * (7 - 0.1) + 0.1 ;
        CreateKunjunganIbuHamilModel kunjunganIbuHamilModel = CreateKunjunganIbuHamilModel(
          ibuHamilId: event.idIbuHamil, 
          mulaiPada: DateFormat("HH:mm:ss", "ID_id").format(DateTime.now()), 
          jarakTotal: "${jarak.toStringAsFixed(1)} Km",
          tanggalKunjungan: DateTime.now()
        );
        debugPrint(kunjunganIbuHamilModel.jenisKunjungan);

        List<dynamic> response = await ListIbuHamilKunjunganApi().createKunjunganIbuHamilService(accessToken, kunjunganIbuHamilModel);

        int statusCode = response[0] as int;
        final CreateKunjunganIbuHamilResponseModel createKunjunganIbuHamilResponseModel = CreateKunjunganIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 201) {
          emit(CreateKunjunganIbuHamilSuccessState(createKunjunganIbuHamilResponseModel.data!.id));
        } else if (statusCode == 401) {
          emit(CreateKunjunganIbuHamilTokenExpiredState());
        } else {
          emit(CreateKunjunganIbuHamilFailedState(createKunjunganIbuHamilResponseModel.message));
        }
      } catch (error) {
        emit(CreateKunjunganIbuHamilFailedState(error.toString()));
      }
    }
  }
}
