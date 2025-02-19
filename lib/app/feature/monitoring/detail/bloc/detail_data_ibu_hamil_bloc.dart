import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_detail_monitoring_ibu_hamil.dart';
import '../service/get_detail_ibu_hamil.dart';

part 'detail_data_ibu_hamil_event.dart';
part 'detail_data_ibu_hamil_state.dart';

class DetailDataIbuHamilBloc
    extends Bloc<DetailDataIbuHamilEvent, DetailDataIbuHamilState> {
  DetailDataIbuHamilBloc() : super(DetailDataIbuHamilInitial()) {
    on<DetailDataIbuHamilEvent>((event, emit) {});
    on<FetchDetailDataIbuHamil>(fetchDetailIbuHamil);
  }
  Future<void> fetchDetailIbuHamil(FetchDetailDataIbuHamil event,
      Emitter<DetailDataIbuHamilState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(DetailDataIBuHamilLoading());
        List<dynamic> response = await GetDetailIbuHamil()
            .getDetailMonitoringIbuHamil(accesTokenValue, event.id);
        int statusCode = response[0] as int;
        GetDetailMonitoringIbuHamil monitoringIbuHamil =
            GetDetailMonitoringIbuHamil.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(DetailDataIbuHamilSuccess(monitoringIbuHamil));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailDataIbuHamilFailed(
            monitoringIbuHamil.message,
          ));
        }
      } catch (e) {
        emit(DetailDataIbuHamilFailed(e.toString()));
      }
    }
  }
}
