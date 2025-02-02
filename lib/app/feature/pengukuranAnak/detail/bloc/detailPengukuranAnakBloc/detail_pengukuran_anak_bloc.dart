import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_pengukuran_anak_response_model.dart';
import '../../service/detail_pengukuran_anak_api.dart';

part 'detail_pengukuran_anak_event.dart';
part 'detail_pengukuran_anak_state.dart';

class DetailPengukuranAnakBloc extends Bloc<DetailPengukuranAnakEvent, DetailPengukuranAnakState> {
  DetailPengukuranAnakBloc() : super(DetailPengukuranAnakInitial()) {
    on<DetailPengukuranAnakEvent>((event, emit) {});

    on<GetDetailPengukuranAnak>(detailPengukuranAnak);
  }

  Future<void> detailPengukuranAnak (GetDetailPengukuranAnak event, Emitter<DetailPengukuranAnakState> emit) async {
    emit(DetailPengukuranAnakProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailPengukuanAnakTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailPengukuranAnakApi().pengukuranAnakService(accessToken, event.pengukuranId);

        int statusCode = response[0] as int;
        final DetailPengukuranAnakResponseModel detailPengukuranAnakResponseModel = DetailPengukuranAnakResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DetailPengukuranAnakSuccesState(
            detailPengukuranAnakResponseModel
          ));
        } else if (statusCode == 401) {
          emit(DetailPengukuanAnakTokenExpiredState());
        } else {
          emit(DetailPengukuranAnakFailedState(detailPengukuranAnakResponseModel.messsage));
        }
      } catch (error) {
        emit(DetailPengukuranAnakFailedState(error.toString()));
      }
    }
  }
}
