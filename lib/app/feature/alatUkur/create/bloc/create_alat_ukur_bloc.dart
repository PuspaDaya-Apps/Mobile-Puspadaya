import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/alatUkur/create/model/post_alat_ukur_model.dart';
import 'package:puspadaya/app/feature/alatUkur/create/service/create_alat_ukur.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_alat_ukur_admin.dart';
import '../model/post_alat_ukur_alat_deteksi_dini_model.dart';

part 'create_alat_ukur_event.dart';
part 'create_alat_ukur_state.dart';

class CreateAlatUkurBloc
    extends Bloc<CreateAlatUkurEvent, CreateAlatUkurState> {
  CreateAlatUkurBloc() : super(CreateAlatUkurInitial()) {
    on<CreateAlatUkurEvent>((event, emit) {});
    on<GetAlatUkurAdmin>(getAllAlatUkurAdmin);
    on<PostAlatUkur>(postAlatUkurKader);
    on<PostAlatUkurAlatDini>(postAlatUkurKaderDeteksiDini);

  }
  Future<void> getAllAlatUkurAdmin(GetAlatUkurAdmin event,Emitter<CreateAlatUkurState> emit) async {
    emit(CreateAlatUkurInitialFormLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response =
            await CreateAlatUkur().getAllAlatUkurAdmin(accessToken);
        int statusCode = response[0] as int;
        // Assuming response[1] is a list of JSON objects
      List<GetAllAlatUkurAdmin> alatUkurAdminList = (response[1] as List)
          .map((item) => GetAllAlatUkurAdmin.fromJson(item))
          .toList();
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data alat ukur admin');
          emit(CreateAlatUkurInitialFormSuccess(alatUkurAdminList));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateAlatUkurInitialFormFailed("Terdapat Kesalahan Saat Mendapatkan Data Alat Ukur Admin"));
        }
      } catch (error) {
        emit(CreateAlatUkurInitialFormFailed(error.toString()));
      }
    }
  }
  Future<void> postAlatUkurKader (PostAlatUkur event,Emitter<CreateAlatUkurState> emit)async{
    emit(CreateAlatUkurPostLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response =
            await CreateAlatUkur().createAlatUkurKader(event.data ,accessToken);
        int statusCode = response[0] as int;
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 201) {
          logger.d('succes post data alat ukur kader');
          emit(CreateAlatUkurPostSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateAlatUkurPostFailed("Gagal Membuat Alat Ukur Kader"));
        }
      } catch (error) {
        emit(CreateAlatUkurPostFailed(error.toString()));
      }
    }
  }
// post alat ukur deteksi dini
  Future<void> postAlatUkurKaderDeteksiDini (PostAlatUkurAlatDini event,Emitter<CreateAlatUkurState> emit)async{
    emit(CreateAlatUkurPostLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response =
            await CreateAlatUkur().createAlatUkurKaderDeteksiDini(event.data,accessToken);
        int statusCode = response[0] as int;
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 201) {
          logger.d('succes post data alat ukur kader');
          emit(CreateAlatUkurPostSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateAlatUkurPostFailed("Gagal Membuat Alat Ukur Kader"));
        }
      } catch (error) {
        emit(CreateAlatUkurPostFailed(error.toString()));
      }
    }
  }
}
