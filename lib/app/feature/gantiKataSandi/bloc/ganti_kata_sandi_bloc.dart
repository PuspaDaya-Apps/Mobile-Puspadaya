import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/gantiKataSandi/service/ganti_kata_sandi_service.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/post_ganti_kata_sandi_model.dart';

part 'ganti_kata_sandi_event.dart';
part 'ganti_kata_sandi_state.dart';

class GantiKataSandiBloc
    extends Bloc<GantiKataSandiEvent, GantiKataSandiState> {
  GantiKataSandiBloc() : super(GantiKataSandiInitial()) {
    on<GantiKataSandiEvent>((event, emit) {});
    on<PostGantiKataSandiEvent>(postGantiKataSandi);
  }
  Future<void> postGantiKataSandi(
      PostGantiKataSandiEvent event, Emitter<GantiKataSandiState> emit) async {
    emit(GantiKataSandiLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();
    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await GantiKataSandiService()
            .gantiKataSandi(accessToken, event.data);
        int statusCode = response[0] as int;
        if (statusCode == 200) {
          emit(GantiKataSandiSuccess());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else if (statusCode == 404) {
          logger.d("old password salah");
          emit(GantiKataSandiFailed(response[1].toString()));
        } else {
          emit(GantiKataSandiFailed(response[1].toString()));
        }
      } catch (error) {
        emit(GantiKataSandiFailed(error.toString()));
      }
    }
  }
}
