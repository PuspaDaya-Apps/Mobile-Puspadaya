import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/registerOrangTua/model/get_all_orang_tua_response.dart';
import 'package:puspadaya/utils/helper/helper_core.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../service/register_orang_tua_api.dart';
import '../model/orang_tua_item_model.dart';

part 'register_orang_tua_event.dart';
part 'register_orang_tua_state.dart';

class RegisterOrangTuaBloc
    extends Bloc<RegisterOrangTuaEvent, RegisterOrangTuaState> {
  RegisterOrangTuaBloc() : super(RegisterOrangTuaInitial()) {
    on<RegisterOrangTuaEvent>((event, emit) {});

    on<FetchOrangTua>(fetchOrangTua);
  }
  Future<void> fetchOrangTua(
      RegisterOrangTuaEvent event, Emitter<RegisterOrangTuaState> emit) async {
    emit(RegisterOrangTuaLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);
    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response =
            await RegisterOrangTuaApi().getDataAyahIbu(accesTokenValue);
        int statusCode = response[0] as int;
        logger.d('statusCode ${statusCode}');
        final GetAllOrangTuaResponse getAllOrangTuaResponse =
            GetAllOrangTuaResponse.fromJson(response[1]);
        if (statusCode == 200) {
          List<OrangTuaItemModel> orangTuaList =
              getAllOrangTuaResponse.data.map((data) {
            return OrangTuaItemModel(
              kk: data.ayah.kartuKeluarga.nomorKartuKeluarga,
              initial: HelperCore.convertNameToInitial(data.ayah.namaAyah),
              ayahId: data.ayah.id,
              ibuId: data.ibu.id,
              husband: data.ayah.namaAyah,
              wife: data.ibu.namaIbu,
            );
          }).toList();
          emit(RegisterOrangTuaSuccess(orangTuaList: orangTuaList));
        }
      } catch (e) {
        emit(RegisterOrangTuaFailure(e.toString()));
      }
    }
  }
}
