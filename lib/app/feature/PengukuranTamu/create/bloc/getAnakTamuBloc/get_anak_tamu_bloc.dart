import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_list_tamu_response_model.dart';
import '../../service/create_pengukuran_tamu_api.dart';

part 'get_anak_tamu_event.dart';
part 'get_anak_tamu_state.dart';

class GetAnakTamuBloc extends Bloc<GetAnakTamuEvent, GetAnakTamuState> {
  GetAnakTamuBloc() : super(GetAnakTamuInitial()) {
    on<GetAnakTamuEvent>((event, emit) {});

    on<GetAnakTamu>(getAnakTamu);
  }

  Future<void> getAnakTamu (GetAnakTamu event, Emitter<GetAnakTamuState> emit) async {
    emit(GetAnakTamuProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(GetAnakTamuTokenExpiredState());
    } else {
       try {
          List<dynamic> response = await CreatePengukuranTamuApi().getTamuService(accessToken, event.idPosyandu);

          int statusCode = response[0] as int;
          final GetListTamuResponseModel getAnakTamuResponseModel = GetListTamuResponseModel.fromJson(response[1]);

          if(statusCode == 200) {
            emit(GetAnakTamuSuccessState(getAnakTamuResponseModel));
          } else if (statusCode == 401) {
            emit(GetAnakTamuTokenExpiredState());
          } else {
            emit(GetAnakTamuFailedState(getAnakTamuResponseModel.message));
          }
        } catch (error) {
          emit(GetAnakTamuFailedState(error.toString()));
        }
    }
  }
}
