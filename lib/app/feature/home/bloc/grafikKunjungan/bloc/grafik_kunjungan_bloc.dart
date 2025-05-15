import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/logger/logger.dart';
import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../model/grafik_kunjungan_response_model.dart';
import '../../../service/home_api.dart';

part 'grafik_kunjungan_event.dart';
part 'grafik_kunjungan_state.dart';

class GrafikKunjunganBloc
    extends Bloc<GrafikKunjunganEvent, GrafikKunjunganState> {
  GrafikKunjunganBloc() : super(GrafikKunjunganInitial()) {
    on<GrafikKunjunganEvent>((event, emit) {});
    on<GetGrafikKunjunganEvent>(getGrafikKunjungan);
  }
  Future<void> getGrafikKunjungan(
      GetGrafikKunjunganEvent event, Emitter<GrafikKunjunganState> emit) async {
    emit(GrafikKunjunganLoading());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response =
            await HomeApi().grafikKunjunganService(accessToken);

        int statusCode = response[0] as int;
        final GrafikKunjunganResponseModel dataGrafik = 
            GrafikKunjunganResponseModel.fromJson(response[1]);

        if (statusCode == 200) {
          logger.d("success get grafik kunjungan");
          emit(GrafikKunjunganSuccess(dataGrafik));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(GrafikKunjunganFailed("Terjadi Error Saat Mengambil Data"));
        }
      } catch (error) {
        logger.d(error.toString());
        emit(GrafikKunjunganFailed(error.toString()));
      }
    }
  }
}
