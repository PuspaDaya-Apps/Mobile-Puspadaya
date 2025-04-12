import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/update_pengasuh_model.dart';
import '../model/update_pengasuh_response_model.dart';
import '../service/update_pengasuh_api.dart';

part 'update_pengasuh_event.dart';
part 'update_pengasuh_state.dart';

class UpdatePengasuhBloc extends Bloc<UpdatePengasuhEvent, UpdatePengasuhState> {
  UpdatePengasuhBloc() : super(UpdatePengasuhInitial()) {
    on<UpdatePengasuhEvent>((event, emit) {});

    on<UpdatePengasuh>(updatePengasuh);

    on<NullErrorEvent>((event, emit) {
      emit(const UpdatePengasuhNullErrorState("Form Update Pengasuh Tidak Boleh Kosongs"));
    });
  }

  Future<void> updatePengasuh (UpdatePengasuh event, Emitter<UpdatePengasuhState> emit) async {
    emit(UpdatePengasuhProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(UpdatePengasuhTokenExpiredState());
    } else {
      try {
        emit(UpdatePengasuhLoadingState()); // Reset state sebelum request
        List<dynamic> response = await UpdatePengasuhApi().updatePengasuhService(accessToken, event.id, event.updatePengasuhModel);

        int statusCode = response[0] as int;
        final UpdatePengasuhResponseModel updatePengasuhResponseModel = UpdatePengasuhResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(UpdatePengasuhSuccessState(
            updatePengasuhResponseModel
          )
        );
        } else if (statusCode == 401) {
          emit(UpdatePengasuhTokenExpiredState());
        } else {
          emit(UpdatePengasuhFailedState(updatePengasuhResponseModel.message));
        }
      } catch (error) {
        emit(UpdatePengasuhFailedState(error.toString()));
      }
    }
  }
}
