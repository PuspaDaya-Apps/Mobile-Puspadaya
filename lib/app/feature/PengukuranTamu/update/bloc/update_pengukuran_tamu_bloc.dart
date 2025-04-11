import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/update_pengukuran_tamu_model.dart';
import '../model/update_pengukuran_tamu_response_model.dart';
import '../service/update_pengukuran_tamu_api.dart';

part 'update_pengukuran_tamu_event.dart';
part 'update_pengukuran_tamu_state.dart';

class UpdatePengukuranTamuBloc extends Bloc<UpdatePengukuranTamuEvent, UpdatePengukuranTamuState> {
  UpdatePengukuranTamuBloc() : super(UpdatePengukuranTamuInitial()) {
    on<UpdatePengukuranTamuEvent>((event, emit) {});

     on<SendUpdatePengukuranTamuEvent>(updatePengukuranTamu);

    on<NullErrorEvent>((event, emit){
      emit(const  UpdatePengukuranTamuNullErrorState("Form perbarui pengukuran tidak boleh kosong"));
    });
  }

  Future<void> updatePengukuranTamu (SendUpdatePengukuranTamuEvent event, Emitter<UpdatePengukuranTamuState> emit) async{
    emit(UpdatePengukuranTamuProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(UpdatePengukuranTamuTokenExpiredState());
    } else {
       try {
        List<dynamic> response = await UpdatePengukuranTamuApi().updatePengukuranTamuService(accessToken, event.pengukuranTamuModel, event.pengukuranId);

        int statusCode = response[0] as int;
        final UpdatePengukuranTamuResponseModel pengukuranTamuResponseModel = UpdatePengukuranTamuResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(UpdatePengukuranTamuSuccesState(pengukuranTamuResponseModel));
        } else if (statusCode == 401) {
          emit( UpdatePengukuranTamuTokenExpiredState());
        } else {
          emit(UpdatePengukuranTamuFailedState(pengukuranTamuResponseModel.message));
        }
      } catch (error) {
        emit(UpdatePengukuranTamuFailedState(error.toString()));
      }
    }
  }
}
