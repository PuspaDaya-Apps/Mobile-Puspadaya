import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/home/model/total_kunjungan_response_model.dart';

import '../../../../../../utils/logger/logger.dart';
import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../service/home_api.dart';

part 'total_kunjungan_event.dart';
part 'total_kunjungan_state.dart';

class TotalKunjunganBloc extends Bloc<TotalKunjunganEvent, TotalKunjunganState> {
  TotalKunjunganBloc() : super(TotalKunjunganInitial()) {
    on<TotalKunjunganEvent>((event, emit) {
    });
    on<TotalKunjunganFetchEvent>(getTotalKununganKader);
  }
   Future<void> getTotalKununganKader(
      TotalKunjunganFetchEvent event, Emitter<TotalKunjunganState> emit) async {
    emit(TotalKunjunganLoading());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response =
            await HomeApi().totalKunjungan(accessToken);

        int statusCode = response[0] as int;
        final TotalKunjunganResponseModel totalKunjungan =
            TotalKunjunganResponseModel.fromJson(response[1]);

        if (statusCode == 200) {
          logger.d("success get total kunjungan");
          emit(TotalKunjunganSuccess(totalKunjungan));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(TotalKunjunganFailed("Terjadi Error Saat Mengambil Data"));
        }
      } catch (error) {
        logger.d(error.toString());
        emit(TotalKunjunganFailed(error.toString()));
      }
    }
  }
}
