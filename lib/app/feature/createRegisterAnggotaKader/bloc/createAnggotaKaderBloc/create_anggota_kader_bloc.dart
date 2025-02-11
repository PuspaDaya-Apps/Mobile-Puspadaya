import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/create_anggota_kader_model.dart';
import '../../model/create_anggota_kader_response_model.dart';
import '../../service/create_anggota_kader_api.dart';

part 'create_anggota_kader_event.dart';
part 'create_anggota_kader_state.dart';

class CreateAnggotaKaderBloc extends Bloc<CreateAnggotaKaderEvent, CreateAnggotaKaderState> {
  CreateAnggotaKaderBloc() : super(CreateAnggotaKaderInitial()) {
    on<CreateAnggotaKaderEvent>((event, emit) {});

    on<CreateAnggotaKader>(createAnggotaKader);
  }

  Future<void> createAnggotaKader (CreateAnggotaKader event, Emitter<CreateAnggotaKaderState> emit) async {
    emit(CreateAnggotaKaderProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreateAnggotaKaderTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await CreateAnggotaKaderApi().createAnggotaKaderService(accessToken, event.createAnggotaKaderModel);

        int statusCode = response[0] as int;
        final CreateAnggotaKaderResponseModel createAnggotaKaderResponseModel = CreateAnggotaKaderResponseModel.fromJson(
          response[1]
        );

        if(statusCode == 201) {
          emit(CreateAnggotaKaderSuccessState(
            createAnggotaKaderResponseModel
          )
        );
        } else if (statusCode == 401) {
          emit(CreateAnggotaKaderTokenExpiredState());
        } else {
          emit(CreateAnggotaKaderFailedState(createAnggotaKaderResponseModel.message));
        }
      } catch (error) {
        emit(CreateAnggotaKaderFailedState(error.toString()));
      }
    }
  }
}
