part of 'generate_nik_cubit.dart';

sealed class GenerateNikState extends Equatable {
  const GenerateNikState();

  @override
  List<Object> get props => [];
}

final class GenerateNikInitial extends GenerateNikState {}

final class GenerateNikLoading extends GenerateNikState {}

final class GenerateNikSuccess extends GenerateNikState {
  final GetGenerateNikModel.GetGenerateNikModel data;
  GenerateNikSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

final class GenerateNikFailed extends GenerateNikState {
  final String message;
  GenerateNikFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends GenerateNikState {}
