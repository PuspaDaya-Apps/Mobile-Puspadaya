import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/CheckBoxKunjungan.dart';
import '../../formTugasKunjungan/model/simpan_tugas_kunjungan_anak_stunting_model.dart';
import '../../formTugasKunjungan/model/simpan_tugas_kunjungan_anak_stunting_response_model.dart';
import '../service/perbarui_kunjungan_anak_stunting_api.dart';

part 'perbarui_kunjungan_anak_stunting_event.dart';
part 'perbarui_kunjungan_anak_stunting_state.dart';

class PerbaruiKunjunganAnakStuntingBloc extends Bloc<PerbaruiKunjunganAnakStuntingEvent, PerbaruiKunjunganAnakStuntingState> {
  PerbaruiKunjunganAnakStuntingBloc() : super(PerbaruiKunjunganAnakStuntingInitial()) {
    on<PerbaruiKunjunganAnakStuntingEvent>((event, emit) {});

    on<SimpanKunjungan>(PerbaruiKunjungan);
  }

  Future<void> PerbaruiKunjungan (SimpanKunjungan event, Emitter<PerbaruiKunjunganAnakStuntingState>emit)  async {
    emit(PerbaruiKunjunganAnakStuntingProccessState());

    if(event.listTugas.isEmpty && event.anakTidakAdaDirumah.isChecked == false) {
      logger.e("data = ${event.listTugas.length}, ${event.anakTidakAdaDirumah.isChecked}");
      emit(ListTugasNullState());
      return;
    }

    if(event.listImages.isEmpty) {
      emit(ListImagesNullState());
      return;
    }

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(PerbaruiKunjunganAnakStuntingTokenExpiredState());
    } else {
      try {
        List<dynamic> responseBukti = await PerbaruiKunjunganAnakStuntingApi().postBuktiKunjunganService(accessToken, SimpanTugasKunjunganAnakStuntingModel(
          kunjunganId: event.idKunjungan, 
          tugasKunjunganids: event.listTugas.map((e) => e.id).toList(), 
          files: event.listImages
        ));

        int statusCodeBuktiKunjungan = responseBukti[0] as int;
        final SimpanTugasKunjunganAnakStuntingResponseModel modelBukti = SimpanTugasKunjunganAnakStuntingResponseModel.fromJson(responseBukti[1]);

        if(statusCodeBuktiKunjungan == 201) {

          emit(PerbaruiKunjunganAnakStuntingSuccessState());
          
        } else if (statusCodeBuktiKunjungan == 401) {
          emit(PerbaruiKunjunganAnakStuntingTokenExpiredState());
        } else {
          emit(PerbaruiKunjunganAnakStuntingFailedBuktitate(modelBukti.message));
        }

      } catch (error) {
        debugPrint(error.toString());
        emit(PerbaruiKunjunganAnakStuntingFailedBuktitate(error.toString()));
      }
    }
  }
}
