import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_list_posyandu_response_model.dart';
import '../../service/create_pengukuran_tamu_api.dart';

part 'get_posyandu_event.dart';
part 'get_posyandu_state.dart';

class GetPosyanduBloc extends Bloc<GetPosyanduEvent, GetPosyanduState> {
  GetPosyanduBloc() : super(GetPosyanduInitial()) {
    on<GetPosyanduEvent>((event, emit) {});

    on<GetPosyandu>(getPosyandu);
  }

  Future<void> getPosyandu (GetPosyandu event, Emitter<GetPosyanduState> emit) async {
    emit(GetPosyanduProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(GetPosyanduTokenExpiredState());
    } else {
       try {
          List<dynamic> response = await CreatePengukuranTamuApi().getPosyanduService(accessToken);

          int statusCode = response[0] as int;
          final GetListPosyanduResponseModel getPosyanduResponseModel = GetListPosyanduResponseModel.fromJson(response[1]);

          if(statusCode == 200) {
            emit(GetPosyanduSuccessState(getPosyanduResponseModel));
          } else if (statusCode == 401) {
            emit(GetPosyanduTokenExpiredState());
          } else {
            emit(GetPosyanduFailedState(getPosyanduResponseModel.message));
          }
        } catch (error) {
          emit(GetPosyanduFailedState(error.toString()));
        }
    }
  }
}
