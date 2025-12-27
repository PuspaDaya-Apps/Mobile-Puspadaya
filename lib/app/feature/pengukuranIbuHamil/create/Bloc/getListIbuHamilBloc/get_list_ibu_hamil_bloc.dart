import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_list_ibu_hamil_response_model.dart';
import '../../service/create_pengukuran_ibu_hamil_api.dart';

part 'get_list_ibu_hamil_event.dart';
part 'get_list_ibu_hamil_state.dart';

class GetListIbuHamilBloc extends Bloc<GetListIbuHamilEvent, GetListIbuHamilState> {
  GetListIbuHamilBloc() : super(GetListIbuHamilInitial()) {
    on<GetListIbuHamilEvent>((event, emit) {});

    on<GetListIbuHamil>(getListIbuHamil);
  }

  Future<void> getListIbuHamil (GetListIbuHamil event, Emitter<GetListIbuHamilState> emit)async {
    emit(GetListIbuHamilProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(GetListIbuHamilTokenExpiredState());
    } else {
       try {
          List<dynamic> response = await CreatePengukuranIbuHamilApi().getIbuHamilService(accessToken);

          int statusCode = response[0] as int;
          final GetListIbuHamilResponseModel getListIbuHamilResponseModel = GetListIbuHamilResponseModel.fromJson(response[1]);

          if(statusCode == 200) {
            //sorting data
            getListIbuHamilResponseModel.data!.sort((a, b) => a.namaIbu.compareTo(b.namaIbu));

            emit(GetListIbuHamilSuccessState(getListIbuHamilResponseModel));
          } else if (statusCode == 401) {
            emit(GetListIbuHamilTokenExpiredState());
          } else {
            emit(GetListIbuHamilFailedState(getListIbuHamilResponseModel.message));
          }
        } catch (error) {
          emit(GetListIbuHamilFailedState(error.toString()));
        }
    }
  }
}
