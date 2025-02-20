import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_index_ibu_hamil_model.dart';
import '../service/index_ibu_hamil.dart';

part 'get_index_ibu_hamil_event.dart';
part 'get_index_ibu_hamil_state.dart';

class GetIndexIbuHamilBloc
    extends Bloc<GetIndexIbuHamilEvent, GetIndexIbuHamilState> {
  GetIndexIbuHamilBloc() : super(GetIndexIbuHamilInitial()) {
    on<GetIndexIbuHamilEvent>((event, emit) {});
    on<FetchIndexIbuHamil>(fetchIndexIbuHamil);
  }
  Future<void> fetchIndexIbuHamil(
      FetchIndexIbuHamil event, Emitter<GetIndexIbuHamilState> emit) async {
    emit(GetIndexIbuHamilLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await IndexIbuHamil().getAllIbuHamil(accessToken);
        int statusCode = response[0] as int;
        GetIndexIbuHamilModel dataIbuHamil =
            GetIndexIbuHamilModel.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data ibu hamil');
          emit(GetIndexIbuHamilSuccess(dataIbuHamil));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(GetIndexIbuHamilFailed(dataIbuHamil.message));
        }
      } catch (error) {
        emit(GetIndexIbuHamilFailed(error.toString()));
      }
    }
  }
}
