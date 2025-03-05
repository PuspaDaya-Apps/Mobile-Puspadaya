import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/list_anak_tidak_hadir_kunjungan_response_model.dart';
import '../../service/list_anak_tidak_hadir_kunjungan_api.dart';

part 'list_anak_tidak_hadir_kunjungan_event.dart';
part 'list_anak_tidak_hadir_kunjungan_state.dart';

class ListAnakTidakHadirKunjunganBloc extends Bloc<ListAnakTidakHadirKunjunganEvent, ListAnakTidakHadirKunjunganState> {
  ListAnakTidakHadirKunjunganBloc() : super(ListAnakTidakHadirKunjunganInitial()) {
    on<ListAnakTidakHadirKunjunganEvent>((event, emit) {});

    on<GetDataAnakTidakHadir>(getDataAnakTidakHadir);
  }

  Future<void> getDataAnakTidakHadir (GetDataAnakTidakHadir event, Emitter<ListAnakTidakHadirKunjunganState> emit) async {
    emit(ListAnakTidakHadirKunjunganProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(ListAnakTidakHadirKunjunganTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await ListAnakTidakHadirKunjunganApi().getAnakTidakHadir(accessToken);

        int statusCode = response[0] as int;
        final ListAnakTidakHadirKunjunganResponseModel listAnakTidakHadirKunjunganResponseModel = ListAnakTidakHadirKunjunganResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(ListAnakTidakHadirKunjunganSuccessState(listAnakTidakHadirKunjunganResponseModel));
        } else if (statusCode == 401) {
          emit(ListAnakTidakHadirKunjunganTokenExpiredState());
        } else {
          emit(ListAnakTidakHadirKunjunganFailedState(listAnakTidakHadirKunjunganResponseModel.message));
        }
      } catch (error) {
        emit(ListAnakTidakHadirKunjunganFailedState(error.toString()));
      }
    }
  }
}
