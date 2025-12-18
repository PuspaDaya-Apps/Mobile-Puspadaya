import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../create/model/get_all_ibu_hamil_by_posyandu.dart';
import '../../create/service/create_kehadiran_service.dart';

part 'update_kehadiran_ibu_hamil_event.dart';
part 'update_kehadiran_ibu_hamil_state.dart';

class UpdateKehadiranIbuHamilBloc
    extends Bloc<UpdateKehadiranIbuHamilEvent, UpdateKehadiranIbuHamilState> {
  UpdateKehadiranIbuHamilBloc() : super(UpdateKehadiranIbuHamilInitial()) {
    on<UpdateKehadiranIbuHamilEvent>((event, emit) {});
    on<UpdateKehadiranEventFormIbuHamilLoaded>(formIbuHamilLoaded);
  }
  Future<void> formIbuHamilLoaded(UpdateKehadiranEventFormIbuHamilLoaded event, Emitter<UpdateKehadiranIbuHamilState> emit) async {
    emit(UpdateKehadiranFormIbuHamilLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        int? totalIbuHamil = await CreateKehadiranService().getTotalItemIbuHamilPosyandu(accessToken);
        
        if(totalIbuHamil == 0){
          emit(UpdateKehadiranFormIbuHamilEmpty());
          return;
        }

        dynamic responseIbuHamil = await CreateKehadiranService().getAllIbuHamilByPosyandu(accessToken, totalIbuHamil!);
        int statusCodeIbuHamil = responseIbuHamil[0] as int;
        
        // ibu hamil by posyandu
        GetAllIbuHamilByPosyandu dataIbuHamil = GetAllIbuHamilByPosyandu.fromJson(responseIbuHamil[1]);
        logger.d("succes get ibu hamil by posyandu");
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        if (statusCodeIbuHamil == 200) {
          //sorting data
          dataIbuHamil.data.sort((a, b) => a.namaIbu.compareTo(b.namaIbu));

          logger.d('succes get data anak ibu hamil');
          emit(UpdateKehadiranFormIbuHamilSuccess(
              dataIbuHamil: dataIbuHamil));
        } else if ( statusCodeIbuHamil == 401) {
          emit(TokenExpiredState());
        } else {
          emit(UpdateKehadiranFormIbuHamilFailed(
              ' error ibu Hamil : ${dataIbuHamil.message}'));
        }
      } catch (error) {
        emit(UpdateKehadiranFormIbuHamilFailed(error.toString()));
      }
    }
  }
}
