import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_list_orang_tua_response_model.dart';
import '../../service/create_anak_api.dart';

part 'get_lis_orang_tua_event.dart';
part 'get_lis_orang_tua_state.dart';

class GetLisOrangTuaBloc extends Bloc<GetLisOrangTuaEvent, GetLisOrangTuaState> {
  GetLisOrangTuaBloc() : super(GetListOrangTuaProccessState()) {
    on<GetLisOrangTuaEvent>((event, emit) {});

    on<GetListOrangTua>(getListOrangTua);
  }

  Future<void> getListOrangTua (GetListOrangTua event, Emitter<GetLisOrangTuaState> emit) async {
    emit(GetListOrangTuaProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(GetListOrangTuaTokenExpiredState());
    } else {
       try {
        List<dynamic> response = await CreateAnakApi().getKartuKeluargaService(accessToken);

        int statusCode = response[0] as int;
        final GetListOrangTuaResponseModel getListOrangTuaResponseModel = GetListOrangTuaResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(GetListOrangTuaSuccessState(getListOrangTuaResponseModel));
        } else if (statusCode == 401) {
          emit(GetListOrangTuaTokenExpiredState());
        } else {
          emit(GetListOrangTuaFailedState(getListOrangTuaResponseModel.message));
        }
      } catch (error) {
        emit(GetListOrangTuaFailedState(error.toString()));
      }
    }
  }
}
