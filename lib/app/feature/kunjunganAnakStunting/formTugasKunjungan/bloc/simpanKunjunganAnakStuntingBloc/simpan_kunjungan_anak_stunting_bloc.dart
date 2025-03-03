import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/kunjunganAnakStunting/formTugasKunjungan/model/simpan_tugas_kunjungan_anak_stunting_model.dart';
import 'package:puspadaya/app/feature/kunjunganAnakStunting/formTugasKunjungan/model/simpan_tugas_kunjungan_anak_stunting_response_model.dart';
import 'package:puspadaya/app/feature/kunjunganAnakStunting/formTugasKunjungan/model/update_kunjungan_anak_stunting_model.dart';
import 'package:puspadaya/app/feature/kunjunganAnakStunting/formTugasKunjungan/model/update_kunjungan_anak_stunting_response_model.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../../model/CheckBoxKunjungan.dart';
import '../../model/detail_patch_kunjungan_anak_stunting_response_model.dart';
import '../../service/form_tugas_kunjungan_anak_stunting._api.dart';

part 'simpan_kunjungan_anak_stunting_event.dart';
part 'simpan_kunjungan_anak_stunting_state.dart';

class SimpanKunjunganAnakStuntingBloc extends Bloc<SimpanKunjunganAnakStuntingEvent, SimpanKunjunganAnakStuntingState> {
  SimpanKunjunganAnakStuntingBloc() : super(SimpanKunjunganAnakStuntingInitial()) {
    on<SimpanKunjunganAnakStuntingEvent>((event, emit) {}); 

    on<SimpanKunjungan>(simpanKunjungan);
  }

  Future<void> simpanKunjungan (SimpanKunjungan event, Emitter<SimpanKunjunganAnakStuntingState>emit)  async {
    emit(SimpanKunjunganAnakStuntingProccessState());

    if(event.listTugas.isEmpty) {
      emit(ListTugasNullState());
      return;
    }

    if(event.listImages.isEmpty) {
      emit(ListImagesNullState());
      return;
    }

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(SimpanKunjunganAnakStuntingTokenExpiredState());
    } else {
      try {
        List<dynamic> responseBukti = await FormTugasKunjunganAnakStuntingApi().postBuktiKunjunganService(accessToken, SimpanTugasKunjunganAnakStuntingModel(
          kunjunganId: event.idKunjungan, 
          tugasKunjunganids: event.listTugas.map((e) => e.id).toList(), 
          files: event.listImages
        ));

        int statusCodeBuktiKunjungan = responseBukti[0] as int;
        final SimpanTugasKunjunganAnakStuntingResponseModel modelBukti = SimpanTugasKunjunganAnakStuntingResponseModel.fromJson(responseBukti[1]);

        if(statusCodeBuktiKunjungan == 201) {
          //!2
          List<dynamic> responseUpdate = await FormTugasKunjunganAnakStuntingApi().patchStatuskunjunganService(accessToken, event.idKunjungan, UpdateKunjunganAnakStuntingModel(
            selesaiPada: DateFormat("HH:mm:ss", "ID_id").format(DateTime.now()), 
            statusKunjungan: "Selesai"
          ));

          int statusCodeUpdateKunjungan = responseUpdate[0] as int;
          final UpdateKunjunganAnakStuntingResponseModel modelUpdate = UpdateKunjunganAnakStuntingResponseModel.fromJson(responseUpdate[1]);

          if(statusCodeUpdateKunjungan == 200) {
            //! 3
            List<dynamic> responseDetail = await FormTugasKunjunganAnakStuntingApi().getDetailKunjunganService(accessToken, event.idKunjungan);

            int statusCodeDetailKunjungan = responseDetail[0] as int;

            if(statusCodeDetailKunjungan == 200) {
              final DetailPatchKunjunganAnakStuntingResponseModel modelDetail = DetailPatchKunjunganAnakStuntingResponseModel.fromJson(responseDetail[1]);

              emit(SimpanKunjunganAnakStuntingSuccessState(modelDetail));

            } else if (statusCodeDetailKunjungan == 401) {
              emit(SimpanKunjunganAnakStuntingTokenExpiredState());
            } else {
              final ErrorMessage modelError = ErrorMessage.fromJson(responseDetail[1]);

              emit(SimpanKunjunganAnakStuntingFailedDetailState(modelError.message));
            }
            //!3
          } else if (statusCodeUpdateKunjungan == 401) {
            emit(SimpanKunjunganAnakStuntingTokenExpiredState());
          } else {
            emit(SimpanKunjunganAnakStuntingFailedUpdateState(modelUpdate.message));
          }
          //!2
        } else if (statusCodeBuktiKunjungan == 401) {
          emit(SimpanKunjunganAnakStuntingTokenExpiredState());
        } else {
          emit(SimpanKunjunganAnakStuntingFailedBuktitate(modelBukti.message));
        }

      } catch (error) {
        debugPrint(error.toString());
        emit(SimpanKunjunganAnakStuntingFailedBuktitate(error.toString()));
      }
    }
  }
}
