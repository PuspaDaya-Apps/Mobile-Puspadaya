import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/Update_anggota_kader_model.dart';
import '../model/update_anggota_kader_response_model.dart';
import '../service/update_anggota_kader_api.dart';

part 'update_anggota_kader_event.dart';
part 'update_anggota_kader_state.dart';

class UpdateAnggotaKaderBloc extends Bloc<UpdateAnggotaKaderEvent, UpdateAnggotaKaderState> {
  UpdateAnggotaKaderBloc() : super(UpdateAnggotaKaderInitial()) {
    on<UpdateAnggotaKaderEvent>((event, emit) {});

    on<UpdateAnggotaKader>(updateAnggotaKader);

    on<NullErrorEvent>((event, emit) {
      emit(const UpdateAnggotaKaderNullErrorState("Form Perbarui Anggota Kader Tidak Boleh Kosong"));
    });
  }

  Future<void> updateAnggotaKader (UpdateAnggotaKader event, Emitter<UpdateAnggotaKaderState> emit) async {
    emit(UpdateAnggotaKaderProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(UpdateAnggotaKaderTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await UpdateAnggotaKaderApi().updateAnggotaKaderService(accessToken, event.anggotaKaderId, event.updateAnggotaKaderModel) ;

        int statusCode = response[0] as int;
        final UpdateAnggotaKaderResponseModel updateAnggotaKaderResponseModel = UpdateAnggotaKaderResponseModel.fromJson(
          response[1]
        );

        // debugPrint(" dusun id : ${event.UpdateAnggotaKaderModel.dusunId}");
        // debugPrint(" posyandu id : ${event.updateAnggotaKaderModel.posyanduId}");

        if(statusCode == 200) {
          emit(UpdateAnggotaKaderSuccessState(
            updateAnggotaKaderResponseModel
          )
        );

        } else if (statusCode == 401) {
          emit(UpdateAnggotaKaderTokenExpiredState());
        } else {
          emit(UpdateAnggotaKaderFailedState(updateAnggotaKaderResponseModel.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(UpdateAnggotaKaderFailedState(error.toString()));
      }
    }
  }
}
