import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_all_monitoring_ibu_hamil_model.dart';
import '../service/get_index_ibu_hamil.dart';

part 'index_data_ibu_hamil_event.dart';
part 'index_data_ibu_hamil_state.dart';

class IndexDataIbuHamilBloc
    extends Bloc<IndexDataIbuHamilEvent, IndexDataIbuHamilState> {
  IndexDataIbuHamilBloc() : super(IndexDataIbuHamilInitial()) {
    on<IndexDataIbuHamilEvent>((event, emit) {});
    on<FetchIndexDataIbuHamil>(fetchIndexIbuHamil);
  }
  Future<void> fetchIndexIbuHamil(FetchIndexDataIbuHamil event,
      Emitter<IndexDataIbuHamilState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(IndexDataIbuHamilLoading());
        List<dynamic> response =
            await GetIndexIbuHamil().getAllIndexIbuHamil(accesTokenValue);
        int statusCode = response[0] as int;
        GetAllMonitoringIbuHamil monitoringIbuHamil =
            GetAllMonitoringIbuHamil.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(IndexDataIbuHamilSuccess(monitoringIbuHamil));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexDataIbuHamilFailed(
            monitoringIbuHamil.message,
          ));
        }
      } catch (e) {
        emit(IndexDataIbuHamilFailed(e.toString()));
      }
    }
  }
}
