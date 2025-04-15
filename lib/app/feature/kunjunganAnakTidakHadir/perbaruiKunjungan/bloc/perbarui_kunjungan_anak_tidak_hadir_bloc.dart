import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/CheckBoxKunjungan.dart';
import '../../formTugasKunjungan/model/simpan_tugas_kunjungan_anak_tidak_hadir_model.dart';
import '../../formTugasKunjungan/model/simpan_tugas_kunjungan_anak_tidak_hadir_response_model.dart';
import '../service/perbarui_kunjungan_anak_tidak_hadir_api.dart';

part 'perbarui_kunjungan_anak_tidak_hadir_event.dart';
part 'perbarui_kunjungan_anak_tidak_hadir_state.dart';

class PerbaruiKunjunganAnakTidakHadirBloc extends Bloc<PerbaruiKunjunganAnakTidakHadirEvent, PerbaruiKunjunganAnakTidakHadirState> {
  PerbaruiKunjunganAnakTidakHadirBloc() : super(PerbaruiKunjunganAnakTidakHadirInitial()) {
    on<PerbaruiKunjunganAnakTidakHadirEvent>((event, emit) {});

    on<SimpanKunjungan>(perbaruiKunjungan);
  }

  Future<void> perbaruiKunjungan (SimpanKunjungan event, Emitter<PerbaruiKunjunganAnakTidakHadirState>emit)  async {
    emit(PerbaruiKunjunganAnakTidakHadirProccessState());

    if(event.listTugas.isEmpty && event.anakTidakAdaDirumah.isChecked == false) {
      emit(ListTugasNullState());
      return;
    }

    if(event.listImages.isEmpty) {
      emit(ListImagesNullState());
      return;
    }

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(PerbaruiKunjunganAnakTidakHadirTokenExpiredState());
    } else {
      try {
        List<dynamic> responseBukti = await PerbaruiKunjunganAnakTidakHadirApi().postBuktiKunjunganService(accessToken, SimpanTugasKunjunganAnakTidakHadirModel(
          kunjunganId: event.idKunjungan, 
          tugasKunjunganids: event.listTugas.map((e) => e.id).toList(), 
          files: event.listImages
        ));

        int statusCodeBuktiKunjungan = responseBukti[0] as int;
        final SimpanTugasKunjunganAnakTidakHadirResponseModel modelBukti = SimpanTugasKunjunganAnakTidakHadirResponseModel.fromJson(responseBukti[1]);

        if(statusCodeBuktiKunjungan == 201) {

          emit(PerbaruiKunjunganAnakTidakHadirSuccessState());
          
        } else if (statusCodeBuktiKunjungan == 401) {
          emit(PerbaruiKunjunganAnakTidakHadirTokenExpiredState());
        } else {
          emit(PerbaruiKunjunganAnakTidakHadirFailedBuktitate(modelBukti.message));
        }

      } catch (error) {
        debugPrint(error.toString());
        emit(PerbaruiKunjunganAnakTidakHadirFailedBuktitate(error.toString()));
      }
    }
  }
}
