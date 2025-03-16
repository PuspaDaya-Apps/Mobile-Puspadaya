import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/alat_ukur_response_model.dart';
import '../../service/alat_ukur_save_api.dart';

part 'alat_ukur_save_event.dart';
part 'alat_ukur_save_state.dart';

class AlatUkurSaveBloc extends Bloc<AlatUkurSaveEvent, AlatUkurSaveState> {
  AlatUkurSaveBloc() : super(AlatUkurSaveProccessState()) {
    on<AlatUkurSaveEvent>((event, emit) {});

    on<GetAlatUkur>(getAlatUkurSave);
  }

  Future<void> getAlatUkurSave (GetAlatUkur event, Emitter<AlatUkurSaveState> emit) async {
    emit(AlatUkurSaveProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken != null) {
      try {
        List<dynamic> response = await AlatUkurSaveApi().getAlatUkurService(accessToken!);

        int statusCode = response[0] as int;
        final AlatUkurResponseModel alatUkurSaveResponseModel = AlatUkurResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(AlatUkurSaveSuccessState(alatUkurSaveResponseModel));
        } else if (statusCode == 401) {
          emit(AlatUkurSaveTokenExpiredState());
        } else {
          emit(AlatUkurSaveFailedState(alatUkurSaveResponseModel.message));
        }
      } catch (error) {
        emit(AlatUkurSaveFailedState(error.toString()));
      }
    } else {
      emit(AlatUkurSaveTokenExpiredState());
    }
  }
}
