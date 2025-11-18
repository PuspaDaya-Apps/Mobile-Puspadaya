import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/CheckBoxKunjungan.dart';
import '../../formTugasKunjungan/model/simpan_tugas_kunjungan_ibu_hamil_model.dart';
import '../../formTugasKunjungan/model/simpan_tugas_kunjungan_ibu_hamil_response_model.dart';
import '../service/perbarui_kunjungan_ibu_hamil_api.dart';

part 'perbarui_kunjungan_ibu_hamil_event.dart';
part 'perbarui_kunjungan_ibu_hamil_state.dart';

class PerbaruiKunjunganIbuHamilBloc extends Bloc<PerbaruiKunjunganIbuHamilEvent, PerbaruiKunjunganIbuHamilState> {
  PerbaruiKunjunganIbuHamilBloc() : super(PerbaruiKunjunganIbuHamilInitial()) {
    on<PerbaruiKunjunganIbuHamilEvent>((event, emit) {});

    on<SimpanKunjungan>(perbaruiKunjungan);
  }

  Future<void> perbaruiKunjungan (SimpanKunjungan event, Emitter<PerbaruiKunjunganIbuHamilState> emit) async {
    emit(PerbaruiKunjunganIbuHamilProccessState());

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
      emit(PerbaruiKunjunganIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> responseBukti = await PerbaruiKunjunganIbuHamilApi().postBuktiKunjunganService(accessToken, SimpanTugasKunjunganIbuHamilModel(
          kunjunganId: event.idKunjungan, 
          tugasKunjunganids: event.listTugas.map((e) => e.id).toList(), 
          files: event.listImages
        ));

        int statusCodeBuktiKunjungan = responseBukti[0] as int;
        final SimpanTugasKunjunganIbuHamilResponseModel modelBukti = SimpanTugasKunjunganIbuHamilResponseModel.fromJson(responseBukti[1]);

        if(statusCodeBuktiKunjungan == 201) {

          emit(PerbaruiKunjunganIbuHamilSuccessState());
          
        } else if (statusCodeBuktiKunjungan == 401) {
          emit(PerbaruiKunjunganIbuHamilTokenExpiredState());
        } else {
          emit(PerbaruiKunjunganIbuHamilFailedBuktitate(modelBukti.message));
        }

      } catch (error) {
        emit(PerbaruiKunjunganIbuHamilFailedBuktitate(error.toString()));
      }
    }
  }
}
