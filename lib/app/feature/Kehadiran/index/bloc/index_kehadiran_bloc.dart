import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/Kehadiran/index/model/get_index_kehadiran_model.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../service/index_kehadiran_service.dart';

part 'index_kehadiran_event.dart';
part 'index_kehadiran_state.dart';

class IndexKehadiranBloc
    extends Bloc<IndexKehadiranEvent, IndexKehadiranState> {
  IndexKehadiranBloc() : super(IndexKehadiranInitial()) {
    on<IndexKehadiranEvent>((event, emit) {});
    on<GetIndexKehadiranEvent>(getIndexKehadiranEvent);
  }

  Future<void> getIndexKehadiranEvent(GetIndexKehadiranEvent event,
      Emitter<IndexKehadiranState> emit) async {
    emit(IndexKehadiranLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await IndexKehadiranService()
            .getAllKehadiran(accessToken);
        int statusCode = response[0] as int;
        GetIndexKehadiranModel data =
            GetIndexKehadiranModel.fromJson(response[1]);

        if (statusCode == 200) {
          logger.d('succes get data riwayat faktor resiko');
          emit(IndexKehadiranSuccess(data));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexKehadiranFailed(data.message));
        }
      } catch (error) {
        emit(IndexKehadiranFailed(error.toString()));
      }
    }
  }

}
