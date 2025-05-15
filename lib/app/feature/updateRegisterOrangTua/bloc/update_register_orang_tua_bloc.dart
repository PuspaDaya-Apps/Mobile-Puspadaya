import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/updateRegisterOrangTua/model/patch_orang_tua_body.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../service/update_register_api.dart';

part 'update_register_orang_tua_event.dart';
part 'update_register_orang_tua_state.dart';

class UpdateRegisterOrangTuaBloc
    extends Bloc<UpdateRegisterOrangTuaEvent, UpdateRegisterOrangTuaState> {
  UpdateRegisterOrangTuaBloc() : super(UpdateRegisterOrangTuaInitial()) {
    on<UpdateRegisterOrangTuaEvent>((event, emit) {});
    on<SendUpdateRegisterOrangTua>(registerOrangTua);
  }
  Future<void> registerOrangTua(SendUpdateRegisterOrangTua event,
      Emitter<UpdateRegisterOrangTuaState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(UpdateRegisterOrangTuaLoading()); // Reset state sebelum request
        String ayahId = event.ayahId;
        PatchOrangTuaBody dataToPatch = event.patchOrangTuaBody;
        // Assuming dataAyah and dataIbu are already defined and populated
        logger.d('parsing to db');

        logger.d(' patch orang tua body = ${dataToPatch}');
        List<dynamic> response = await UpdateRegisterOrangTuaApi()
            .patchRegisterOrangTua(accesTokenValue, dataToPatch, ayahId);
        int statusCode = response[0] as int;
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          logger.d('succes patch orang tua');
          emit((UpdateRegisterOrangTuaSuccesState()));
        } else if (statusCode == 409) {
          emit(UpdateRegisterOrangTuaFailedState(response[1].toString()));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        }else if (statusCode ==400){
          logger.d("got trigger 400");

        } else {
          emit(UpdateRegisterOrangTuaFailedState("Terdapat Error"));
        }
      } catch (e) {
        logger.d('error $e');
        emit(UpdateRegisterOrangTuaFailedState(e.toString()));
      }
    }
  }
}
