part of 'update_register_ibu_hamil_bloc.dart';

sealed class UpdateRegisterIbuHamilEvent extends Equatable {
  const UpdateRegisterIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class PatchUpdateRegisterIbuHamil extends UpdateRegisterIbuHamilEvent {
  final PostIbuHamilModel data;
  final String id;
  PatchUpdateRegisterIbuHamil(this.data, this.id);
}
