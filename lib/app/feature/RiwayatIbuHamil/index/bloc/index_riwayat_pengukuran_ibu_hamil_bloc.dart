import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_index_riwayat_pengukuran_ibu_hamil_model.dart';
import '../service/index_riwayat_pengukuran_ibu_hamil.dart';

part 'index_riwayat_pengukuran_ibu_hamil_event.dart';
part 'index_riwayat_pengukuran_ibu_hamil_state.dart';

class IndexRiwayatPengukuranIbuHamilBloc extends Bloc<
    IndexRiwayatPengukuranIbuHamilEvent, IndexRiwayatPengukuranIbuHamilState> {
  IndexRiwayatPengukuranIbuHamilBloc()
      : super(IndexRiwayatPengukuranIbuHamilInitial()) {
    on<IndexRiwayatPengukuranIbuHamilEvent>((event, emit) {});
    on<GetIndexRiwayatPengukuranIbuHamil>(getIndexRiwayatPengukuranIbuHamil);
  }
  Future<void> getIndexRiwayatPengukuranIbuHamil(GetIndexRiwayatPengukuranIbuHamil event, Emitter<IndexRiwayatPengukuranIbuHamilState> emit) async {
    emit(IndexRiwayatPengukuranIbuHamilLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexRiwayatPengukuranIbuHamil().getIndexRiwayatPengukuranIbuHamil(accessToken);
        int statusCode = response[0] as int;
        final GetIndexRiwayatPengukuranIbuHamilModel data = GetIndexRiwayatPengukuranIbuHamilModel.fromJson(response[1]);
        if (statusCode == 200) {
          emit(IndexRiwayatPengukuranIbuHamilSuccess(data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexRiwayatPengukuranIbuHamilFailed(data.message));
        }
      } catch (error) {
        emit(IndexRiwayatPengukuranIbuHamilFailed(error.toString()));
      }
    }
  }
}
