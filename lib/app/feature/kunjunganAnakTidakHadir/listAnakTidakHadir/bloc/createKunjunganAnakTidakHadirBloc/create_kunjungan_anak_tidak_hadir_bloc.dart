import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../maps/model/lokasi.dart';
import '../../model/create_kunjungan_anak_tidak_hadir_model.dart';
import '../../model/create_kunjungan_anak_tidak_hadir_response_model.dart';
import '../../service/list_anak_tidak_hadir_kunjungan_api.dart';

part 'create_kunjungan_anak_tidak_hadir_event.dart';
part 'create_kunjungan_anak_tidak_hadir_state.dart';

class CreateKunjunganAnakTidakHadirBloc extends Bloc<CreateKunjunganAnakTidakHadirEvent, CreateKunjunganAnakTidakHadirState> {
  CreateKunjunganAnakTidakHadirBloc() : super(CreateKunjunganAnakTidakHadirInitial()) {
    on<CreateKunjunganAnakTidakHadirEvent>((event, emit) {});

    on<CreateKunjunganEvent>(createKunjungan);

    on<LatlangNullEvent>(((event, emit) {
      emit(CreateKunjunganAnakTidakHadirInitial());
      emit(LatlangNullState(event.idAnak));
    }));
  }Future<void> createKunjungan (CreateKunjunganEvent event, Emitter<CreateKunjunganAnakTidakHadirState> emit)async {
    emit(CreateKunjunganAnakTidakHadirProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreateKunjunganAnakTidakHadirTokenExpiredState());
    } else {
      try {
        CreateKunjunganAnakTidakHadirModel kunjunganAnakModel = CreateKunjunganAnakTidakHadirModel(
          anakId: event.idAnak, 
          mulaiPada: DateFormat("HH:mm:ss", "ID_id").format(DateTime.now()), 
          tanggalKunjungan: DateTime.now(),
          lokasiStart: Lokasi(
            latitude: event.lokasiStart.latitude, 
            longitude: event.lokasiStart.longitude
          )
        );
        
        debugPrint(kunjunganAnakModel.jenisKunjungan);

        List<dynamic> response = await ListAnakTidakHadirKunjunganApi().createKunjunganAnakService(accessToken, kunjunganAnakModel);

        int statusCode = response[0] as int;
        final CreateKunjunganAnakTidakHadirResponseModel createKunjunganAnakTidakHadirResponseModel = CreateKunjunganAnakTidakHadirResponseModel.fromJson(response[1]);

        if(statusCode == 201) {
          emit(CreateKunjunganAnakTidakHadirSuccessState(createKunjunganAnakTidakHadirResponseModel.data!.id));
        } else if (statusCode == 401) {
          emit(CreateKunjunganAnakTidakHadirTokenExpiredState());
        } else {
          emit(CreateKunjunganAnakTidakHadirFailedState(createKunjunganAnakTidakHadirResponseModel.message));
        }
      } catch (error) {
        emit(CreateKunjunganAnakTidakHadirFailedState(error.toString()));
      }
    }
  }
}
