import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/update_pengukuran_ibu_hamil_model.dart';
import '../model/update_pengukuran_ibu_hamil_response_model.dart';
import '../service/update_pengukuran_ibu_hamil_api.dart';

part 'update_pengukuran_ibu_hamil_event.dart';
part 'update_pengukuran_ibu_hamil_state.dart';

class UpdatePengukuranIbuHamilBloc extends Bloc<UpdatePengukuranIbuHamilEvent, UpdatePengukuranIbuHamilState> {
  UpdatePengukuranIbuHamilBloc() : super(UpdatePengukuranIbuHamilInitial()) {
    on<UpdatePengukuranIbuHamilEvent>((event, emit) {});

    on<NullErrorEvent>((event, emit) {
      emit(const UpdatePengukuranIbuHamilNullErrorState("Form perbarui pengukuran tidak boleh kosong"));
    });

    on<SendUpdatePengukuranIbuHamilEvent>(sendUpdatePengukuranIbuHamilEvent);
  }

  Future<void> sendUpdatePengukuranIbuHamilEvent (SendUpdatePengukuranIbuHamilEvent event, Emitter<UpdatePengukuranIbuHamilState> emit) async {
    emit(UpdatePengukuranIbuHamilProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(UpdatePengukuranIbuHamilTokenExpiredState());
    } else {
       try {
        List<dynamic> response = await UpdatePengukuranIbuHamilApi().updatePengukuranIbuHamilService(accessToken, event.pengukuranIbuHamilModel, event.pengukuranId);

        int statusCode = response[0] as int;
        final UpdatePengukuranIbuHamilResponseModel pengukuranIbuHamilResponseModel = UpdatePengukuranIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(UpdatePengukuranIbuHamilSuccesState(pengukuranIbuHamilResponseModel));
        } else if (statusCode == 401) {
          emit( UpdatePengukuranIbuHamilTokenExpiredState());
        } else {
          emit(UpdatePengukuranIbuHamilFailedState(pengukuranIbuHamilResponseModel.message));
        }
      } catch (error) {
        emit(UpdatePengukuranIbuHamilFailedState(error.toString()));
      }
    }
  }
}
