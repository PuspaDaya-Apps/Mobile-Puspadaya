import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/gantiProfile/model/get_detail_user_by_id.dart';
import 'package:puspadaya/app/feature/gantiProfile/service/ganti_profile.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/patch_ganti_profile.dart';

part 'ganti_profile_event.dart';
part 'ganti_profile_state.dart';

class GantiProfileBloc extends Bloc<GantiProfileEvent, GantiProfileState> {
  GantiProfileBloc() : super(GantiProfileInitial()) {
    on<GantiProfileEvent>((event, emit) {});
    on<PatchGantiProfile>(patchGantiProfile);
    on<GetDetailUser>(getDetailProfile);
  }

  Future<void> patchGantiProfile(
      PatchGantiProfile event, Emitter<GantiProfileState> emit) async {
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(GantiProfileLoading());
        dynamic response =
            await GantiProfile().patchGantiProfile(accessToken, event.data);
        int statusCode = response[0] as int;
        if (statusCode == 200) {
          emit(GantiProfileSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(GantiProfileFailed(response[1].toString()));
        }
      } catch (error) {
        emit(GantiProfileFailed(error.toString()));
      }
    }
  }

  Future<void> getDetailProfile(
      GetDetailUser event, Emitter<GantiProfileState> emit) async {
    emit(GantiProfileFormLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response =
            await GantiProfile().getDetailUserById(accessToken, event.userId);
        int statusCode = response[0] as int;
        GetDetailUserByIdModel userProfile =
            GetDetailUserByIdModel.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data jadwal posyandu');
          emit(GantiProfileFormSuccess(userProfile));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(GantiProfileFormFailed(userProfile.message));
        }
      } catch (error) {
        emit(GantiProfileFormFailed(error.toString()));
      }
    }
  }
}
