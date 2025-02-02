import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_anak_by_id_response.dart';
import '../service/detail_register_anak_api.dart';

part 'detail_register_anak_event.dart';
part 'detail_register_anak_state.dart';

class DetailRegisterAnakBloc
    extends Bloc<DetailRegisterAnakEvent, DetailRegisterAnakState> {
  DetailRegisterAnakBloc() : super(DetailRegisterAnakInitial()) {
    on<DetailRegisterAnakEvent>((event, emit) {});
    on<FeathingDetailRegisterAnak>(featchingData);
  }

  Future<void> featchingData(FeathingDetailRegisterAnak event,
      Emitter<DetailRegisterAnakState> emit) async {
    emit(DetailRegisterAnakLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    }
    try {
      String anakId = event.anakId;
      logger.d('anak Id = ${anakId}');
      List<dynamic> responseDetail =
          await DetailRegisterAnakApi().getDetailAnak(
        token: accesTokenValue!,
        anakId: anakId,
      );
      int statusCodeDetail = responseDetail[0] as int;
      logger.d(statusCodeDetail);
      // logger.d('response code detail ${responseDetail[1]}');
      // logger.d('response code detail ${getOrangtuaDetailResponse}');
      if (statusCodeDetail == 200) {
        final GetDetailAnakByIdResponse getOrangtuaDetailResponse =
            GetDetailAnakByIdResponse.fromJson(responseDetail[1]);
        logger.d(
            'status code Detail is 200 ${getOrangtuaDetailResponse.data.namaAnak}');
        emit(
          DetailRegisterAnakSuccess(
              getDetailRegisterAnakState: getOrangtuaDetailResponse),
        );
      }
    } catch (e) {
      emit(DetailRegisterAnakFailure(e.toString()));
    }
  }
}
