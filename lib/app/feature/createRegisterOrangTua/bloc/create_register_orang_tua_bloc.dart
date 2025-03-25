
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/post_orang_tua_body.dart';
import '../service/create_register_orang_tua_api.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';

part 'create_register_orang_tua_event.dart';
part 'create_register_orang_tua_state.dart';

class CreateRegisterOrangTuaBloc
    extends Bloc<CreateRegisterOrangTuaEvent, CreateRegisterOrangTuaState> {
  CreateRegisterOrangTuaBloc() : super(CreateRegisterOrangTuaInitial()) {
    on<CreateRegisterOrangTuaEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SendRegisterOrangTua>(registerOrangTua);
  }
  Future<void> registerOrangTua(SendRegisterOrangTua event,
      Emitter<CreateRegisterOrangTuaState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        PostOrangTuaBody dataToPost = event.postOrangTuaBody;
        // Assuming dataAyah and dataIbu are already defined and populated
        logger.d('parsing to db');

        logger.d(' post orang tua body = ${dataToPost}');
        List<dynamic> response = await CreateRegisterOrangTuaApi()
            .postRegisterOrangTua(accesTokenValue, dataToPost);
        int statusCode = response[0] as int;
        logger.d('statusCode ${statusCode}');
        if (statusCode == 201) {
          logger.d('succes post orang tua');
          emit(CreateRegisterOrangTuaSuccesState());
          final dataAyah = await SharedPrefUtils().removeRegisterOrangTuaAyah();
          final dataIbu = await SharedPrefUtils().removeRegisterOrangTuaIbu();

        }
         else if(statusCode ==401) {
          emit(TokenExpiredState());
        }else{
          logger.e('failed to post orang tua ${response[1].toString()}');
          emit(CreateRegisterOrangTuaFailedState(response[1].toString()));
        }
        
      } catch (e) {
        emit(CreateRegisterOrangTuaFailedState(e.toString()));
      }
    }
  }
}
