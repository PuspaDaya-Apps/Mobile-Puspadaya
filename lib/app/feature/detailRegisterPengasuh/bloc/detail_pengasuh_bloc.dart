import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/detail_pengasuh_response_model.dart';
import '../service/detail_pengasuh_api.dart';

part 'detail_pengasuh_event.dart';
part 'detail_pengasuh_state.dart';

class DetailPengasuhBloc extends Bloc<DetailPengasuhEvent, DetailPengasuhState> {
  DetailPengasuhBloc() : super(DetailPengasuhInitial()) {
    on<DetailPengasuhEvent>((event, emit) {});

    on<GetDetailPengasuh>(getDetailPengasuh);
  }

  Future<void> getDetailPengasuh (GetDetailPengasuh event, Emitter<DetailPengasuhState> emit) async {
     emit(DetailPengasuhProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailPengasuhTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailPengasuhApi().detailPengasuh(accessToken, event.pengasuhId);

        int statusCode = response[0] as int;
        final DetailPengasuhResponseModel detailPengasuhResponseModel = DetailPengasuhResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DetailPengasuhSuccesState(detailPengasuhResponseModel));
        } else if (statusCode == 401) {
          emit(DetailPengasuhTokenExpiredState());
        } else {
          emit(DetailPengasuhFailedState(detailPengasuhResponseModel.message));
        }
      } catch (error) {
        emit(DetailPengasuhFailedState(error.toString()));
      }
    }
  }
}
