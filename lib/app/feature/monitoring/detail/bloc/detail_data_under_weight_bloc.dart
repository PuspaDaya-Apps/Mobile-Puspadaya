import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_detail_monitoring_anak.dart';
import '../service/get_detail_anak.dart';

part 'detail_data_under_weight_event.dart';
part 'detail_data_under_weight_state.dart';

class DetailDataUnderWeightBloc
    extends Bloc<DetailDataUnderWeightEvent, DetailDataUnderWeightState> {
  DetailDataUnderWeightBloc() : super(DetailDataUnderWeightInitial()) {
    on<DetailDataUnderWeightEvent>((event, emit) {});
    on<FetchDetailDataUnderWeight>(fetchDetailUnderWeight);
  }
  Future<void> fetchDetailUnderWeight(FetchDetailDataUnderWeight event,
      Emitter<DetailDataUnderWeightState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(DetailDataUnderWeightLoading());
        List<dynamic> response = await GetDetailAnak()
            .getDetailMonitoringAnak(accesTokenValue, event.id);
        int statusCode = response[0] as int;
        GetDetailMonitoringAnak monitoringUnderWeight =
            GetDetailMonitoringAnak.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(DetailDataUnderWeightSuccess(monitoringUnderWeight));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailDataUnderWeightFailed(
            monitoringUnderWeight.message,
          ));
        }
      } catch (e) {
        emit(DetailDataUnderWeightFailed(e.toString()));
      }
    }
  }
}
