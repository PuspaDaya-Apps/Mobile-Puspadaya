import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_all_monitoring_anak_model.dart';
import '../service/get_index_anak.dart';

part 'index_data_under_weight_event.dart';
part 'index_data_under_weight_state.dart';

class IndexDataUnderWeightBloc
    extends Bloc<IndexDataUnderWeightEvent, IndexDataUnderWeightState> {
  IndexDataUnderWeightBloc() : super(IndexDataUnderWeightInitial()) {
    on<IndexDataUnderWeightEvent>((event, emit) {});
    on<FetchIndexDataUnderWeight>(fetchIndexUnderWeight);
  }
  Future<void> fetchIndexUnderWeight(FetchIndexDataUnderWeight event,
      Emitter<IndexDataUnderWeightState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(IndexDataUnderWeightLoading());
        List<dynamic> response =
            await GetIndexAnak().getAllIndexAnakUnderWeight(accesTokenValue);
        int statusCode = response[0] as int;
        GetAllMonitoringAnak monitoringUnderWeight =
            GetAllMonitoringAnak.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(IndexDataUnderWeightSuccess(monitoringUnderWeight));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexDataUnderWeightFailed(
            monitoringUnderWeight.message,
          ));
        }
      } catch (e) {
        emit(IndexDataUnderWeightFailed(e.toString()));
      }
    }
  }
}
