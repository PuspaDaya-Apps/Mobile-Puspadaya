import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/list_ibu_hamil_kunjungan_response_model.dart';
import '../../service/list_ibu_hamil_kunjungan_api.dart';

part 'list_ibu_hamil_kunjungan_event.dart';
part 'list_ibu_hamil_kunjungan_state.dart';

class ListIbuHamilKunjunganBloc extends Bloc<ListIbuHamilKunjunganEvent, ListIbuHamilKunjunganState> {
  ListIbuHamilKunjunganBloc() : super(ListIbuHamilKunjunganInitial()) {
    on<ListIbuHamilKunjunganEvent>((event, emit) {});

    on<GetDataIbuHamil>(getDataIbuHamil);
  }

  Future<void> getDataIbuHamil (GetDataIbuHamil event, Emitter<ListIbuHamilKunjunganState> emit) async {
    emit(ListIbuHamilKunjunganProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(ListIbuHamilKunjunganTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await ListIbuHamilKunjunganApi().getIbuHamil(accessToken);

        int statusCode = response[0] as int;
        final ListIbuHamilKunjunganResponseModel listIbuHamilKunjunganResponseModel = ListIbuHamilKunjunganResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(ListIbuHamilKunjunganSuccessState(listIbuHamilKunjunganResponseModel));
        } else if (statusCode == 401) {
          emit(ListIbuHamilKunjunganTokenExpiredState());
        } else {
          emit(ListIbuHamilKunjunganFailedState(listIbuHamilKunjunganResponseModel.message));
        }
      } catch (error) {
        emit(ListIbuHamilKunjunganFailedState(error.toString()));
      }
    }
  }
}
