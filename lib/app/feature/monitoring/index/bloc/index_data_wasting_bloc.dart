import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_all_monitoring_anak_model.dart';
import '../service/get_index_anak.dart';

part 'index_data_wasting_event.dart';
part 'index_data_wasting_state.dart';

class IndexDataWastingBloc
    extends Bloc<IndexDataWastingEvent, IndexDataWastingState> {
  IndexDataWastingBloc() : super(IndexDataWastingInitial()) {
    on<IndexDataWastingEvent>((event, emit) {});
    on<FetchIndexDataWasting>(fetchIndexWasting);
  }
  Future<void> fetchIndexWasting(
      FetchIndexDataWasting event, Emitter<IndexDataWastingState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(IndexDataWastingLoading());
        List<dynamic> response =
            await GetIndexAnak().getAllIndexAnakWasting(accesTokenValue);
        int statusCode = response[0] as int;
        GetAllMonitoringAnak monitoringWasting =
            GetAllMonitoringAnak.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(IndexDataWastingSuccess(monitoringWasting));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexDataWastingFailed(
            monitoringWasting.message,
          ));
        }
      } catch (e) {
        emit(IndexDataWastingFailed(e.toString()));
      }
    }
  }
}
