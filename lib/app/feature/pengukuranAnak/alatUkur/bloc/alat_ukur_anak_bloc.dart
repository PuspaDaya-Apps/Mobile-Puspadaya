import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/utils/shared_preferences_utils/shared_preferences_utils.dart';

import '../model/alat_ukur_response_model.dart';
import '../service/alat_ukur_api.dart';

part 'alat_ukur_anak_event.dart';
part 'alat_ukur_anak_state.dart';

class AlatUkurAnakBloc extends Bloc<AlatUkurAnakEvent, AlatUkurAnakState> {
  AlatUkurAnakBloc() : super(AlatUkurAnakInitial()) {
    on<AlatUkurAnakEvent>((event, emit) {});

    on<GetAlatUkur>(getAlatUkur);
  }

  Future<void> getAlatUkur (GetAlatUkur event, Emitter<AlatUkurAnakState> emit) async {
    emit(AlatUkurAnakProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();
    
    try {
        List<dynamic> response = await AlatUkurApi().getAlatUkurService(accessToken!);

        int statusCode = response[0] as int;
        final AlatUkurResponseModel alatUkurAnakResponseModel = AlatUkurResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(AlatUkurAnakSuccessState(alatUkurAnakResponseModel));
        } else if (statusCode == 401) {
          emit(AlatUkurAnakTokenExpiredState());
        } else {
          emit(AlatUkurAnakFailedState(alatUkurAnakResponseModel.message));
        }
      } catch (error) {
        emit(AlatUkurAnakFailedState(error.toString()));
      }
    }
}
