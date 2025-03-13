import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/alat_ukur_save_model.dart';

part 'save_alat_ukur_event.dart';
part 'save_alat_ukur_state.dart';

class SaveAlatUkurBloc extends Bloc<SaveAlatUkurEvent, SaveAlatUkurState> {
  SaveAlatUkurBloc() : super(SaveAlatUkurInitial()) {
    on<SaveAlatUkurEvent>((event, emit) {});

    on<SaveAlatUkurAnak>(saveAlatUkurAnak);

    on<SaveAlatUkurIbuHamil>(saveAlatUkurIbuHamil);
  }

  Future<void> saveAlatUkurAnak (SaveAlatUkurAnak event, Emitter<SaveAlatUkurState> emit) async {
    emit(SaveAlatUkurAnakProccessState()); 

    try {
      SharedPrefUtils().storedAlatUkurAnak(json.encode(event.alatUkurAnak.toJson()));

      emit(SaveAlatUkurAnakSuccessState());
    } catch (error) {
      logger.e(error);

      emit(const SaveAlatUkurAnakFailedState("Gagal Menyimpan ALat Ukur Anak"));
    }
  }

  Future<void> saveAlatUkurIbuHamil (SaveAlatUkurIbuHamil event, Emitter<SaveAlatUkurState> emit) async {
    emit(SaveAlatUkurIbuHamilProccessState()); 

    try {
      SharedPrefUtils().storedAlatUkurIbuHamil(json.encode(event.alatUkurIbuHamil.toJson()));

      emit(SaveAlatUkurIbuHamilSuccessState());
    } catch (error) {
      logger.e(error);

      emit(const SaveAlatUkurIbuHamilFailedState("Gagal Menyimpan ALat Ukur Ibu Hamil"));
    }
  }
}
