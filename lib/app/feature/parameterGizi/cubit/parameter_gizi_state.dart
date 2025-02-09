part of 'parameter_gizi_cubit.dart';

sealed class ParameterGiziState extends Equatable {
  const ParameterGiziState();

  @override
  List<Object> get props => [];
}

final class ParameterGiziInitial extends ParameterGiziState {}

class ParameterGiziUnselected extends ParameterGiziState {}

class ParameterGiziLoading extends ParameterGiziState {}

class ParameterGiziLoaded extends ParameterGiziState {
  final ParameterGiziModel data;

  const ParameterGiziLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class ParameterGiziError extends ParameterGiziState {
  final String message;

  const ParameterGiziError(this.message);

  @override
  List<Object> get props => [message];
}
