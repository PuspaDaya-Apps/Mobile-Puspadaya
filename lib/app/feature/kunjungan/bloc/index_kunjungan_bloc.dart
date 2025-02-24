import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/kunjungan_response_model.dart';
import '../service/index_kunjungan_api.dart';

part 'index_kunjungan_event.dart';
part 'index_kunjungan_state.dart';

class IndexKunjunganBloc extends Bloc<IndexKunjunganEvent, IndexKunjunganState> {
  IndexKunjunganBloc() : super(IndexKunjunganProccessState()) {
    on<IndexKunjunganEvent>((event, emit) {});

    on<GetDataKunjungan>(getDataKunjungan);
  }

  Future<void> getDataKunjungan (GetDataKunjungan event, Emitter<IndexKunjunganState> emit) async {
    emit(IndexKunjunganProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(IndexKunjunganTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexKunjunganApi().getKunjunganService(accessToken);

        int statusCode = response[0] as int;
        final KunjunganResponseModel indexKunjunganResponseModel = KunjunganResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(IndexKunjunganSuccessState(indexKunjunganResponseModel));
        } else if (statusCode == 401) {
          emit(IndexKunjunganTokenExpiredState());
        } else {
          emit(IndexKunjunganFailedState(indexKunjunganResponseModel.message));
        }
      } catch (error) {
        emit(IndexKunjunganFailedState(error.toString()));
      }
    }
  }
}
