import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_all_posyandu_model.dart';
import '../service/posyandu_service.dart';

part 'posyandu_event.dart';
part 'posyandu_state.dart';

class PosyanduBloc extends Bloc<PosyanduEvent, PosyanduState> {
  PosyanduBloc() : super(PosyanduInitial()) {
    on<PosyanduEvent>((event, emit) {});
    on<GetPosyanduEvent>(getAllPosyandu);
  }

  Future<void> getAllPosyandu(
      GetPosyanduEvent event, Emitter<PosyanduState> emit) async {
    emit(PosyanduLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        // int? totalPosyandu =
        //     await PosyanduService().getTotalItemPosyandu(accessToken);

        dynamic response =
            await PosyanduService().getAllPosyandu(accessToken);

        int statusCode = response[0] as int;
        // anak by posyandu
        GetAllPosyandu dataAnak = GetAllPosyandu.fromJson(response[1]);

        logger.d("succes get all posyandu");
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data posyandu');
          emit(PosyanduSuccess(dataAnak));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(PosyanduFailed('error ${dataAnak.message}'));
        }
      } catch (error) {
        emit(PosyanduFailed(error.toString()));
      }
    }
  }
}
