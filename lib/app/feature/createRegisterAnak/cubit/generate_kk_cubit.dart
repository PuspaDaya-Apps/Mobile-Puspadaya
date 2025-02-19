import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/generate_kk_model.dart';
import '../model/get_generate_kk_model.dart' as GetGenerateKKModel;
import '../service/create_anak_api.dart';

part 'generate_kk_state.dart';

class GenerateKkCubit extends Cubit<GenerateKkState> {
  GenerateKkCubit() : super(GenerateKkInitial());
  Future<void> getGenerateKK(String provinsiId, String kabupatenId,
      String kecamatanId, String tanggalLahir) async {
    emit(GenerateKKLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);
    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        emit(GenerateKKLoading());
        GenerateKKModel data = GenerateKKModel(
            provinsiId: provinsiId,
            kabupatenKotaId: kabupatenId,
            kecamatanId: kecamatanId,
            tanggalLahir: tanggalLahir);
        List<dynamic> response =
            await CreateAnakApi().getGenerateKK(accesTokenValue, data);
        int statusCode = response[0] as int;
        GetGenerateKKModel.GetGenerateKKModel dataGenerateKK =
            GetGenerateKKModel.GetGenerateKKModel.fromJson(response[1]);
        logger.d('statusCode ${statusCode}');
        if (statusCode == 201) {
          emit(GenerateKKSuccess(
            data: dataGenerateKK,
          ));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(
            GenerateKKFailed(
              message: 'Gagal Membuat Generate KK',
            ),
          );
        }
      } catch (e) {
        emit(
          GenerateKKFailed(
            message: e.toString(),
          ),
        );
      }
    }
  }
}
