import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/post_pengukuran_ibu_hamil_model.dart';
import '../../model/post_pengukuran_ibu_hamil_response_model.dart';
import '../../service/create_pengukuran_ibu_hamil_api.dart';

part 'create_pengukuran_ibu_hamil_event.dart';
part 'create_pengukuran_ibu_hamil_state.dart';

class CreatePengukuranIbuHamilBloc extends Bloc<CreatePengukuranIbuHamilEvent, CreatePengukuranIbuHamilState> {
  CreatePengukuranIbuHamilBloc() : super(CreatePengukuranIbuHamilInitial()) {
    on<CreatePengukuranIbuHamilEvent>((event, emit) {});

    on<SendPengukuranIbuHamilEvent>(pengukuranIbuHamil);

    on<NullErrorEvent>((event, emit) {
      emit(const CreatePengukuranIbuHamilNullErrorState("Form pengukuran ibu hamil tidak boleh kosong"));
    });
  }

  Future<void> pengukuranIbuHamil (SendPengukuranIbuHamilEvent event, Emitter<CreatePengukuranIbuHamilState> emit) async {
    emit(CreatePengukuranIbuHamilProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreatePengukuranIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await CreatePengukuranIbuHamilApi().pengukuranIbuHamilService(accessToken, event.pengukuranIbuHamilModel);

        int statusCode = response[0] as int;
        final PostPengukuranIbuHamilResponseModel postPengukuranIbuHamilResponseModel = PostPengukuranIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 201) {
          emit(CreatePengukuranIbuHamilSuccesState(
            pengukuranIbuHamilResponseModel: postPengukuranIbuHamilResponseModel,
          )
        );
        } else if (statusCode == 401) {
          emit(CreatePengukuranIbuHamilTokenExpiredState());
        } else if (statusCode == 404) {
          emit(CreatePengukuranIbuHamilFailedState(postPengukuranIbuHamilResponseModel.message));
        } else {
          emit(CreatePengukuranIbuHamilFailedState(postPengukuranIbuHamilResponseModel.message));
        }
      } catch (error) {
        emit(CreatePengukuranIbuHamilFailedState(error.toString()));
      }
    }
  }
}
