import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../service/register_orang_tua_api.dart';
import '../model/get_orangtua_detail_response.dart';

part 'detail_register_orang_tua_event.dart';
part 'detail_register_orang_tua_state.dart';

class DetailRegisterOrangTuaBloc
    extends Bloc<DetailRegisterOrangTuaEvent, DetailRegisterOrangTuaState> {
  DetailRegisterOrangTuaBloc() : super(DetailRegisterOrangTuaInitial()) {
    on<DetailRegisterOrangTuaEvent>((event, emit) {});
    on<FeathingDetailRegisterOrangTua>(FeatchingData);
  }
  Future<void> FeatchingData(FeathingDetailRegisterOrangTua event,
      Emitter<DetailRegisterOrangTuaState> emit) async {
    emit(DetailRegisterOrangTuaLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    }
    try {
      String ayahId = event.ayahId;
      String ibuId = event.ibuId;
      logger.d('ayah = ${ayahId}, ibu = ${ibuId}');
      List<dynamic> responseDetail =
          await RegisterOrangTuaApi().getDetailAyahIbu(
        token: accesTokenValue!,
        ayahId: ayahId,
        ibuId: ibuId,
      );
      int statusCodeDetail = responseDetail[0] as int;
      // logger.d('response code detail ${responseDetail[1]}');
      // logger.d('response code detail ${getOrangtuaDetailResponse}');
      if (statusCodeDetail == 200) {
        final GetOrangtuaDetailResponse getOrangtuaDetailResponse =
            GetOrangtuaDetailResponse.fromJson(responseDetail[1]);
        // logger.d(
        //     'status code Detail is 200 ${getOrangtuaDetailResponse.data.ayah}');
        emit(
          DetailRegisterOrangTuaSuccess(getOrangTuaDetailResponse: getOrangtuaDetailResponse),
        );
      }
    } catch (e) {
      emit(DetailRegisterOrangTuaFailure(e.toString()));
    }
  }
}
