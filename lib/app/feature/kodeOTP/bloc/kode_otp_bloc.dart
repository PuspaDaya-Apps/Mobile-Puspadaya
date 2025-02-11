import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../login/model/lupa_kata_sandi_model.dart';
import '../../login/model/lupa_kata_sandi_response_model.dart';
import '../model/kode_otp_model.dart';
import '../model/kode_otp_response_model.dart';
import '../service/kode_otp_api.dart';

part 'kode_otp_event.dart';
part 'kode_otp_state.dart';

class KodeOtpBloc extends Bloc<KodeOtpEvent, KodeOtpState> {
  KodeOtpBloc() : super(KodeOtpInitial()) {
    on<KodeOtpEvent>((event, emit) {});

    on<SendOTP>(sendOTP);

    on<GetOTP>(getOTP);
  }

  Future<void> sendOTP (SendOTP event, Emitter<KodeOtpState> emit) async {
    emit(SendOTPProcessState());

    try {
      List<dynamic> response = await KodeOtpApi().sendKodeOtpService(event.codeOTP);

      int statusCode = response[0] as int;
      final KodeOtpResponseModel kodeOtpResponseModel = KodeOtpResponseModel.fromJson(response[1]);

      if(statusCode == 200) {
        emit(SendOTPSuccessState(kodeOtpResponseModel));
      }  else {
        emit(SendOTPFailedState(kodeOtpResponseModel.message));
      }
    } catch (error) {
      debugPrint(error.toString());
      emit(SendOTPFailedState(error.toString()));
    } 
  }

  Future<void> getOTP (GetOTP event, Emitter<KodeOtpState> emit) async {
    emit(GetOTPProcessState());

    try {
      List<dynamic> response = await KodeOtpApi().lupaKataSandiService(event.nomorTelepon);

      int statusCode = response[0] as int;
      final LupaKataSandiResponseModel lupaKataSandiResponseModel = LupaKataSandiResponseModel.fromJson(response[1]);

      if(statusCode == 200) {
        emit(GetOTPSuccessState(lupaKataSandiResponseModel));
      } else {
        emit(GetOTPFailedState(lupaKataSandiResponseModel.message));
      }
    } catch (error) {
      debugPrint(error.toString());
      emit(GetOTPFailedState(error.toString()));
    } 
  }
}
