import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/create_anak_model.dart';
import '../../model/create_anak_response_model.dart';
import '../../service/create_anak_api.dart';

part 'create_anak_event.dart';
part 'create_anak_state.dart';

class CreateAnakBloc extends Bloc<CreateAnakEvent, CreateAnakState> {
  CreateAnakBloc() : super(CreateAnakInitial()) {
    on<CreateAnakEvent>((event, emit) {});

    on<CreateAnak>(createAnak);

    on<NullErrorEvent>((event, emit) {
      emit(const CreateAnakNullErrorState("Form Tambah Data Anak Tidak Boleh Kosong"));
    });
  }

  Future<void> createAnak (CreateAnak event, Emitter<CreateAnakState> emit) async {
    emit(CreateAnakProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreateAnakTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await CreateAnakApi().createAnakService(accessToken, event.createAnakModel);

        int statusCode = response[0] as int;
        final CreateAnakResponseModel createAnakResponseModel = CreateAnakResponseModel.fromJson(response[1]);

        if(statusCode == 201) {
          emit(CreateAnakSuccessState(
            createAnakResponseModel
          )
        );
        } else if (statusCode == 401) {
          emit(CreateAnakTokenExpiredState());
        } else {
          emit(CreateAnakFailedState(createAnakResponseModel.message));
        }
      } catch (error) {
        emit(CreateAnakFailedState(error.toString()));
      }
    }
  }
}
