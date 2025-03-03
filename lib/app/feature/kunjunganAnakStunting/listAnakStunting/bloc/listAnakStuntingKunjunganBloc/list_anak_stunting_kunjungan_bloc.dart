import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/list_anak_stunting_kunjungan_response_model.dart';
import '../../service/list_anak_stunting_kunjungan_api.dart';

part 'list_anak_stunting_kunjungan_event.dart';
part 'list_anak_stunting_kunjungan_state.dart';

class ListAnakStuntingKunjunganBloc extends Bloc<ListAnakStuntingKunjunganEvent, ListAnakStuntingKunjunganState> {
  ListAnakStuntingKunjunganBloc() : super(ListAnakStuntingKunjunganInitial()) {
    on<ListAnakStuntingKunjunganEvent>((event, emit) {});

    on<GetDataAnakStunting>(getDataAnakStunting);
  }

  Future<void> getDataAnakStunting (GetDataAnakStunting event, Emitter<ListAnakStuntingKunjunganState> emit) async {
    emit(ListAnakStuntingKunjunganProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(ListAnakStuntingKunjunganTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await ListAnakStuntingKunjunganApi().getAnakStunting(accessToken);

        int statusCode = response[0] as int;
        final ListAnakStuntingKunjunganResponseModel listAnakStuntingKunjunganResponseModel = ListAnakStuntingKunjunganResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(ListAnakStuntingKunjunganSuccessState(listAnakStuntingKunjunganResponseModel));
        } else if (statusCode == 401) {
          emit(ListAnakStuntingKunjunganTokenExpiredState());
        } else {
          emit(ListAnakStuntingKunjunganFailedState(listAnakStuntingKunjunganResponseModel.message));
        }
      } catch (error) {
        emit(ListAnakStuntingKunjunganFailedState(error.toString()));
      }
    }
  }
}
