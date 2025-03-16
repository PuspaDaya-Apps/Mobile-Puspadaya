import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_detail_riwayat_pengukuran_ibu_hamil_model.dart';
import '../service/detail_riwayat_ibu_hamil.dart';

part 'detail_riwayat_pengukuran_ibu_hamil_event.dart';
part 'detail_riwayat_pengukuran_ibu_hamil_state.dart';

class DetailRiwayatPengukuranIbuHamilBloc extends Bloc<DetailRiwayatPengukuranIbuHamilEvent, DetailRiwayatPengukuranIbuHamilState> {
  DetailRiwayatPengukuranIbuHamilBloc() : super(DetailRiwayatPengukuranIbuHamilInitial()) {
    on<DetailRiwayatPengukuranIbuHamilEvent>((event, emit) {});
    on<GetDetailRiwayatPengukuranIbuHamil>(getDetailRiwayatPengukuranIbuHamil);
  }


Future<void> getDetailRiwayatPengukuranIbuHamil(GetDetailRiwayatPengukuranIbuHamil event, Emitter<DetailRiwayatPengukuranIbuHamilState> emit) async {
    emit(DetailRiwayatPengukuranIbuHamilLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await DetailRiwayatIbuHamil().getDetailRiwayatPengukuranIbuHamil(event.id, accessToken);
        int statusCode = response[0] as int;
        final GetDetailRiwayatPengukuranIbuHamilModel data = GetDetailRiwayatPengukuranIbuHamilModel.fromJson(response[1]);
        if (statusCode == 200) {
          emit(DetailRiwayatPengukuranIbuHamilSuccess(data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(DetailRiwayatPengukuranIbuHamilFailed(data.message));
        }
      } catch (error) {
        emit(DetailRiwayatPengukuranIbuHamilFailed(error.toString()));
      }
    }
  }
}
