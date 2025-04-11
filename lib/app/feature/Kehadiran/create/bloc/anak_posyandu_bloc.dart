import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/model/get_all_anak_posyandu_model.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../service/anak_posyandu_service.dart';

part 'anak_posyandu_event.dart';
part 'anak_posyandu_state.dart';

class AnakPosyanduBloc extends Bloc<AnakPosyanduEvent, AnakPosyanduState> {
  AnakPosyanduBloc() : super(AnakPosyanduInitial()) {
    on<AnakPosyanduEvent>((event, emit) {});
    on<GetAnakPosyanduEvent>(getAllPosyandu);
  }
  Future<void> getAllPosyandu(
      GetAnakPosyanduEvent event, Emitter<AnakPosyanduState> emit) async {
    emit(AnakPosyanduLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        // int? totalPosyandu =
        //     await PosyanduService().getTotalItemPosyandu(accessToken);

        dynamic response = await AnakPosyanduService()
            .getAllAnakPosyandu(accessToken, event.id);

        int statusCode = response[0] as int;
        // anak by posyandu
        GetAllAnakPosyanduModel dataAnak =
            GetAllAnakPosyanduModel.fromJson(response[1]);

        logger.d("succes get all posyandu");
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data posyandu');
          emit(AnakPosyanduSuccess(dataAnak));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(AnakPosyanduFailed('error ${dataAnak.message}'));
        }
      } catch (error) {
        emit(AnakPosyanduFailed(error.toString()));
      }
    }
  }
}
