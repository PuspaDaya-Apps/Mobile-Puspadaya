import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/updateRegisterIbuHamil/service/update_ibu_hamil.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../createRegisterIbuHamil/model/error_post_ibu_hamil_model.dart';
import '../model/update_ibu_hamil_model.dart';

part 'update_register_ibu_hamil_event.dart';
part 'update_register_ibu_hamil_state.dart';

class UpdateRegisterIbuHamilBloc
    extends Bloc<UpdateRegisterIbuHamilEvent, UpdateRegisterIbuHamilState> {
  UpdateRegisterIbuHamilBloc() : super(UpdateRegisterIbuHamilInitial()) {
    on<UpdateRegisterIbuHamilEvent>((event, emit) {});
    on<PatchUpdateRegisterIbuHamil>(postDetailIbuHamil);
  }

  Future<void> postDetailIbuHamil(PatchUpdateRegisterIbuHamil event,Emitter<UpdateRegisterIbuHamilState> emit) async {
    emit(UpdateRegisterIbuHamilLoading());

    try {
      // Cek akses token terlebih dahulu
      String? accessToken = await SharedPrefUtils().getAccessToken();
      if (accessToken == null) {
        emit(TokenExpiredState());
        return;
      } 

      // Kirim request ke API
      dynamic response = await UpdateIbuHamil()
          .patchRegisterOrangTua(accessToken, event.data, event.id);

      // Ambil status code dari response
      int statusCode = response[0] as int;
      dynamic responseBody = response[1];

      if (statusCode == 200) {
        logger.d('Success: Data Ibu Hamil berhasil diperbarui.');
        emit(UpdateRegisterIbuHamilSendSuccess());
        return;
      }

      // Jika token expired
      if (statusCode == 401) {
        logger.d('Error 401: Token Expired');
        emit(TokenExpiredState());
        return;
      }

      // Jika terjadi error dari API (misalnya data sudah ada, format salah, dll.)
      if (statusCode == 400) {
        logger.d('Error 400: Data Ibu Hamil Sudah Terdaftar');
        emit(UpdateRegisterIbuHamilFailed(
          error: ErrorPostIbuHamilModel(
            message: 'Ibu Hamil Sudah Terdaftar',
            error: 'NIK',
            statusCode: 400,
          ),
        ));
        return;
      }

      // Jika status error lain (403, 404, 500, dll.)
      logger.d('Error $statusCode: ${responseBody.toString()}');
      emit(UpdateRegisterIbuHamilFailed(
        error: ErrorPostIbuHamilModel(
          message: 'Terjadi kesalahan: ${responseBody.toString()}',
          error: 'Unknown',
          statusCode: statusCode,
        ),
      ));
    } catch (e) {
      // Jika terjadi error parsing JSON atau kesalahan lainnya
      logger.e('Exception: $e');
      emit(UpdateRegisterIbuHamilFailed(
        error: ErrorPostIbuHamilModel(
          message: 'Terjadi kesalahan saat memproses data',
          error: e.toString(),
          statusCode: 500,
        ),
      ));
    }
  }
}
