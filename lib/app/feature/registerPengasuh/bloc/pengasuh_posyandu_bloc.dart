import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/pengasuh_response_model.dart';
import '../service/pengasuh_posyandu_api.dart';

part 'pengasuh_posyandu_event.dart';
part 'pengasuh_posyandu_state.dart';

class PengasuhPosyanduBloc
    extends Bloc<PengasuhPosyanduEvent, PengasuhPosyanduState> {
  PengasuhPosyanduBloc() : super(PengasuhPosyanduInitial()) {
    on<PengasuhPosyanduEvent>((event, emit) {});
    on<GetListPengasuh>(getListPengasuh);
  }

  Future<void> getListPengasuh (GetListPengasuh event, Emitter<PengasuhPosyanduState> emit) async {
    emit(PengasuhPosyanduLoading());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(PengasuhPosyanduTokenExpiredState());
    } else {
      try {
          List<dynamic> response = await PengasuhPosyanduApi().getPengasuhByPosyandu(accessToken);

          int statusCode = response[0] as int;
          final PengasuhResponseModel pengasuhResponseModel = PengasuhResponseModel.fromJson(response[1]);

          if(statusCode == 200) {
            emit(PengasuhPosyanduSuccess(pengasuhResponseModel));
          } else if (statusCode == 401) {
            emit(PengasuhPosyanduTokenExpiredState());
          } else {
            emit(PengasuhPosyanduFailure(pengasuhResponseModel.message));
          }
        } catch (error) {
          emit(PengasuhPosyanduFailure(error.toString()));
        }
    }
  }
}
