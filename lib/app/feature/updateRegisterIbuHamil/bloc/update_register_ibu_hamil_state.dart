part of 'update_register_ibu_hamil_bloc.dart';

sealed class UpdateRegisterIbuHamilState extends Equatable {
  const UpdateRegisterIbuHamilState();

  @override
  List<Object> get props => [];
}

final class UpdateRegisterIbuHamilInitial extends UpdateRegisterIbuHamilState {}

final class UpdateRegisterIbuHamilLoading extends UpdateRegisterIbuHamilState {}

final class UpdateRegisterIbuHamilSendSuccess
    extends UpdateRegisterIbuHamilState {}

final class UpdateRegisterIbuHamilFailed extends UpdateRegisterIbuHamilState {
  final ErrorPostIbuHamilModel error;
  UpdateRegisterIbuHamilFailed({required this.error});
  @override
  List<Object> get props => [error];
}

final class TokenExpiredState extends UpdateRegisterIbuHamilState {}
