import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/delete_pengukuran_tamu_response_model.dart';
import '../../service/detail_pengukuran_tamu_api.dart';

part 'delete_pengukuran_tamu_event.dart';
part 'delete_pengukuran_tamu_state.dart';

class DeletePengukuranTamuBloc extends Bloc<DeletePengukuranTamuEvent, DeletePengukuranTamuState> {
  DeletePengukuranTamuBloc() : super(DeletePengukuranTamuInitial()) {
    on<DeletePengukuranTamuEvent>((event, emit) {});

    on<SendDeletePengukuranTamu>(deletePengukuran);
  }

  Future<void> deletePengukuran (SendDeletePengukuranTamu event, Emitter<DeletePengukuranTamuState> emit) async {
    emit(DeletePengukuranTamuProccesState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailPengukuranTamuApi().hapusPengukuranTamuService(accessToken, event.pengukuranId);

        int statusCode = response[0] as int;
        final DeletePengukuranTamuResponseModel deletePengukuranTamuResponseModel = DeletePengukuranTamuResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
            emit(DeletePengukuranTamuSuccessState());
          } else if (statusCode == 401) {
            emit(TokenExpiredState());
          } else {
            emit(DeletePengukuranTamuFailedState(deletePengukuranTamuResponseModel.message));
          }
      } catch (error) {
        emit(DeletePengukuranTamuFailedState(error.toString()));
      }
    }

  }
}
