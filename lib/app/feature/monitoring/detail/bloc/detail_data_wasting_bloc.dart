import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_detail_monitoring_anak.dart';
import '../service/get_detail_anak.dart';

part 'detail_data_wasting_event.dart';
part 'detail_data_wasting_state.dart';

class DetailDataWastingBloc
    extends Bloc<DetailDataWastingEvent, DetailDataWastingState> {
  DetailDataWastingBloc() : super(DetailDataWastingInitial()) {
    on<DetailDataWastingEvent>((event, emit) {});
    on<FetchDetailDataWasting>(fetchDetailWasting);
  }
  Future<void> fetchDetailWasting(FetchDetailDataWasting event,
      Emitter<DetailDataWastingState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(DetailDataWastingLoading());
        List<dynamic> response = await GetDetailAnak()
            .getDetailMonitoringAnak(accesTokenValue, event.id);
        int statusCode = response[0] as int;
        GetDetailMonitoringAnak monitoringWasting =
            GetDetailMonitoringAnak.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(DetailDataWastingSuccess(monitoringWasting));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailDataWastingFailed(
            monitoringWasting.message,
          ));
        }
      } catch (e) {
        emit(DetailDataWastingFailed(e.toString()));
      }
    }
  }
}
