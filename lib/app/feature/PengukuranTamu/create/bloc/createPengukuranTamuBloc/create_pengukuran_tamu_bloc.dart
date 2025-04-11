import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/pengukuran_tamu_model.dart';
import '../../model/pengukuran_tamu_response_model.dart';
import '../../service/create_pengukuran_tamu_api.dart';

part 'create_pengukuran_tamu_event.dart';
part 'create_pengukuran_tamu_state.dart';

class CreatePengukuranTamuBloc extends Bloc<CreatePengukuranTamuEvent, CreatePengukuranTamuState> {
  CreatePengukuranTamuBloc() : super(CreatePengukuranTamuInitial()) {
    on<CreatePengukuranTamuEvent>((event, emit) {});

     on<SendPengukuranTamuEvent>(pengukuranTamu);

    on<NullErrorEvent>((event, emit){
      emit(const CreatePengukuranTamuNullErrorState("Form pengukuran Tamu tidak boleh kosong"));
    });
  }

  Future<void> pengukuranTamu (SendPengukuranTamuEvent event, Emitter<CreatePengukuranTamuState> emit) async {
    emit(CreatePengukuranTamuProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreatePengukuranTamuTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await CreatePengukuranTamuApi().pengukuranTamuService(accessToken, event.pengukuranTamuModel);

        int statusCode = response[0] as int;
        final PengukuranTamuResponseModel pengukuranTamuResponseModel = PengukuranTamuResponseModel.fromJson(response[1]);

        if(statusCode == 201) {
          String statusGizi = "${pengukuranTamuResponseModel.data!.statusGizi.statusGizi}\n${pengukuranTamuResponseModel.data!.statusGizi.statusWasting}";

          emit(CreatePengukuranTamuSuccesState(
            pengukuranTamuResponseModel: pengukuranTamuResponseModel,
            statusGizi: statusGizi
          )
        );
        } else if (statusCode == 401) {
          emit(CreatePengukuranTamuTokenExpiredState());
        } else if (statusCode == 404) {
          emit(CreatePengukuranTamuFailedState(pengukuranTamuResponseModel.message));
        } else {
          emit(CreatePengukuranTamuFailedState(pengukuranTamuResponseModel.message));
        }
      } catch (error) {
        emit(CreatePengukuranTamuFailedState(error.toString()));
      }
    }
  }
}
