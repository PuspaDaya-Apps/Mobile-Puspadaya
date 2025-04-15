import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../../model/CheckBoxKunjungan.dart';
import '../../model/detail_patch_kunjungan_anak_tidak_hadir_response_model.dart';
import '../../model/simpan_tugas_kunjungan_anak_tidak_hadir_model.dart';
import '../../model/simpan_tugas_kunjungan_anak_tidak_hadir_response_model.dart';
import '../../model/update_kunjungan_anak_tidak_hadir_model.dart';
import '../../model/update_kunjungan_anak_tidak_hadir_response_model.dart';
import '../../service/form_tugas_kunjungan_anak_tidak_hadir_api.dart';

part 'simpan_kunjungan_anak_tidak_hadir_event.dart';
part 'simpan_kunjungan_anak_tidak_hadir_state.dart';

class SimpanKunjunganAnakTidakHadirBloc extends Bloc<SimpanKunjunganAnakTidakHadirEvent, SimpanKunjunganAnakTidakHadirState> {
  SimpanKunjunganAnakTidakHadirBloc() : super(SimpanKunjunganAnakTidakHadirInitial()) {
    on<SimpanKunjunganAnakTidakHadirEvent>((event, emit) {});

    on<SimpanKunjungan>(simpanKunjungan);
  }
  
  Future<void> simpanKunjungan (SimpanKunjungan event, Emitter<SimpanKunjunganAnakTidakHadirState>emit)  async {
    emit(SimpanKunjunganAnakTidakHadirProccessState());

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
      emit(SimpanKunjunganAnakTidakHadirTokenExpiredState());
    } else {
      try {
        List<dynamic> responseBukti = await FormTugasKunjunganAnakTidakHadirApi().postBuktiKunjunganService(accessToken, SimpanTugasKunjunganAnakTidakHadirModel(
          kunjunganId: event.idKunjungan, 
          tugasKunjunganids: event.listTugas.map((e) => e.id).toList(), 
          files: event.listImages
        ));

        int statusCodeBuktiKunjungan = responseBukti[0] as int;
        final SimpanTugasKunjunganAnakTidakHadirResponseModel modelBukti = SimpanTugasKunjunganAnakTidakHadirResponseModel.fromJson(responseBukti[1]);

        if(statusCodeBuktiKunjungan == 201) {
          //!2
          List<dynamic> responseUpdate = await FormTugasKunjunganAnakTidakHadirApi().patchStatuskunjunganService(accessToken, event.idKunjungan, UpdateKunjunganAnakTidakHadirModel(
            selesaiPada: DateFormat("HH:mm:ss", "ID_id").format(DateTime.now()), 
            statusKunjungan: "Selesai"
          ));

          int statusCodeUpdateKunjungan = responseUpdate[0] as int;
          final UpdateKunjunganAnakTidakHadirResponseModel modelUpdate = UpdateKunjunganAnakTidakHadirResponseModel.fromJson(responseUpdate[1]);

          if(statusCodeUpdateKunjungan == 200) {
            //! 3
            List<dynamic> responseDetail = await FormTugasKunjunganAnakTidakHadirApi().getDetailKunjunganService(accessToken, event.idKunjungan);

            int statusCodeDetailKunjungan = responseDetail[0] as int;

            if(statusCodeDetailKunjungan == 200) {
              final DetailPatchKunjunganAnakTidakHadirResponseModel modelDetail = DetailPatchKunjunganAnakTidakHadirResponseModel.fromJson(responseDetail[1]);

              emit(SimpanKunjunganAnakTidakHadirSuccessState(modelDetail));

            } else if (statusCodeDetailKunjungan == 401) {
              emit(SimpanKunjunganAnakTidakHadirTokenExpiredState());
            } else {
              final ErrorMessage modelError = ErrorMessage.fromJson(responseDetail[1]);

              emit(SimpanKunjunganAnakTidakHadirFailedDetailState(modelError.message));
            }
            //!3
          } else if (statusCodeUpdateKunjungan == 401) {
            emit(SimpanKunjunganAnakTidakHadirTokenExpiredState());
          } else {
            emit(SimpanKunjunganAnakTidakHadirFailedUpdateState(modelUpdate.message));
          }
          //!2
        } else if (statusCodeBuktiKunjungan == 401) {
          emit(SimpanKunjunganAnakTidakHadirTokenExpiredState());
        } else {
          emit(SimpanKunjunganAnakTidakHadirFailedBuktitate(modelBukti.message));
        }

      } catch (error) {
        debugPrint(error.toString());
        emit(SimpanKunjunganAnakTidakHadirFailedBuktitate(error.toString()));
      }
    }
  }
}
