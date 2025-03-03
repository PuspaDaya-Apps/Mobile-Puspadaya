import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_index_riwayat_faktor_resiko_model.dart';
import '../service/index_riwayat_faktor_resiko.dart';

part 'riwayat_faktor_resiko_event.dart';
part 'riwayat_faktor_resiko_state.dart';

class RiwayatFaktorResikoBloc
    extends Bloc<RiwayatFaktorResikoEvent, RiwayatFaktorResikoState> {
  RiwayatFaktorResikoBloc() : super(RiwayatFaktorResikoInitial()) {
    on<RiwayatFaktorResikoEvent>((event, emit) {});
    on<FeatchRiwayatFaktorResiko>(fetchRiwayatFaktorResiko);
  }
  Future<void> fetchRiwayatFaktorResiko(FeatchRiwayatFaktorResiko event,
      Emitter<RiwayatFaktorResikoState> emit) async {
    emit(RiwayatFaktorResikoLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await IndexRiwayatFaktorResiko()
            .getAllRiwayatFaktorResiko(accessToken, event.anakId);
        int statusCode = response[0] as int;
        GetIndexRiwayatFaktorResikoModel riwayatFaktorResiko =
            GetIndexRiwayatFaktorResikoModel.fromJson(response[1]);

        if (statusCode == 200) {
          logger.d('succes get data riwayat faktor resiko');
          emit(RiwayatFaktorResikoSuccess(riwayatFaktorResiko));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(RiwayatFaktorResikoFailed(riwayatFaktorResiko.message));
        }
      } catch (error) {
        emit(RiwayatFaktorResikoFailed(error.toString()));
      }
    }
  }
}
