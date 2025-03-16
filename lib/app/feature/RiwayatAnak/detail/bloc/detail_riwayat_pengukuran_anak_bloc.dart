import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/RiwayatAnak/detail/model/get_grafik_kms_model.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_riwayat_pengukuran_anak_model.dart';
import '../service/detail_riwayat_pengukuran_anak.dart';

part 'detail_riwayat_pengukuran_anak_event.dart';
part 'detail_riwayat_pengukuran_anak_state.dart';

class DetailRiwayatPengukuranAnakBloc extends Bloc<
    DetailRiwayatPengukuranAnakEvent, DetailRiwayatPengukuranAnakState> {
  DetailRiwayatPengukuranAnakBloc()
      : super(DetailRiwayatPengukuranAnakInitial()) {
    on<DetailRiwayatPengukuranAnakEvent>((event, emit) {});
    on<GetDetailRiwayatPengukuranAnak>(getDetailRiwayatPengukuranAnak);
  }
  Future<void> getDetailRiwayatPengukuranAnak(
      GetDetailRiwayatPengukuranAnak event,
      Emitter<DetailRiwayatPengukuranAnakState> emit) async {
    emit(DetailRiwayatPengukuranAnakLoading());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailRiwayatPengukuranAnak()
            .getDetailRiwayatPengukuranAnak(event.id, accessToken);
        // List<dynamic> responseGrafik = await DetailRiwayatPengukuranAnak()
        //     .getGrafikKMS(event.id, accessToken);

        // // Assuming responseGrafik is a JSON string
        // List<GetGrafikKmsModel> dataGrafik =
        //     parseGetGrafikKmsModels(responseGrafik[1]);

        int statusCode = response[0] as int;
        final GetDetailRiwayatPengukuranAnakModel data =
            GetDetailRiwayatPengukuranAnakModel.fromJson(response[1]);

        if (statusCode == 200) {
          emit(DetailRiwayatPengukuranAnakSuccess(data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailRiwayatPengukuranAnakFailed(data.message));
        }
      } catch (error) {
        emit(DetailRiwayatPengukuranAnakFailed(error.toString()));
      }
    }
  }

  // Function to convert JSON string to List<ChildMeasurement>
  List<GetGrafikKmsModel> parseGetGrafikKmsModels(String jsonString) {
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return jsonData.entries.map((entry) {
      return GetGrafikKmsModel.fromJson(entry.value);
    }).toList();
  }
}
