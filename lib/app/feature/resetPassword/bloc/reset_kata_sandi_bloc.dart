import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/reset_kata_sandi_model.dart';
import '../model/reset_kata_sandi_response_model.dart';
import '../service/reset_kata_sandi_api.dart';

part 'reset_kata_sandi_event.dart';
part 'reset_kata_sandi_state.dart';

class ResetKataSandiBloc extends Bloc<ResetKataSandiEvent, ResetKataSandiState> {
  ResetKataSandiBloc() : super(ResetKataSandiInitial()) {
    on<ResetKataSandiEvent>((event, emit) {});

    on<ResetKataSandi>(resetKataSandi);
  }

  Future<void> resetKataSandi (ResetKataSandi event, Emitter<ResetKataSandiState> emit) async {
    emit(ResetKataSandiProcessState());

    try {
      List<dynamic> response = await ResetKataSandiApi().resetKataSandiService(event.resetKataSandiModel);

      int statusCode = response[0] as int;
      final ResetKataSandiResponseModel kodeOtpResponseModel = ResetKataSandiResponseModel.fromJson(response[1]);

      if(statusCode == 200) {
        emit(ResetKataSandiSuccessState(kodeOtpResponseModel));
      }  else {
        emit(ResetKataSandiFailedState(kodeOtpResponseModel.message));
      }
    } catch (error) {
      debugPrint(error.toString());
      emit(ResetKataSandiFailedState(error.toString()));
    } 
  }
}
