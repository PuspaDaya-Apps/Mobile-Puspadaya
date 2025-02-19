import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/service/create_anak_api.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/generate_nik_model.dart';
import '../model/get_generate_nik_model.dart' as GetGenerateNikModel;

part 'generate_nik_state.dart';

class GenerateNikCubit extends Cubit<GenerateNikState> {
  GenerateNikCubit() : super(GenerateNikInitial());

  Future<void> getGenerateNik(String nomorKK, String tanggalLahir) async {
    emit(GenerateNikLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);
    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(GenerateNikLoading());
        GenerateNIKModel data = GenerateNIKModel(
            nomorKartuKeluarga: nomorKK, tanggalLahir: tanggalLahir);
        List<dynamic> response =
            await CreateAnakApi().getGenerateNik(accesTokenValue, data);
        int statusCode = response[0] as int;
        GetGenerateNikModel.GetGenerateNikModel dataGenerateNik =
            GetGenerateNikModel.GetGenerateNikModel.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 201) {
          emit(GenerateNikSuccess(
            data: dataGenerateNik,
          ));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(
            GenerateNikFailed(
              message: 'Gagal Membuat Generate NIK',
            ),
          );
        }
      } catch (e) {
        emit(
          GenerateNikFailed(
            message: e.toString(),
          ),
        );
      }
    }
  }
}
