part of 'ganti_kata_sandi_bloc.dart';

sealed class GantiKataSandiState extends Equatable {
  const GantiKataSandiState();
  
  @override
  List<Object> get props => [];
}

final class GantiKataSandiInitial extends GantiKataSandiState {}

final class GantiKataSandiLoading extends GantiKataSandiState {}

final class GantiKataSandiSuccess extends GantiKataSandiState {}

final class GantiKataSandiFailed extends GantiKataSandiState {
  final String message;

  const GantiKataSandiFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends GantiKataSandiState {}
