import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/index_pengukuran_ibu_hamil_response_model.dart';
import '../service/index_pengukuran_ibu_hamil_api.dart';

part 'index_pengukuran_ibu_hamil_event.dart';
part 'index_pengukuran_ibu_hamil_state.dart';

class IndexPengukuranIbuHamilBloc extends Bloc<IndexPengukuranIbuHamilEvent, IndexPengukuranIbuHamilState> {
  IndexPengukuranIbuHamilBloc() : super(IndexPengukuranIbuHamilInitial()) {
    on<IndexPengukuranIbuHamilEvent>((event, emit) {});

    on<GetPengukuranIbuHamilEvent>(getPengukuranIbuHamil);
  }

  Future<void> getPengukuranIbuHamil (GetPengukuranIbuHamilEvent event, Emitter<IndexPengukuranIbuHamilState> emit) async {
    emit(IndexPengukuranIbuHamilProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(IndexPengukuranIbuHamilTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexPengukuranIbuHamilApi().getpengukuranIbuHamilService(accessToken);

        int statusCode = response[0] as int;
        final IndexPengukuranIbuHamilResponseModel indexPengukuranIbuHamilResponseModel = IndexPengukuranIbuHamilResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(IndexPengukuranIbuHamilSuccessState(indexPengukuranIbuHamilResponseModel));
        } else if (statusCode == 401) {
          emit(IndexPengukuranIbuHamilTokenExpiredState());
        } else {
          emit(IndexPengukuranIbuHamilFailedState(indexPengukuranIbuHamilResponseModel.message));
        }
      } catch (error) {
        emit(IndexPengukuranIbuHamilFailedState(error.toString()));
      }
    }
  }
}
