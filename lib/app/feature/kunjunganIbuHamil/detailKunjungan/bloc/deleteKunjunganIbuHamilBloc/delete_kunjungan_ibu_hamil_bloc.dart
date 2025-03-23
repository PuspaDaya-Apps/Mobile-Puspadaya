import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/delete_kunjungan_ibu_hamil_response_model.dart';
import '../../service/detail_kunjungan_ibu_hamil_api.dart';

part 'delete_kunjungan_ibu_hamil_event.dart';
part 'delete_kunjungan_ibu_hamil_state.dart';

class DeleteKunjunganIbuHamilBloc extends Bloc<DeleteKunjunganIbuHamilEvent, DeleteKunjunganIbuHamilState> {
  DeleteKunjunganIbuHamilBloc() : super(DeleteKunjunganIbuHamilInitial()) {
    on<DeleteKunjunganIbuHamilEvent>((event, emit) {});

    on<DeleteKunjungan>(deleteKunjungan);
  }

  Future<void> deleteKunjungan (DeleteKunjungan event, Emitter<DeleteKunjunganIbuHamilState> emit) async {
    emit(DeleteKunjunganIbuHamilProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DeleteKunjunganIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailKunjunganIbuHamilApi().deleteDetailIbuHamil(accessToken, event.idKunjungan);

        int statusCode = response[0] as int;
        final DeleteKunjunganIbuHamilResponseModel deleteKunjunganIbuHamilResponseModel = DeleteKunjunganIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DeleteKunjunganIbuHamilSuccessState(deleteKunjunganIbuHamilResponseModel));
        } else if (statusCode == 401) {
          emit(DeleteKunjunganIbuHamilTokenExpiredState());
        } else {
          emit(DeleteKunjunganIbuHamilFailedState(deleteKunjunganIbuHamilResponseModel.message));
        }
      } catch (error) {
        emit(DeleteKunjunganIbuHamilFailedState(error.toString()));
      }
    }
  }
}
