import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../RiwayatAnak/detail/model/get_grafik_kms_model.dart';
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

        List<dynamic> responseGrafik = await GetDetailAnak()
            .getGrafikKMS(event.id, accesTokenValue);

        logger.d(responseGrafik[1]);
        // Parse the responseGrafik[1] into a list of GetGrafikKmsModel
        List<GetGrafikKmsModel> dataGrafik =
            parseGetGrafikKmsModels(responseGrafik[1]);

        logger.d('data grafik: ${dataGrafik.length} data ditemukan');
        logger.d('statusCode ${statusCode}');
        if (statusCode == 200) {
          emit(DetailDataStuntingSuccess(monitoringStunting,dataGrafik));
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

  List<GetGrafikKmsModel> parseGetGrafikKmsModels(dynamic jsonData) {
    // Assuming jsonData is already a Map<String, dynamic>
    return (jsonData as Map<String, dynamic>).entries.map((entry) {
      return GetGrafikKmsModel.fromJson(entry.value);
    }).toList();
  }
}
