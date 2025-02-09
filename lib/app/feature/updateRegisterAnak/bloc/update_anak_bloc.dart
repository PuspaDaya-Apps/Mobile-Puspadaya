import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/update_anak_model.dart';
import '../model/update_anak_response_model.dart';
import '../service/update_anak_api.dart';

part 'update_anak_event.dart';
part 'update_anak_state.dart';

class UpdateAnakBloc extends Bloc<UpdateAnakEvent, UpdateAnakState> {
  UpdateAnakBloc() : super(UpdateAnakInitial()) {
    on<UpdateAnakEvent>((event, emit) {});

    on<UpdateAnak>(updateAnak);

    on<NullErrorEvent>((event, emit) {
      emit(const UpdateAnakNullErrorState("Form Perbarui anak Tidak Boleh Kosong"));
    });
  }

  Future<void> updateAnak(UpdateAnak event, Emitter<UpdateAnakState> emit) async {
    emit(UpdateAnakProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(UpdateAnakTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await UpdateAnakApi().updateAnakService(accessToken, event.id ,event.updateAnakModel);

        int statusCode = response[0] as int;
        final UpdateAnakResponseModel createAnakResponseModel = UpdateAnakResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(UpdateAnakSuccessState(
            createAnakResponseModel
          )
        );
        } else if (statusCode == 401) {
          emit(UpdateAnakTokenExpiredState());
        } else {
          emit(UpdateAnakFailedState(createAnakResponseModel.message));
        }
      } catch (error) {
        emit(UpdateAnakFailedState(error.toString()));
      }
    }
  }
}
