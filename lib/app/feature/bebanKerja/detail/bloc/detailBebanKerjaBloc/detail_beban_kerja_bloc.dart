import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_beban_kerja_response_model.dart';
import '../../service/detail_beban_kerja_api.dart';

part 'detail_beban_kerja_event.dart';
part 'detail_beban_kerja_state.dart';

class DetailBebanKerjaBloc extends Bloc<DetailBebanKerjaEvent, DetailBebanKerjaState> {
  DetailBebanKerjaBloc() : super(DetailBebanKerjaInitial()) {
    on<DetailBebanKerjaEvent>((event, emit) {});

    on<GetDetailBebanKerja>(detailBebanKerja);
  }

  Future<void> detailBebanKerja (GetDetailBebanKerja event, Emitter<DetailBebanKerjaState> emit) async {
     emit(DetailBebanKerjaProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailPengukuanAnakTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailBebanKerjaApi().detailBebanKerjaService(accessToken, event.bebanKerjaId);

        int statusCode = response[0] as int;
        final DetailBebanKerjaResponseModel detailBebanKerjaResponseModel = DetailBebanKerjaResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(DetailBebanKerjaSuccesState(
            detailBebanKerjaResponseModel
          ));
        } else if (statusCode == 401) {
          emit(DetailPengukuanAnakTokenExpiredState());
        } else {
          emit(DetailBebanKerjaFailedState(detailBebanKerjaResponseModel.message));
        }
      } catch (error) {
        emit(DetailBebanKerjaFailedState(error.toString()));
      }
    }
  }
}
