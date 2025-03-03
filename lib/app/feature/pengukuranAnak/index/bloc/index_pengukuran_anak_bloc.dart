import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/index_pengukuran_anak_response_model.dart';
import '../service/index_pengukuran_anak_api.dart';

part 'index_pengukuran_anak_event.dart';
part 'index_pengukuran_anak_state.dart';

class IndexPengukuranAnakBloc extends Bloc<IndexPengukuranAnakEvent, IndexPengukuranAnakState> {
  IndexPengukuranAnakBloc() : super(IndexPengukuranAnakInitial()) {
    on<IndexPengukuranAnakEvent>((event, emit) {});

    on<GetPengukuranAnakEvent>(getPengukuranAnak);
  }

  Future<void> getPengukuranAnak (GetPengukuranAnakEvent event, Emitter<IndexPengukuranAnakState> emit) async {
    emit(IndexPengukuranAnakProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(IndexPengukuranAnakTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexPengukuranAnakApi().getpengukuranAnakService(accessToken);

        int statusCode = response[0] as int;
        final IndexPengukuranAnakResponseModel indexPengukuranAnakResponseModel = IndexPengukuranAnakResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(IndexPengukuranAnakSuccessState(indexPengukuranAnakResponseModel));
        } else if (statusCode == 401) {
          emit(IndexPengukuranAnakTokenExpiredState());
        } else {
          emit(IndexPengukuranAnakFailedState(indexPengukuranAnakResponseModel.message));
        }
      } catch (error) {
        emit(IndexPengukuranAnakFailedState(error.toString()));
      }
    }
  }
}

