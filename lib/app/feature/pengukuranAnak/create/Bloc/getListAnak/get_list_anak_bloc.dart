import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_list_anak_response_model.dart';
import '../../service/create_pengukuran_anak_api.dart';

part 'get_list_anak_event.dart';
part 'get_list_anak_state.dart';

class GetListAnakBloc extends Bloc<GetListAnakEvent, GetListAnakState> {
  GetListAnakBloc() : super(GetListAnakInitial()) {
    on<GetListAnakEvent>((event, emit) {});
  
    on<GetListAnak>(getListAnak);
  }

  Future<void> getListAnak (GetListAnak event, Emitter<GetListAnakState> emit) async {
    emit(GetListAnakProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(GetListAnakTokenExpiredState());
    } else {
       try {
          List<dynamic> response = await CreatePengukuranAnakApi().getAnakService(accessToken);

          int statusCode = response[0] as int;
          final GetListAnakResponseModel getListAnakResponseModel = GetListAnakResponseModel.fromJson(response[1]);

          if(statusCode == 200) {
            emit(GetListAnakSuccessState(getListAnakResponseModel));
          } else if (statusCode == 401) {
            emit(GetListAnakTokenExpiredState());
          } else {
            emit(GetListAnakFailedState(getListAnakResponseModel.message));
          }
        } catch (error) {
          emit(GetListAnakFailedState(error.toString()));
        }
    }
  }
}
