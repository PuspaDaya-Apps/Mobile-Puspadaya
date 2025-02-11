import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/lupa_kata_sandi_model.dart';
import '../../model/lupa_kata_sandi_response_model.dart';
import '../../service/login_api.dart';

part 'lupa_kata_sandi_event.dart';
part 'lupa_kata_sandi_state.dart';

class LupaKataSandiBloc extends Bloc<LupaKataSandiEvent, LupaKataSandiState> {
  LupaKataSandiBloc() : super(LupaKataSandiInitial()) {
    on<LupaKataSandiEvent>((event, emit) {});

    on<SendLupakataSandi>(lupaKataSandi);
  }

  Future<void> lupaKataSandi (SendLupakataSandi event, Emitter<LupaKataSandiState> emit) async {
    emit(LupaKataSandiProcessState());

    try {
      List<dynamic> response = await LoginApi().lupaKataSandiService(event.lupaKataSandiModel);

      int statusCode = response[0] as int;
      final LupaKataSandiResponseModel lupaKataSandiResponseModel = LupaKataSandiResponseModel.fromJson(response[1]);

      if(statusCode == 200) {
        emit(LupaKataSandiSuccessState(lupaKataSandiResponseModel));
      } else if (statusCode == 401) {
        emit(LupaKataSandiTokenExpiredState());
      } else {
        emit(LupaKataSandiFailedState(lupaKataSandiResponseModel.message));
      }
    } catch (error) {
      debugPrint(error.toString());
      emit(LupaKataSandiFailedState(error.toString()));
    } 
  }
  
}
