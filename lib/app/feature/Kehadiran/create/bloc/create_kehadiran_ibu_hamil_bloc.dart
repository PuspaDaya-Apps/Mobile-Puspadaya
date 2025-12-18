import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_all_ibu_hamil_by_posyandu.dart';
import '../service/create_kehadiran_service.dart';

part 'create_kehadiran_ibu_hamil_event.dart';
part 'create_kehadiran_ibu_hamil_state.dart';

class CreateKehadiranIbuHamilBloc
    extends Bloc<CreateKehadiranIbuHamilEvent, CreateKehadiranIbuHamilState> {
  CreateKehadiranIbuHamilBloc() : super(CreateKehadiranIbuHamilInitial()) {
    on<CreateKehadiranIbuHamilEvent>((event, emit) {});
    on<CreateKehadiranEventFormIbuHamilLoaded>(formLoadedIbuHamil);
  }
  
  Future<void> formLoadedIbuHamil(CreateKehadiranEventFormIbuHamilLoaded event,
      Emitter<CreateKehadiranIbuHamilState> emit) async {
    emit(CreateKehadiranFormIbuHamilLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        // int? totalIbuHamil = await CreateKehadiranService()
        //     .getTotalItemIbuHamilPosyandu(accessToken);
        // logger.d('total ibu hamil : $totalIbuHamil');
        // if (totalIbuHamil == 0) {
        //   emit(CreateKehadiranFormIbuHamilEmpty());
        //   return;
        // }

        dynamic responseIbuHamil = await CreateKehadiranService().getAllIbuHamilByPosyandu(accessToken, 5000);
        int statusCodeIbuHamil = responseIbuHamil[0] as int;

        logger.d("succes get anak by posyandu");

        // ibu hamil by posyandu
        GetAllIbuHamilByPosyandu dataIbuHamil = GetAllIbuHamilByPosyandu.fromJson(responseIbuHamil[1]);

        logger.d("succes get ibu hamil by posyandu");
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);

        if (statusCodeIbuHamil == 200) {
          logger.d('succes get data anak ibu hamil');
          if(dataIbuHamil.data.isEmpty) {
            emit(CreateKehadiranFormIbuHamilEmpty());
            return;
          }

          //sorting data
          dataIbuHamil.data.sort((a, b) => a.namaIbu.compareTo(b.namaIbu));

          emit(
            CreateKeadiranFormIbuHamilSuccess(
              dataIbuHamil: dataIbuHamil,
            ),
          );
        } else if (statusCodeIbuHamil == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateKehadiranFormIbuHamilFailed(
              'error ibu Hamil : ${dataIbuHamil.message}'));
        }
      } catch (error) {
        emit(CreateKehadiranFormIbuHamilFailed(error.toString()));
      }
    }
  }

}
