part of 'anak_posyandu_bloc.dart';

sealed class AnakPosyanduState extends Equatable {
  const AnakPosyanduState();
  
  @override
  List<Object> get props => [];
}

final class AnakPosyanduInitial extends AnakPosyanduState {}
final class AnakPosyanduLoading extends AnakPosyanduState {}
final class AnakPosyanduSuccess extends AnakPosyanduState {
  final GetAllAnakPosyanduModel data;

  const AnakPosyanduSuccess(this.data);
  
  @override
  List<Object> get props => [data];
}
final class AnakPosyanduFailed extends AnakPosyanduState {
  final String message;

  const AnakPosyanduFailed(this.message);
  
  @override
  List<Object> get props => [message];
}
final class TokenExpiredState extends AnakPosyanduState {}
