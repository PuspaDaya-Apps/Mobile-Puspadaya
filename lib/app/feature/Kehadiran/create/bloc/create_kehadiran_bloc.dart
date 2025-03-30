import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/model/get_all_anak_by_posyadu.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/model/get_all_ibu_hamil_by_posyandu.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/service/create_kehadiran_service.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/post_create_kehadiran_model.dart';

part 'create_kehadiran_event.dart';
part 'create_kehadiran_state.dart';

class CreateKehadiranBloc
    extends Bloc<CreateKehadiranEvent, CreateKehadiranState> {
  CreateKehadiranBloc() : super(CreateKehadiranInitial()) {
    on<CreateKehadiranEvent>((event, emit) {});
    on<CreateKehadiranEventFormLoaded>(formLoaded);
    on<CreateKehadiranEventSubmit>(createKehadiranSubmit);
  }

  Future<void> formLoaded(CreateKehadiranEventFormLoaded event,
      Emitter<CreateKehadiranState> emit) async {
    emit(CreateKehadiranFormLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        int? totalAnak = await CreateKehadiranService()
            .getTotalItemAnakPosyandu(accessToken);
        int? totalIbuHamil = await CreateKehadiranService()
            .getTotalItemIbuHamilPosyandu(accessToken);

        dynamic responseAnak = await CreateKehadiranService()
            .getAllAnakByPosyandu(accessToken, totalAnak!);

        dynamic responseIbuHamil = await CreateKehadiranService()
            .getAllIbuHamilByPosyandu(accessToken, totalIbuHamil!);
        int statusCodeAnak = responseAnak[0] as int;
        int statusCodeIbuHamil = responseIbuHamil[0] as int;
        // anak by posyandu
        GetAllAnakByPosyandu dataAnak =
            GetAllAnakByPosyandu.fromJson(responseAnak[1]);
        logger.d("succes get anak by posyandu");
        // ibu hamil by posyandu
        GetAllIbuHamilByPosyandu dataIbuHamil =
            GetAllIbuHamilByPosyandu.fromJson(responseIbuHamil[1]);
        logger.d("succes get ibu hamil by posyandu");
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCodeAnak == 200 && statusCodeIbuHamil == 200) {
          logger.d('succes get data anak ibu hamil');
          emit(CreateKeadiranFormSuccess(
              dataAnak: dataAnak, dataIbuHamil: dataIbuHamil));
        } else if (statusCodeAnak == 401 || statusCodeIbuHamil == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateKehadiranFormFailed(
              'error anak : ${dataAnak.message}, error ibu Hamil : ${dataIbuHamil.message}'));
        }
      } catch (error) {
        emit(CreateKehadiranFormFailed(error.toString()));
      }
    }
  }

  Future<void> createKehadiranSubmit(CreateKehadiranEventSubmit event,
      Emitter<CreateKehadiranState> emit) async {
    emit(CreateKehadiranSubmitLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await CreateKehadiranService()
            .postKehadiran(event.data, accessToken);
        int statusCode = response[0] as int;
        logger.d("succes get ibu hamil by posyandu");
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 201) {
          logger.d('succes post data kehadiran');
          emit(CreateKehadiranSubmitSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateKehadiranSubmitFailed(
              'error: Kehadiran posyandu Pada Hari Tersebut sudah ada'));
        }
      } catch (error) {
        emit(CreateKehadiranSubmitFailed(error.toString()));
      }
    }
  }
}
