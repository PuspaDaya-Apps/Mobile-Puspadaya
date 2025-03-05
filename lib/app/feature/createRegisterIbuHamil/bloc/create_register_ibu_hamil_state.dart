part of 'create_register_ibu_hamil_bloc.dart';

sealed class CreateRegisterIbuHamilState extends Equatable {
  const CreateRegisterIbuHamilState();

  @override
  List<Object> get props => [];
}

final class CreateRegisterIbuHamilInitial extends CreateRegisterIbuHamilState {}

final class CreateRegisterIbuHamilLoading extends CreateRegisterIbuHamilState {}

final class CreateRegisterIbuHamilSuccess extends CreateRegisterIbuHamilState {
  final GetAllOrangTuaResponse data;
  CreateRegisterIbuHamilSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

final class CreateRegisterIbuHamilFailed extends CreateRegisterIbuHamilState {
  final String message;
  const CreateRegisterIbuHamilFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends CreateRegisterIbuHamilState {}

// !create regsiter
final class CreateRegisterIbuHamilSendLoading
    extends CreateRegisterIbuHamilState {}

final class CreateRegisterIbuHamilSendSuccess
    extends CreateRegisterIbuHamilState {}

final class CreateRegisterIbuHamilSendFailed
    extends CreateRegisterIbuHamilState {
  final ErrorPostIbuHamilModel error;
  const CreateRegisterIbuHamilSendFailed({required this.error});
  @override
  List<Object> get props => [error];
}
