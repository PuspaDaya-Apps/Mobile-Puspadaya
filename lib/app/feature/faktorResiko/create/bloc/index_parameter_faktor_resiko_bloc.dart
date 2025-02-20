import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_index_pertanyaan_model.dart';
import '../model/post_pertanyaan_model.dart';
import '../service/create_faktor_resiko.dart';

part 'index_parameter_faktor_resiko_event.dart';
part 'index_parameter_faktor_resiko_state.dart';

class IndexParameterFaktorResikoBloc extends Bloc<
    IndexParameterFaktorResikoEvent, IndexParameterFaktorResikoState> {
  IndexParameterFaktorResikoBloc()
      : super(IndexParameterFaktorResikoInitial()) {
    on<IndexParameterFaktorResikoEvent>((event, emit) {});
    on<FetchFaktorResikoById>(getParameterFaktorResiko);
  }
  Future<void> getParameterFaktorResiko(FetchFaktorResikoById event,
      Emitter<IndexParameterFaktorResikoState> emit) async {
    emit(IndexParamterFaktorResikoLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await CreateFaktorResiko()
            .getFaktorResikoByBalita(accessToken, event.id);
        int statusCode = response[0] as int;
        GetIndexPertanyaanModel faktorResikoData =
            GetIndexPertanyaanModel.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data jadwal posyandu');
          emit(IndexParamterFaktorResikoSuccess(faktorResikoData));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexParamterFaktorResikoFailed(faktorResikoData.message));
        }
      } catch (error) {
        emit(IndexParamterFaktorResikoFailed(error.toString()));
      }
    }
  }
}
