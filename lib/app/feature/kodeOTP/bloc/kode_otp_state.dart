part of 'kode_otp_bloc.dart';

sealed class KodeOtpState extends Equatable {
  const KodeOtpState();
  
  @override
  List<Object> get props => [];
}

final class KodeOtpInitial extends KodeOtpState {}

//!get OTP
final class GetOTPProcessState extends KodeOtpState {}

final class GetOTPSuccessState extends KodeOtpState {
  final LupaKataSandiResponseModel lupaKataSandiResponseModel;

  const GetOTPSuccessState(this.lupaKataSandiResponseModel);
}

final class GetOTPFailedState extends KodeOtpState {
  final String error;

  const GetOTPFailedState(this.error);
}

//!send OTP
final class SendOTPProcessState extends KodeOtpState {}

final class SendOTPSuccessState extends KodeOtpState {
  final KodeOtpResponseModel kodeOtpResponseModel;

  const SendOTPSuccessState(this.kodeOtpResponseModel);
}

final class SendOTPFailedState extends KodeOtpState {
  final String error;

  const SendOTPFailedState(this.error);
}
