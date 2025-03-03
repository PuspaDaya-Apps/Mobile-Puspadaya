import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_riwayat_faktor_resiko_model.dart';
import '../service/detail_riwayat_faktor_resiko.dart';

part 'detail_faktor_resiko_event.dart';
part 'detail_faktor_resiko_state.dart';

class DetailFaktorResikoBloc
    extends Bloc<DetailFaktorResikoEvent, DetailFaktorResikoState> {
  DetailFaktorResikoBloc() : super(DetailFaktorResikoInitial()) {
    on<DetailFaktorResikoEvent>((event, emit) {});
    on<FetchDetailFaktorResiko>(fetchDetailFaktorResiko);
  }

  Future<void> fetchDetailFaktorResiko(FetchDetailFaktorResiko event,
      Emitter<DetailFaktorResikoState> emit) async {
    emit(DetailFaktorResikoLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await DetailRiwayatFaktorResiko()
            .getRiwayatFaktorResikoByBalita(accessToken, event.id);
        int statusCode = response[0] as int;
        GetDetailRiwayatFaktorResiko faktorResikoData =
            GetDetailRiwayatFaktorResiko.fromJson(response[1]);

        if (statusCode == 200) {
          logger.d('Sukses mendapatkan data faktor risiko');
          emit(DetailFaktorResikoSuccess(faktorResikoData));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailFaktorResikoFailed(faktorResikoData.message));
        }
      } catch (error) {
        emit(DetailFaktorResikoFailed(error.toString()));
      }
    }
  }
}
