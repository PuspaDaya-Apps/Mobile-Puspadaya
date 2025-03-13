import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/alat_ukur_save_model.dart';

part 'get_alat_ukur_state.dart';

class GetAlatUkurCubit extends Cubit<GetAlatUkurState> {
  GetAlatUkurCubit() : super(GetAlatUkurProccessState());

  Future<void> getAlatUkurAnak () async {
    emit(GetAlatUkurProccessState());

    String? alatUkurValue = await SharedPrefUtils().getAlatUkurAnak();

    if(alatUkurValue != null) {
      AlatUkurSaveModel alatUkur = AlatUkurSaveModel.fromJson(json.decode(alatUkurValue));

      emit(GetAlatUkurAnakSuccessState(alatUkur));
    } else {
      emit(GetAlatUkurAnakFailedState());
    }
  }

  Future<void> getAlatUkurIbuHamil () async {
    emit(GetAlatUkurProccessState());

    String? alatUkurValue = await SharedPrefUtils().getAlatUkurIbuHamil();

    if(alatUkurValue != null) {
      AlatUkurSaveModel alatUkur = AlatUkurSaveModel.fromJson(json.decode(alatUkurValue));

      emit(GetAlatUkurIbuHamilSuccessState(alatUkur));
    } else {
      emit(GetAlatUkurIbuHamilFailedState());
    }
  }
}
