part of 'create_beban_kerja_bloc.dart';

sealed class CreateBebanKerjaEvent extends Equatable {
  const CreateBebanKerjaEvent();

  @override
  List<Object> get props => [];
}

final class SendBebanKerjaEvent extends CreateBebanKerjaEvent {
  final CreateBebanKerjaModel createBebanKerjaModel;

  const SendBebanKerjaEvent (this.createBebanKerjaModel);
}

final class NullErrorEvent extends CreateBebanKerjaEvent {}