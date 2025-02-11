part of 'lupa_kata_sandi_bloc.dart';

sealed class LupaKataSandiEvent extends Equatable {
  const LupaKataSandiEvent();

  @override
  List<Object> get props => [];
}

final class SendLupakataSandi extends LupaKataSandiEvent {
  final LupaKataSandiModel lupaKataSandiModel;

  const SendLupakataSandi(this.lupaKataSandiModel);
}
