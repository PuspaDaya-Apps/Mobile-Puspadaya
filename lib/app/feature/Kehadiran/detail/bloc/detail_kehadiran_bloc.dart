import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_kehadiran_model.dart';
import '../service/get_detail_kehadiran_service.dart';

part 'detail_kehadiran_event.dart';
part 'detail_kehadiran_state.dart';

class DetailKehadiranBloc
    extends Bloc<DetailKehadiranEvent, DetailKehadiranState> {
  DetailKehadiranBloc() : super(DetailKehadiranInitial()) {
    on<DetailKehadiranEvent>((event, emit) {});
    on<GetDetailKehadiranEvent>(getDetailKehadiran);
    on<DeleteKehadiranEvent>(deleteKehadiran);
  }

  Future<void> getDetailKehadiran(
      GetDetailKehadiranEvent event, Emitter<DetailKehadiranState> emit) async {
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(DetailKehadiranLoading());
        logger.d('id = ${event.id}');
        dynamic response = await GetDetailKehadiranService()
            .getDetailKehadiran(event.id, accessToken);
        GetDetailKehadiranModel data =
            GetDetailKehadiranModel.fromJson(response[1]);
        int statusCode = response[0] as int;
        if (statusCode == 200) {
          logger.d('succesfull get data detail jadwal $data');
          emit(DetailKehadiranSuccess(data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailKehadiranFailed(response[1].toString()));
        }
      } catch (error) {
        emit(DetailKehadiranFailed(error.toString()));
      }
    }
  }

  Future<void> deleteKehadiran(
      DeleteKehadiranEvent event, Emitter<DetailKehadiranState> emit) async {
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(DeleteKehadiranLoading());
        logger.d('id = ${event.id}');
        dynamic response = await GetDetailKehadiranService()
            .deleteKehadiran(accessToken, event.id);
        int statusCode = response[0] as int;
        if (statusCode == 200) {
          logger.d('succesfull delete kehadiran');
          emit(DeleteKehadiranSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailKehadiranFailed(response[1].toString()));
        }
      } catch (error) {
        emit(DetailKehadiranFailed(error.toString()));
      }
    }
  }
}
