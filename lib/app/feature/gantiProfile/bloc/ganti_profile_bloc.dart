import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/gantiProfile/model/get_detail_user_by_id.dart';
import 'package:puspadaya/app/feature/gantiProfile/service/ganti_profile.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../model/current_user_model.dart' as CurrentUserModel;
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
          logger.d('succes ganti profile');
          String? currentUserValue = await SharedPrefUtils().getCurrentUser();
          String userId = "";
          CurrentUserModel.CurrentUserModel oldUser =
              CurrentUserModel.CurrentUserModel(
            id: '',
            alamatLengkap: '',
            tanggalLahir: '',
            rt: '',
            rw: '',
            namaLengkap: '',
            nomorTelepon: '',
            role: CurrentUserModel.RoleModel(id: '', namaRole: ''),
            posyandu: CurrentUserModel.PosyanduModel(id: '', namaPosyandu: ''),
            dusun: CurrentUserModel.Dusun(id: '', namaDusun: ''),
            desaKelurahan:
                CurrentUserModel.DesaKelurahan(id: '', namaDesaKelurahan: ''),
            kecamatan: CurrentUserModel.Kecamatan(id: '', namaKecamatan: ''),
            kabupatenKota:
                CurrentUserModel.KabupatenKota(id: '', namaKabupatenKota: ''),
            provinsi: CurrentUserModel.Provinsi(id: '', namaProvinsi: ''),
          );
          if (currentUserValue != null) {
            CurrentUserModel.CurrentUserModel oldUserInformation =
                CurrentUserModel.CurrentUserModel.fromJson(
                    json.decode(currentUserValue));
            userId = oldUserInformation.id;
            oldUser = oldUserInformation;
          }
          dynamic response =
              await GantiProfile().getDetailUserById(accessToken, userId);

          int statusCodeUpdateCurrentUser = response[0] as int;
          // get current user updated
          GetDetailUserByIdModel userProfile =
              GetDetailUserByIdModel.fromJson(response[1]);
          if (statusCodeUpdateCurrentUser == 200) {
            logger.d('succes get data current user');
            // set to current user model shared preferences
            CurrentUserModel.CurrentUserModel updatedUser =
                CurrentUserModel.CurrentUserModel(
              id: userProfile.data.id,
              alamatLengkap: userProfile.data.alamatLengkap,
              tanggalLahir: userProfile.data.tanggalLahir.toIso8601String(),
              rt: userProfile.data.rt,
              rw: userProfile.data.rw,
              namaLengkap: userProfile.data.namaLengkap,
              nomorTelepon: userProfile.data.nomorTelepon,
              role: CurrentUserModel.RoleModel(
                id: userProfile.data.role.id,
                namaRole: userProfile.data.role.namaRole,
              ),
              posyandu: CurrentUserModel.PosyanduModel(
                id: oldUser.posyandu.id,
                namaPosyandu: userProfile.data.posyandu.namaPosyandu,
              ),
              dusun: CurrentUserModel.Dusun(
                id: userProfile.data.dusun.id,
                namaDusun: userProfile.data.dusun.namaDusun,
              ),
              desaKelurahan: CurrentUserModel.DesaKelurahan(
                id: userProfile.data.dusun.desaKelurahan.id,
                namaDesaKelurahan:
                    userProfile.data.dusun.desaKelurahan.namaDesaKelurahan,
              ),
              kecamatan: CurrentUserModel.Kecamatan(
                id: userProfile.data.dusun.desaKelurahan.kecamatan.id,
                namaKecamatan: userProfile
                    .data.dusun.desaKelurahan.kecamatan.namaKecamatan,
              ),
              kabupatenKota: CurrentUserModel.KabupatenKota(
                id: userProfile
                    .data.dusun.desaKelurahan.kecamatan.kabupatenKota.id,
                namaKabupatenKota: userProfile.data.dusun.desaKelurahan
                    .kecamatan.kabupatenKota.namaKabupatenKota,
              ),
              provinsi: CurrentUserModel.Provinsi(
                id: userProfile.data.dusun.desaKelurahan.kecamatan.kabupatenKota
                    .provinsi.id,
                namaProvinsi: userProfile.data.dusun.desaKelurahan.kecamatan
                    .kabupatenKota.provinsi.namaProvinsi,
              ),
            );
            final String updatedUserJson = jsonEncode(updatedUser);
            SharedPrefUtils().removeCurrentUser();
            SharedPrefUtils().storedCurrentUser(updatedUserJson);
            logger.d('updated user ${updatedUser.toJson()}');
          }
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
          logger.d('succes get data current user');
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
