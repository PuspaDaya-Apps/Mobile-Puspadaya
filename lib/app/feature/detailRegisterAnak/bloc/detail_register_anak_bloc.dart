import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/detailRegisterAnak/model/get_detail_anak_response.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../RiwayatAnak/detail/model/get_grafik_kms_model.dart';
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
      print('response code detail ${responseDetail[1].toString()}');
      List<dynamic> responseGrafik = await DetailRegisterAnakApi()
          .getGrafikKMS(event.anakId, accesTokenValue);

      logger.d(responseGrafik[1]);
      // Parse the responseGrafik[1] into a list of GetGrafikKmsModel
      List<GetGrafikKmsModel> dataGrafik =
          parseGetGrafikKmsModels(responseGrafik[1]);

      logger.d('data grafik: ${dataGrafik.length} data ditemukan');
      // logger.d('response code detail ${getOrangtuaDetailResponse}');
      if (statusCodeDetail == 200) {
        final GetDetailAnakResponse getDetailAnakResponse =
            GetDetailAnakResponse.fromJson(responseDetail[1]);
        logger.d('status code Detail is 200 ${getDetailAnakResponse.data}');
        int? statusAnak;

        if(getDetailAnakResponse.data.anakPindah) {
          statusAnak = 0;
        }
        if(getDetailAnakResponse.data.anakMeninggal) {
          statusAnak = 1;
        }

        emit(
          DetailRegisterAnakSuccess(
            dataGrafik: dataGrafik,
            getDetailRegisterAnak: getDetailAnakResponse,
            statusAnak: statusAnak),
        );
      }
    } catch (e) {
      emit(DetailRegisterAnakFailure(e.toString()));
    }
  }

  List<GetGrafikKmsModel> parseGetGrafikKmsModels(dynamic jsonData) {
    // Assuming jsonData is already a Map<String, dynamic>
    return (jsonData as Map<String, dynamic>).entries.map((entry) {
      return GetGrafikKmsModel.fromJson(entry.value);
    }).toList();
  }
}
