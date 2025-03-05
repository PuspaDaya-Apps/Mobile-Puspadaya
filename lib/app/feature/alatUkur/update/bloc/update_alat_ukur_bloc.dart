import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/alatUkur/create/bloc/create_alat_ukur_bloc.dart';
import 'package:puspadaya/app/feature/alatUkur/create/model/post_alat_ukur_alat_deteksi_dini_model.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../create/model/post_alat_ukur_model.dart';
import '../service/update_alat_ukur.dart';

part 'update_alat_ukur_event.dart';
part 'update_alat_ukur_state.dart';

class UpdateAlatUkurBloc
    extends Bloc<UpdateAlatUkurEvent, UpdateAlatUkurState> {
  UpdateAlatUkurBloc() : super(UpdateAlatUkurInitial()) {
    on<UpdateAlatUkurEvent>((event, emit) {});
    on<UpdateAlatUkurDeteksiDini>(updateAlatUkurDeteksiDini);
    on<UpdateAlatUkurKader>(updateAlatUkurKader);
  }
  // deteksi dini
  Future<void> updateAlatUkurDeteksiDini(UpdateAlatUkurDeteksiDini event,
      Emitter<UpdateAlatUkurState> emit) async {
    emit(UpdateAlataUkurLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await UpdateAlatUkur()
            .patchAlatUkurDeteksiDini(accessToken, event.data);
        int statusCode = response[0] as int;
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 201) {
          logger.d('succes update alat ukur deteksi dini');
          emit(UpdateAlataUkurSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(UpdateAlatUkurFailed("Something Went Wrong"));
        }
      } catch (error) {
        emit(UpdateAlatUkurFailed(error.toString()));
      }
    }
  }

  Future<void> updateAlatUkurKader(
      UpdateAlatUkurKader event, Emitter<UpdateAlatUkurState> emit) async {
    emit(UpdateAlataUkurLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await UpdateAlatUkur()
            .patchAlatUkur(event.id, accessToken, event.data);
        int statusCode = response[0] as int;
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes update alat ukur');
          emit(UpdateAlataUkurSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(UpdateAlatUkurFailed("Something Went Wrong"));
        }
      } catch (error) {
        emit(UpdateAlatUkurFailed(error.toString()));
      }
    }
  }
}
