import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/alatUkur/index/service/index_alat_ukur.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_all_alat_ukur.dart';

part 'index_alat_ukur_event.dart';
part 'index_alat_ukur_state.dart';

class IndexAlatUkurBloc extends Bloc<IndexAlatUkurEvent, IndexAlatUkurState> {
  IndexAlatUkurBloc() : super(IndexAlatUkurInitial()) {
    on<IndexAlatUkurEvent>((event, emit) {});
    on<GetIndexAlatUkurKader>(getIndexAlatUkurKader);
  }
  Future<void> getIndexAlatUkurKader(GetIndexAlatUkurKader event,Emitter<IndexAlatUkurState> emit ) async{
    emit(IndexAlatUkurLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response =
            await IndexAlatUkur().getIndexAlatUkurKader(accessToken);
        int statusCode = response[0] as int;
        GetAllAlatUkur alatUkur =
            GetAllAlatUkur.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCode == 200) {
          logger.d('succes get data alat ukur');
          emit(IndexAlatUkurSuccess(alatUkur));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexAlatUkurFailed(alatUkur.message));
        }
      } catch (error) {
        emit(IndexAlatUkurFailed(error.toString()));
      }
    }
  }
}
