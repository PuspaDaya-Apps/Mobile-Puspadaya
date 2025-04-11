import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/index_pengukuran_tamu_response_model.dart';
import '../service/index_pengukuran_tamu_api.dart';

part 'index_pengukuran_tamu_event.dart';
part 'index_pengukuran_tamu_state.dart';

class IndexPengukuranTamuBloc extends Bloc<IndexPengukuranTamuEvent, IndexPengukuranTamuState> {
  IndexPengukuranTamuBloc() : super(IndexPengukuranTamuInitial()) {
    on<IndexPengukuranTamuEvent>((event, emit) { });

    on<GetPengukuranTamuEvent>(getPengukuranTamu);
  }

  Future<void> getPengukuranTamu (GetPengukuranTamuEvent event, Emitter<IndexPengukuranTamuState> emit) async {
    emit(IndexPengukuranTamuProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(IndexPengukuranTamuTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexPengukuranTamuApi().getpengukuranTamuService(accessToken);

        int statusCode = response[0] as int;
        final IndexPengukuranTamuResponseModel indexPengukuranTamuResponseModel = IndexPengukuranTamuResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(IndexPengukuranTamuSuccessState(indexPengukuranTamuResponseModel));
        } else if (statusCode == 401) {
          emit(IndexPengukuranTamuTokenExpiredState());
        } else {
          emit(IndexPengukuranTamuFailedState(indexPengukuranTamuResponseModel.message));
        }
      } catch (error) {
        emit(IndexPengukuranTamuFailedState(error.toString()));
      }
    }
  }
}
