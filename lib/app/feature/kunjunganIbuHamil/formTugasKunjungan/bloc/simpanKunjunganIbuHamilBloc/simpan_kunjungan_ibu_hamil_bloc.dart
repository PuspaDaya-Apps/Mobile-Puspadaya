import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../../model/CheckBoxKunjungan.dart';
import '../../model/detail_patch_kunjungan_ibu_hamil_response_model.dart';
import '../../model/simpan_tugas_kunjungan_ibu_hamil_model.dart';
import '../../model/simpan_tugas_kunjungan_ibu_hamil_response_model.dart';
import '../../model/update_kunjungan_ibu_hamil_model.dart';
import '../../model/update_kunjungan_ibu_hamil_response_model.dart';
import '../../service/form_tugas_kunjungan_anak_stunting_api.dart';

part 'simpan_kunjungan_ibu_hamil_event.dart';
part 'simpan_kunjungan_ibu_hamil_state.dart';

class SimpanKunjunganIbuHamilBloc extends Bloc<SimpanKunjunganIbuHamilEvent, SimpanKunjunganIbuHamilState> {
  SimpanKunjunganIbuHamilBloc() : super(SimpanKunjunganIbuHamilInitial()) {
    on<SimpanKunjunganIbuHamilEvent>((event, emit) {});

    on<SimpanKunjungan>(simpanKunjungan);
  }

  Future<void> simpanKunjungan (SimpanKunjungan event, Emitter<SimpanKunjunganIbuHamilState> emit) async {
    emit(SimpanKunjunganIbuHamilProccessState());

    if(event.listTugas.isEmpty && event.ibuHamilTidakAdaDirumah.isChecked == false) {
      emit(ListTugasNullState());
      return;
    }

    // if(event.listImages.isEmpty) {
    //   emit(ListImagesNullState());
    //   return;
    // }

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(SimpanKunjunganIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> responseBukti = await FormTugasKunjunganIbuHamilApi().postBuktiKunjunganService(accessToken, SimpanTugasKunjunganIbuHamilModel(
          kunjunganId: event.idKunjungan, 
          tugasKunjunganids: event.listTugas.map((e) => e.id).toList(), 
          files: event.listImages
        ));

        int statusCodeBuktiKunjungan = responseBukti[0] as int;
        final SimpanTugasKunjunganIbuHamilResponseModel modelBukti = SimpanTugasKunjunganIbuHamilResponseModel.fromJson(responseBukti[1]);

        if(statusCodeBuktiKunjungan == 201) {
          //!2
          List<dynamic> responseUpdate = await FormTugasKunjunganIbuHamilApi().patchStatuskunjunganService(accessToken, event.idKunjungan, UpdateKunjunganIbuHamilModel(
            selesaiPada: DateFormat("HH:mm:ss", "ID_id").format(DateTime.now()), 
            statusKunjungan: "Selesai"
          ));

          int statusCodeUpdateKunjungan = responseUpdate[0] as int;
          final UpdateKunjunganIbuHamilResponseModel modelUpdate = UpdateKunjunganIbuHamilResponseModel.fromJson(responseUpdate[1]);

          if(statusCodeUpdateKunjungan == 200) {
            //! 3
            List<dynamic> responseDetail = await FormTugasKunjunganIbuHamilApi().getDetailKunjunganService(accessToken, event.idKunjungan);

            int statusCodeDetailKunjungan = responseDetail[0] as int;

            if(statusCodeDetailKunjungan == 200) {
              final DetailPatchKunjunganIbuHamilResponseModel modelDetail = DetailPatchKunjunganIbuHamilResponseModel.fromJson(responseDetail[1]);

              emit(SimpanKunjunganIbuHamilSuccessState(modelDetail));

            } else if (statusCodeDetailKunjungan == 401) {
              emit(SimpanKunjunganIbuHamilTokenExpiredState());
            } else {
              final ErrorMessage modelError = ErrorMessage.fromJson(responseDetail[1]);

              emit(SimpanKunjunganIbuHamilFailedDetailState(modelError.message));
            }
            //!3
          } else if (statusCodeUpdateKunjungan == 401) {
            emit(SimpanKunjunganIbuHamilTokenExpiredState());
          } else {
            emit(SimpanKunjunganIbuHamilFailedUpdateState(modelUpdate.message));
          }
          //!2
        } else if (statusCodeBuktiKunjungan == 401) {
          emit(SimpanKunjunganIbuHamilTokenExpiredState());
        } else {
          emit(SimpanKunjunganIbuHamilFailedBuktitate(modelBukti.message));
        }

      } catch (error) {
        debugPrint(error.toString());
        emit(SimpanKunjunganIbuHamilFailedBuktitate(error.toString()));
      }
    }
  }
}
