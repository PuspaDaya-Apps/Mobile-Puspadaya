import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../create/model/pengukuran_anak_model.dart';
import '../../create/model/pengukuran_anak_response_model.dart';
import '../service/update_pengukuran_anak_api.dart';

part 'update_pengukuran_anak_event.dart';
part 'update_pengukuran_anak_state.dart';

class UpdatePengukuranAnakBloc extends Bloc<UpdatePengukuranAnakEvent, UpdatePengukuranAnakState> {
  UpdatePengukuranAnakBloc() : super(UpdatePengukuranAnakInitial()) {
    on<UpdatePengukuranAnakEvent>((event, emit) {});

    on<SendUpdatePengukuranAnakEvent>(updatePengukuranAnak);

    on<NullErrorEvent>((event, emit){
      emit(const  UpdatePengukuranAnakNullErrorState("Form perbarui pengukuran tidak boleh kosong"));
    });
  }

  Future<void> updatePengukuranAnak (SendUpdatePengukuranAnakEvent event, Emitter<UpdatePengukuranAnakState> emit) async{
    emit(UpdatePengukuranAnakProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(UpdatePengukuranAnakTokenExpiredState());
    } else {
       try {
        List<dynamic> response = await UpdatePengukuranAnakApi().updatePengukuranAnakService(accessToken, event.pengukuranAnakModel, event.pengukuranId);

        int statusCode = response[0] as int;
        final PengukuranAnakResponseModel pengukuranAnakResponseModel = PengukuranAnakResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(UpdatePengukuranAnakSuccesState(pengukuranAnakResponseModel));
        } else if (statusCode == 401) {
          emit( UpdatePengukuranAnakTokenExpiredState());
        } else {
          emit(UpdatePengukuranAnakFailedState(pengukuranAnakResponseModel.message));
        }
      } catch (error) {
        emit(UpdatePengukuranAnakFailedState(error.toString()));
      }
    }
  }
}
