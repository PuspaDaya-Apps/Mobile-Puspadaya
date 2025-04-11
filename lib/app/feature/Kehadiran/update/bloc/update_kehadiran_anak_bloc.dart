import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../create/model/get_all_anak_by_posyadu.dart';
import '../../create/service/create_kehadiran_service.dart';

part 'update_kehadiran_anak_event.dart';
part 'update_kehadiran_anak_state.dart';

class UpdateKehadiranAnakBloc
    extends Bloc<UpdateKehadiranAnakEvent, UpdateKehadiranAnakState> {
  UpdateKehadiranAnakBloc() : super(UpdateKehadiranAnakInitial()) {
    on<UpdateKehadiranAnakEvent>((event, emit) {});
    on<UpdateKehadiranEventFormAnakLoaded>(formAnakLoaded);
  }
  Future<void> formAnakLoaded(UpdateKehadiranEventFormAnakLoaded event,
      Emitter<UpdateKehadiranAnakState> emit) async {
    emit(UpdateKehadiranFormAnakLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        int? totalAnak = await CreateKehadiranService()
            .getTotalItemAnakPosyandu(accessToken);
        logger.d('total anak : $totalAnak');
        if(totalAnak == 0){
          emit(UpdateKehadiranFormAnakEmpty());
          return;
        }
        dynamic responseAnak = await CreateKehadiranService()
            .getAllAnakByPosyandu(accessToken, totalAnak!);

        int statusCodeAnak = responseAnak[0] as int;
      
        // anak by posyandu
        GetAllAnakByPosyandu dataAnak =
            GetAllAnakByPosyandu.fromJson(responseAnak[1]);
        logger.d("succes get anak by posyandu");
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCodeAnak == 200) {
          logger.d('succes get data anak ibu hamil');
          emit(UpdateKehadiranFormAnakSuccess(
              dataAnak: dataAnak, ));
        } else if (statusCodeAnak == 401 ) {
          emit(TokenExpiredState());
        } else {
          emit(UpdateKehadiranFormAnakFailed(
              'error anak : ${dataAnak.message}'));
        }
      } catch (error) {
        emit(UpdateKehadiranFormAnakFailed(error.toString()));
      }
    }
  }
}
