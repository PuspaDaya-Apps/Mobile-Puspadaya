part of 'create_beban_kerja_bloc.dart';

sealed class CreateBebanKerjaEvent extends Equatable {
  const CreateBebanKerjaEvent();

  @override
  List<Object> get props => [];
}

final class SendBebanKerjaEvent extends CreateBebanKerjaEvent {
  final List<Jobitems> item;
  const SendBebanKerjaEvent (this.item);
}

final class NullErrorEvent extends CreateBebanKerjaEvent {}