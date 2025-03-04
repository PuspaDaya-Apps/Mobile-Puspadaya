import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/jadwal/index/service/index_jadwal_posyandu.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_all_jadwal_posyandu_model.dart';

part 'jadwal_index_event.dart';
part 'jadwal_index_state.dart';

class JadwalIndexBloc extends Bloc<JadwalIndexEvent, JadwalIndexState> {
  JadwalIndexBloc() : super(JadwalIndexInitial()) {
    on<JadwalIndexEvent>((event, emit) {});
    on<GetDataJadwalPosyanduEvent>(getDataJadwalPosyandu);
    on<DeleteJadwalPosyanduEvent>(deleteJadwalPosyandu); //
  }

  Future<void> getDataJadwalPosyandu(
      GetDataJadwalPosyanduEvent event, Emitter<JadwalIndexState> emit) async {
    emit(JadwalIndexLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response =
            await IndexJadwalPosyandu().getAllJadwalPosyandu(accessToken);
        int statusCode = response[0] as int;
        GetDataJadwalPosyandu jadwalPosyandu =
            GetDataJadwalPosyandu.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data jadwal posyandu');
          emit(JadwalIndexSuccess(jadwalPosyandu));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(JadwalIndexFailed(jadwalPosyandu.message));
        }
      } catch (error) {
        emit(JadwalIndexFailed(error.toString()));
      }
    }
  }

  Future<void> deleteJadwalPosyandu(
      DeleteJadwalPosyanduEvent event, Emitter<JadwalIndexState> emit) async {
    emit(DeleteJadwalPosyanduLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await IndexJadwalPosyandu().deleteJadwalPosyandu(
            accessToken, event.id); //delete jadwal posyandu
        int statusCode = response[0] as int;
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          // emit(DeleteJadwalPosyanduSuccess());
          logger.d('success delete posyandu and prepare get new data');
          //  / ✅ Emit state sukses agar BlocConsumer bisa menangkapnya
          emit(DeleteJadwalPosyanduSuccess());

          // ✅ Setelah sukses, langsung ambil data terbaru
          add(GetDataJadwalPosyanduEvent());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(JadwalIndexFailed("something When Wrong"));
        }
      } catch (error) {
        emit(JadwalIndexFailed(error.toString()));
      }
    }
  }
}
