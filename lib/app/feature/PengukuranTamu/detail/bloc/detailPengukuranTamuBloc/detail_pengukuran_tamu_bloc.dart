import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_pengukuran_tamu_response_model.dart';
import '../../service/detail_pengukuran_tamu_api.dart';

part 'detail_pengukuran_tamu_event.dart';
part 'detail_pengukuran_tamu_state.dart';

class DetailPengukuranTamuBloc extends Bloc<DetailPengukuranTamuEvent, DetailPengukuranTamuState> {
  DetailPengukuranTamuBloc() : super(DetailPengukuranTamuInitial()) {
    on<DetailPengukuranTamuEvent>((event, emit) {});

    on<GetDetailPengukuranTamu>(detailPengukuranTamu);
  }

  Future<void> detailPengukuranTamu (GetDetailPengukuranTamu event, Emitter<DetailPengukuranTamuState> emit) async {
    emit(DetailPengukuranTamuProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailPengukuanTamuTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailPengukuranTamuApi().pengukuranTamuService(accessToken, event.pengukuranId);

        int statusCode = response[0] as int;
        final DetailPengukuranTamuResponseModel detailPengukuranTamuResponseModel = DetailPengukuranTamuResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DetailPengukuranTamuSuccesState(
            detailPengukuranTamuResponseModel
          ));
        } else if (statusCode == 401) {
          emit(DetailPengukuanTamuTokenExpiredState());
        } else {
          emit(DetailPengukuranTamuFailedState(detailPengukuranTamuResponseModel.messsage));
        }
      } catch (error) {
        emit(DetailPengukuranTamuFailedState(error.toString()));
      }
    }
  }
}
