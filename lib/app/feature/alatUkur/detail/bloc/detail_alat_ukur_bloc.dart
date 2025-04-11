import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/alatUkur/detail/view/detail_alat_ukur.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_alat_ukur_model.dart';
import '../service/detail_alat_ukur.dart';

part 'detail_alat_ukur_event.dart';
part 'detail_alat_ukur_state.dart';

class DetailAlatUkurBloc
    extends Bloc<DetailAlatUkurEvent, DetailAlatUkurState> {
  DetailAlatUkurBloc() : super(DetailAlatUkurInitial()) {
    on<DetailAlatUkurEvent>((event, emit) {});
    on<GetDetailAlatUkurEvent>(getDetailAlatUkur);
    on<DetailAlatUkurDeleteEvent>(deleteDetailAlatUkur);
  }
  Future<void> getDetailAlatUkur(
      GetDetailAlatUkurEvent event, Emitter<DetailAlatUkurState> emit) async {
    emit(DetailAlatUkurLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await DetailAlatUkurService()
            .getDetailAlatUkurPosyandu(
                event.id, accessToken); //delete jadwal posyandu
        int statusCode = response[0] as int;
        GetDetailAlatUkurKaderModel data =
            GetDetailAlatUkurKaderModel.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          // emit(DeleteJadwalPosyanduSuccess());
          logger.d('success get detail alat ukur');
          //  / ✅ Emit state sukses agar BlocConsumer bisa menangkapnya
          emit(DetailAlatUkurSuccess(data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DeleteAlatUkurFailed("Something When Wrong"));
        }
      } catch (error) {
        emit(DeleteAlatUkurFailed(error.toString()));
      }
    }
  }

  Future<void> deleteDetailAlatUkur(DetailAlatUkurDeleteEvent event,
      Emitter<DetailAlatUkurState> emit) async {
    emit(DeleteAlatUkurLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await DetailAlatUkurService()
            .deleteAlatUkurById(accessToken, event.id); //delete jadwal posyandu
        int statusCode = response[0] as int;
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          // emit(DeleteJadwalPosyanduSuccess());
          logger.d('success delete alat ukur');
          //  / ✅ Emit state sukses agar BlocConsumer bisa menangkapnya
          emit(DeleteAlatUkurSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else if (statusCode == 500) {
          logger.d('error delete alat ukur');
          emit(DeleteAlatUkurFailed(
              "Tidak Dapat Menghapus Alat Ukur, Karena Masih Digunakan"));
        } else {
          emit(DeleteAlatUkurFailed("something When Wrong"));
        }
      } catch (error) {
        if (error == "Internal server error") {
          emit(DeleteAlatUkurFailed("Tidak Dapat Menghapus Alat Ukur, Karena Masih Digunakan"));
        }
      }
    }
  }
}
