import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/delete_kunjungan_anak__response_model.dart';
import '../../service/detail_kunjungan_anak_tidak_hadir_api.dart';

part 'delete_kunjungan_anak_tidak_hadir_event.dart';
part 'delete_kunjungan_anak_tidak_hadir_state.dart';

class DeleteKunjunganAnakTidakHadirBloc extends Bloc<DeleteKunjunganAnakTidakHadirEvent, DeleteKunjunganAnakTidakHadirState> {
  DeleteKunjunganAnakTidakHadirBloc() : super(DeleteKunjunganAnakTidakHadirInitial()) {
    on<DeleteKunjunganAnakTidakHadirEvent>((event, emit) {});

    on<DeleteKunjungan>(deleteKunjungan);
  }

  Future<void> deleteKunjungan (DeleteKunjungan event, Emitter<DeleteKunjunganAnakTidakHadirState>emit) async {
     emit(DeleteKunjunganAnakTidakHadirProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DeleteKunjunganAnakTidakHadirTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailKunjunganAnakTidakHadirApi().deleteDetailAnak(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        final DeleteKunjunganAnakTidakHadirResponseModel deleteKunjunganAnakTidakHadirResponseModel = DeleteKunjunganAnakTidakHadirResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DeleteKunjunganAnakTidakHadirSuccessState(deleteKunjunganAnakTidakHadirResponseModel));
        } else if (statusCode == 401) {
          emit(DeleteKunjunganAnakTidakHadirTokenExpiredState());
        } else {
          emit(DeleteKunjunganAnakTidakHadirFailedState(deleteKunjunganAnakTidakHadirResponseModel.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(DeleteKunjunganAnakTidakHadirFailedState(error.toString()));
      }
    }
  }
}
