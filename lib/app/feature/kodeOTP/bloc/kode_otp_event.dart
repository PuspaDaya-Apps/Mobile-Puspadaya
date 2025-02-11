part of 'kode_otp_bloc.dart';

sealed class KodeOtpEvent extends Equatable {
  const KodeOtpEvent();

  @override
  List<Object> get props => [];
}

final class SendOTP extends KodeOtpEvent {
  final KodeOtpModel codeOTP;
  
  const SendOTP(this.codeOTP);
}

final class GetOTP extends KodeOtpEvent {
  final LupaKataSandiModel nomorTelepon;
  
  const GetOTP(this.nomorTelepon);
}