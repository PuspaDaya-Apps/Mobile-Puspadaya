import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_index_riwayat_pengukuran_anak_model.dart';
import '../service/index_riwayat_pengukuran_anak.dart';

part 'index_riwayat_pengukuran_anak_event.dart';
part 'index_riwayat_pengukuran_anak_state.dart';

class IndexRiwayatPengukuranAnakBloc extends Bloc<IndexRiwayatPengukuranAnakEvent, IndexRiwayatPengukuranAnakState> {
  IndexRiwayatPengukuranAnakBloc() : super(IndexRiwayatPengukuranAnakInitial()) {
    on<IndexRiwayatPengukuranAnakEvent>((event, emit) {});
    on<GetIndexRiwayatPengukuranAnak>(getIndexRiwayatPengukuranAnak);
  }
  Future<void> getIndexRiwayatPengukuranAnak(GetIndexRiwayatPengukuranAnak event, Emitter<IndexRiwayatPengukuranAnakState> emit) async {
    emit(IndexRiwayatPengukuranAnakLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexRiwayatPengukuranAnak().getIndexRiwayatPengukuranAnak(accessToken);
        int statusCode = response[0] as int;
        final GetIndexRiwayatPengukuranAnakModel data = GetIndexRiwayatPengukuranAnakModel.fromJson(response[1]);
        if (statusCode == 200) {
          emit(IndexRiwayatPengukuranAnakSuccess(data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexRiwayatPengukuranAnakFailed(data.message));
        }
      } catch (error) {
        emit(IndexRiwayatPengukuranAnakFailed(error.toString()));
      }
    }
  }
}
