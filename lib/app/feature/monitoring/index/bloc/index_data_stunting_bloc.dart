import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_all_monitoring_anak_model.dart';
import '../service/get_index_anak.dart';

part 'index_data_stunting_event.dart';
part 'index_data_stunting_state.dart';

class IndexDataStuntingBloc
    extends Bloc<IndexDataStuntingEvent, IndexDataStuntingState> {
  IndexDataStuntingBloc() : super(IndexDataStuntingInitial()) {
    on<IndexDataStuntingEvent>((event, emit) {});
    on<FetchIndexDataStunting>(fetchIndexStunting);
  }
  Future<void> fetchIndexStunting(FetchIndexDataStunting event,
      Emitter<IndexDataStuntingState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(IndexDataStuntingLoading());
        List<dynamic> response =
            await GetIndexAnak().getAllIndexAnakStunting(accesTokenValue);
        int statusCode = response[0] as int;
        GetAllMonitoringAnak monitoringStunting =
            GetAllMonitoringAnak.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(IndexDataStuntingSuccess(monitoringStunting));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexDataStuntingFailed(
            monitoringStunting.message,
          ));
        }
      } catch (e) {
        emit(IndexDataStuntingFailed(e.toString()));
      }
    }
  }
}
