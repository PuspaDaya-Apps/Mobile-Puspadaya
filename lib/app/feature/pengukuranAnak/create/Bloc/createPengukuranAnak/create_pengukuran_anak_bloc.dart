import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/pengukuran_anak_model.dart';
import '../../model/pengukuran_anak_response_model.dart';
import '../../service/create_pengukuran_anak_api.dart';

part 'create_pengukuran_anak_event.dart';
part 'create_pengukuran_anak_state.dart';

class CreatePengukuranAnakBloc extends Bloc<CreatePengukuranAnakEvent, CreatePengukuranAnakState> {
  CreatePengukuranAnakBloc() : super(CreatePengukuranAnakInitial()) {
    on<CreatePengukuranAnakEvent>((event, emit) {});

    on<SendPengukuranAnakEvent>(pengukuranAnak);

    on<NullErrorEvent>((event, emit){
      emit(const NullErrorState("Form pengukuran anak tidak boleh kosong"));
    });
  }

  Future<void> pengukuranAnak (SendPengukuranAnakEvent event, Emitter<CreatePengukuranAnakState> emit) async {
    emit(CreatePengukuranAnakProcessState());

    SharedPrefUtils().getAccessToken().then((accesTokenValue) async {
      if(accesTokenValue == null) {
        emit(TokenExpiredState());

      } else {
        try {
          List<dynamic> response = await CreatePengukuranAnakApi().pengukuranAnakService(accesTokenValue, event.pengukuranAnakModel);

          int statusCode = response[0] as int;
          final PengukuranAnakResponseModel pengukuranAnakResponseModel = PengukuranAnakResponseModel.fromJson(response[1]);

          if(statusCode == 200) {
            emit(CreatePengukuranAnakSuccesState(pengukuranAnakResponseModel));
          } else if (statusCode == 401) {
            emit(TokenExpiredState());
          } else {
            emit(CreatePengukuranAnakFailedState(pengukuranAnakResponseModel.message));
          }
        } catch (error) {
          emit(CreatePengukuranAnakFailedState(error.toString()));
        }
      }
    }); 
  }
}

