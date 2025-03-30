part of 'posyandu_bloc.dart';

sealed class PosyanduState extends Equatable {
  const PosyanduState();
  
  @override
  List<Object> get props => [];
}
// posyandu
final class PosyanduInitial extends PosyanduState {}
final class PosyanduLoading extends PosyanduState {}
final class PosyanduSuccess extends PosyanduState {
  final GetAllPosyandu data;
  const PosyanduSuccess(this.data);

  @override
  List<Object> get props => [data];

}
final class PosyanduFailed extends PosyanduState {
  final String message;
  const PosyanduFailed(this.message);

  @override
  List<Object> get props => [message];
}

// anak by posyandu
final class TokenExpiredState extends PosyanduState {}
