part of 'reset_kata_sandi_bloc.dart';

sealed class ResetKataSandiEvent extends Equatable {
  const ResetKataSandiEvent();

  @override
  List<Object> get props => [];
}

final class ResetKataSandi extends ResetKataSandiEvent {
  final ResetKataSandiModel resetKataSandiModel;
  
  const ResetKataSandi(this.resetKataSandiModel);
}