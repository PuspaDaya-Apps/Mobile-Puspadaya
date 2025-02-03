import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../service/pengasuh_posyandu_api.dart';

part 'pengasuh_posyandu_event.dart';
part 'pengasuh_posyandu_state.dart';

class PengasuhPosyanduBloc
    extends Bloc<PengasuhPosyanduEvent, PengasuhPosyanduState> {
  PengasuhPosyanduBloc() : super(PengasuhPosyanduInitial()) {
    on<PengasuhPosyanduEvent>((event, emit) {});
    on<FecthPosyandu>(fetchingDataPengasuhPosyandu);
  }

  Future<void> fetchingDataPengasuhPosyandu(
      FecthPosyandu event, Emitter<PengasuhPosyanduState> emit) async {
    emit(PengasuhPosyanduLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);
    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    }
    try {
      List<dynamic> response =
          await PengasuhPosyanduApi().getPengasuhByPosyandu(accesTokenValue!);
      int statusCode = response[0] as int;
      logger.d('statusCode ${statusCode}');
      // final GetOrangtuaIdResponse getOrangtuaIdResponse =
      //     GetOrangtuaIdResponse.fromJson(response[1]);
    } catch (e) {}
  }
}
