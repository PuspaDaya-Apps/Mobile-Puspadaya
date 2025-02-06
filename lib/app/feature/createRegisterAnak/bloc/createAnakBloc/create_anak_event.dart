part of 'create_anak_bloc.dart';

sealed class CreateAnakEvent extends Equatable {
  const CreateAnakEvent();

  @override
  List<Object> get props => [];
}

final class CreateAnak extends CreateAnakEvent {
  final CreateAnakModel createAnakModel;

  const CreateAnak(this.createAnakModel);
}

final class NullErrorEvent extends CreateAnakEvent {}
