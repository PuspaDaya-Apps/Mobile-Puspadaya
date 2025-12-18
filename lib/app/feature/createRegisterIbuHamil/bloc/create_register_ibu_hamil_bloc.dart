import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/createRegisterIbuHamil/model/post_ibu_hamil_model.dart';
import 'package:puspadaya/app/feature/registerOrangTua/model/get_all_orang_tua_response.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/error_post_ibu_hamil_model.dart';
import '../service/create_ibu_hamil.dart';

part 'create_register_ibu_hamil_event.dart';
part 'create_register_ibu_hamil_state.dart';

class CreateRegisterIbuHamilBloc
    extends Bloc<CreateRegisterIbuHamilEvent, CreateRegisterIbuHamilState> {
  CreateRegisterIbuHamilBloc() : super(CreateRegisterIbuHamilInitial()) {
    on<CreateRegisterIbuHamilEvent>((event, emit) {});
    on<FetchSearchIbuHamil>(fetchDetailIbuHamil);
    on<PostCreateIbuHamil>(postDetailIbuHamil);
  }
  Future<void> fetchDetailIbuHamil(FetchSearchIbuHamil event,
      Emitter<CreateRegisterIbuHamilState> emit) async {
    emit(CreateRegisterIbuHamilLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await CreateIbuHamil().getSearchIbuHamil(accessToken);

        int statusCode = response[0] as int;
        GetAllOrangTuaResponse dataIbuHamil = GetAllOrangTuaResponse.fromJson(response[1]);
        // logger.d(jadwalPosyandu.data[0].namaKegiatan);
        
        if (statusCode == 200) {
          //sorting data
          dataIbuHamil.data.sort((a, b) => a.ibu.namaIbu.compareTo(b.ibu.namaIbu));
          
          logger.d('succes get detail data ibu hamil');
          emit(CreateRegisterIbuHamilSuccess(data: dataIbuHamil));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(CreateRegisterIbuHamilFailed(message: dataIbuHamil.message));
        }
      } catch (error) {
        emit(CreateRegisterIbuHamilFailed(message: error.toString()));
      }
    }
  }

  Future<void> postDetailIbuHamil(PostCreateIbuHamil event,
      Emitter<CreateRegisterIbuHamilState> emit) async {
    emit(CreateRegisterIbuHamilLoading());

    try {
      // Cek akses token terlebih dahulu
      String? accessToken = await SharedPrefUtils().getAccessToken();
      if (accessToken == null) {
        emit(TokenExpiredState());
        return;
      }

      // Kirim request ke API
      dynamic response =
          await CreateIbuHamil().postCreateIbuHamil(accessToken, event.data);

      // Ambil status code dari response
      int statusCode = response[0] as int;
      dynamic responseBody = response[1];

      if (statusCode == 201) {
        logger.d('Success: Data Ibu Hamil berhasil dibuat.');
        emit(CreateRegisterIbuHamilSendSuccess());
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
        emit(CreateRegisterIbuHamilSendFailed(
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
      emit(CreateRegisterIbuHamilSendFailed(
        error: ErrorPostIbuHamilModel(
          message: 'Terjadi kesalahan: ${responseBody.toString()}',
          error: 'Unknown',
          statusCode: statusCode,
        ),
      ));
    } catch (e) {
      // Jika terjadi error parsing JSON atau kesalahan lainnya
      logger.e('Exception: $e');
      emit(CreateRegisterIbuHamilSendFailed(
        error: ErrorPostIbuHamilModel(
          message: 'Terjadi kesalahan saat memproses data',
          error: e.toString(),
          statusCode: 500,
        ),
      ));
    }
  }
}
