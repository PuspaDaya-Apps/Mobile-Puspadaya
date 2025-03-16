import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/alat_ukur_save_model.dart';

part 'get_alat_ukur_event.dart';
part 'get_alat_ukur_state.dart';

class GetAlatUkurBloc extends Bloc<GetAlatUkurEvent, GetAlatUkurState> {
  GetAlatUkurBloc() : super(GetAlatUkurProccessState()) {
    on<GetAlatUkurEvent>((event, emit) {});

    on<GetAlatUkurAnak>(getAlatUkurAnak);

    on<GetAlatUkurIbuHamil>(getAlatUkurIbuHamil);
  }

  Future<void> getAlatUkurAnak (GetAlatUkurAnak event, Emitter<GetAlatUkurState> emit) async {
    emit(GetAlatUkurProccessState());

    String? alatUkurAnakSave = await SharedPrefUtils().getAlatUkurAnak();

    if(alatUkurAnakSave != null) {
      AlatUkurSaveModel alatUkurAnak = AlatUkurSaveModel.fromJson(json.decode(alatUkurAnakSave));

      emit(GetAlatUkurAnakSuccessState(alatUkurAnak));
    } else {
      emit(GetAlatUkurAnakFailedState());
    }
  }

  Future<void> getAlatUkurIbuHamil (GetAlatUkurIbuHamil event, Emitter<GetAlatUkurState> emit) async {
    emit(GetAlatUkurProccessState());

    String? alatUkurIbuHamilSave = await SharedPrefUtils().getAlatUkurIbuHamil();

    if(alatUkurIbuHamilSave != null) {
      AlatUkurSaveModel alatUkurIbuHamil = AlatUkurSaveModel.fromJson(json.decode(alatUkurIbuHamilSave));

      emit(GetAlatUkurIbuHamilSuccessState(alatUkurIbuHamil));
    } else {
      emit(GetAlatUkurIbuHamilFailedState());
    }
  }
}
