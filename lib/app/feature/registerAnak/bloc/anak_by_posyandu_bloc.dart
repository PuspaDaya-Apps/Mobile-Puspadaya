import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/registerAnak/model/get_anak_by_posyandu_response.dart';
import 'package:puspadaya/utils/helper/helper_core.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/anak_item_model.dart';
import '../service/register_anak_api.dart';

part 'anak_by_posyandu_event.dart';
part 'anak_by_posyandu_state.dart';

class AnakByPosyanduBloc
    extends Bloc<AnakByPosyanduEvent, AnakByPosyanduState> {
  AnakByPosyanduBloc() : super(AnakByPosyanduInitial()) {
    on<AnakByPosyanduEvent>((event, emit) {});
    on<FetchAnak>(fecthingAnak);
  }
  Future<void> fecthingAnak(
      FetchAnak event, Emitter<AnakByPosyanduState> emit) async {
    emit(AnakByPosyanduLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    }
    try {
      List<dynamic> response =
          await RegisterAnakApi().getAnakByPosyandu(accesTokenValue!);
      int statusCode = response[0] as int;
      logger.d('statusCode ${statusCode}');
      final GetAnakByPosyanduResponse getAnakByPosyanduResponse =
          GetAnakByPosyanduResponse.fromJson(response[1]);
      logger.d(getAnakByPosyanduResponse);
      if (statusCode == 200) {
        List<AnakItemModel> anakItemList =
            getAnakByPosyanduResponse.data.map((data) {
          Usia usia = HelperCore.convertUsiaToPiece(data.usia);
          return AnakItemModel(
            jenisKelamin: data.jenisKelamin,
            id: data.id,
            nama: data.namaAnak,
            nik: data.nik,
            bulan: usia.bulan,
            year: usia.tahun,
          );
        }).toList();
        emit(
          AnakByPosyanduSuccess(anakItems: anakItemList),
        );
      }
    } catch (e) {
      emit(AnakByPosyanduFailure(e.toString()));
    }
  }
}
