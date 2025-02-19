import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_detail_monitoring_anak.dart';
import '../service/get_detail_anak.dart';

part 'detail_data_stunting_event.dart';
part 'detail_data_stunting_state.dart';

class DetailDataStuntingBloc
    extends Bloc<DetailDataStuntingEvent, DetailDataStuntingState> {
  DetailDataStuntingBloc() : super(DetailDataStuntingInitial()) {
    on<DetailDataStuntingEvent>((event, emit) {});
    on<FetchDetailDataStunting>(fetchDetailStunting);
  }
  Future<void> fetchDetailStunting(FetchDetailDataStunting event,
      Emitter<DetailDataStuntingState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(DetailDataStuntingLoading());
        List<dynamic> response = await GetDetailAnak()
            .getDetailMonitoringAnak(accesTokenValue, event.id);
        int statusCode = response[0] as int;
        GetDetailMonitoringAnak monitoringStunting =
            GetDetailMonitoringAnak.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(DetailDataStuntingSuccess(monitoringStunting));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailDataStuntingFailed(
            monitoringStunting.message,
          ));
        }
      } catch (e) {
        emit(DetailDataStuntingFailed(e.toString()));
      }
    }
  }
}
