import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_all_anak_by_posyadu.dart';
import '../service/create_kehadiran_service.dart';

part 'create_kehadiran_anak_event.dart';
part 'create_kehadiran_anak_state.dart';

class CreateKehadiranAnakBloc
    extends Bloc<CreateKehadiranAnakEvent, CreateKehadiranAnakState> {
  CreateKehadiranAnakBloc() : super(CreateKehadiranAnakInitial()) {
    on<CreateKehadiranAnakEvent>((event, emit) {});
    on<CreateKehadiranEventFormAnakLoaded>(formLoadedAnak);
  }
  Future<void> formLoadedAnak(CreateKehadiranEventFormAnakLoaded event,
      Emitter<CreateKehadiranAnakState> emit) async {
    emit(CreateKehadiranFormAnakLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        // int? totalAnak = await CreateKehadiranService()
        //     .getTotalItemAnakPosyandu(accessToken);
        // logger.d('total anak : $totalAnak');

        // if (totalAnak == 0) {
        //   emit(CreateKehadiranFormAnakEmpty());
        //   return;
        // }

        dynamic responseAnak = await CreateKehadiranService()
            .getAllAnakByPosyandu(accessToken, 5000);
        int statusCodeAnak = responseAnak[0] as int;
        // anak by posyandu
        GetAllAnakByPosyandu dataAnak =
            GetAllAnakByPosyandu.fromJson(responseAnak[1]);
        logger.d("succes get anak by posyandu");

        if (statusCodeAnak == 200) {
          logger.d('succes get data anak ');
          emit(
            CreateKeadiranFormAnakSuccess(
              dataAnak: dataAnak,
            ),
          );
        } else if (statusCodeAnak == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateKehadiranFormAnakFailed('error anak : ${dataAnak.message}'));
        }
      } catch (error) {
        emit(CreateKehadiranFormAnakFailed(error.toString()));
      }
    }
  }
}
