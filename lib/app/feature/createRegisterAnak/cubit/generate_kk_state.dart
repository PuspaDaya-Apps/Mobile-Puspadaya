part of 'generate_kk_cubit.dart';

sealed class GenerateKkState extends Equatable {
  const GenerateKkState();

  @override
  List<Object> get props => [];
}

final class GenerateKkInitial extends GenerateKkState {}

final class GenerateKKLoading extends GenerateKkState {}

final class GenerateKKSuccess extends GenerateKkState {
  final GetGenerateKKModel.GetGenerateKKModel data;
  GenerateKKSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

final class GenerateKKFailed extends GenerateKkState {
  final String message;
  GenerateKKFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends GenerateKkState {}
