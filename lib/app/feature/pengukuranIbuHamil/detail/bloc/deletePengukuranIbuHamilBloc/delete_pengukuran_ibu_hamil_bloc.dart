import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/hapus_pengukuran_ibu_hamil_response_model.dart';
import '../../service/detail_pengukuran_ibu_hamil_api.dart';

part 'delete_pengukuran_ibu_hamil_event.dart';
part 'delete_pengukuran_ibu_hamil_state.dart';

class DeletePengukuranIbuHamilBloc extends Bloc<DeletePengukuranIbuHamilEvent, DeletePengukuranIbuHamilState> {
  DeletePengukuranIbuHamilBloc() : super(DeletePengukuranIbuHamilInitial()) {
    on<DeletePengukuranIbuHamilEvent>((event, emit) {});

    on<SendDeletePengukuranIbuHamil>(sendDeletePengukuranIbuHamil);
  }

  Future<void> sendDeletePengukuranIbuHamil (SendDeletePengukuranIbuHamil event, Emitter<DeletePengukuranIbuHamilState> emit) async {
    emit(DeletePengukuranIbuHamilProccesState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailPengukuranIbuHamilApi().hapusPengukuranIbuHamilService(accessToken, event.pengukuranId);

        int statusCode = response[0] as int;
        final HapusPengukuranIbuHamilResponseModel hapusPengukuranIbuHamilResponseModel = HapusPengukuranIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
            emit(DeletePengukuranIbuHamilSuccessState());
          } else if (statusCode == 401) {
            emit(TokenExpiredState());
          } else {
            emit(DeletePengukuranIbuHamilFailedState(hapusPengukuranIbuHamilResponseModel.message));
          }
      } catch (error) {
        emit(DeletePengukuranIbuHamilFailedState(error.toString()));
      }
    }
  }
}
