part of 'update_anak_bloc.dart';

sealed class UpdateAnakEvent extends Equatable {
  const UpdateAnakEvent();

  @override
  List<Object> get props => [];
}

final class UpdateAnak extends UpdateAnakEvent {
  final UpdateAnakModel updateAnakModel;
  final String id;

  const UpdateAnak({
    required this.updateAnakModel,
    required this.id
  });
}

final class NullErrorEvent extends UpdateAnakEvent {}