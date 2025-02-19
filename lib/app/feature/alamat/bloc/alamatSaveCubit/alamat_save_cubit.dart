import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/data_wilayah_model.dart';

part 'alamat_save_state.dart';

class AlamatSaveCubit extends Cubit<AlamatSaveState> {
  AlamatSaveCubit() : super(AlamatSaveInitial());

  Future<void> getDataWilayah () async {
    emit(GetAlamatProccessState());

    String? dataWilayah = await SharedPrefUtils().getDataWilayah();

    if(dataWilayah != null) {
      final DataWilayahModel dataWilayahModel = DataWilayahModel.fromJson(json.decode(dataWilayah));

      emit(GetAlamatSuccessState(dataWilayahModel));
    } else {
      emit(GetAlamatFailedState());
    }
  }
}
