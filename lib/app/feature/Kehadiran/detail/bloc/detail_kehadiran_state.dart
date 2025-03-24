part of 'detail_kehadiran_bloc.dart';

sealed class DetailKehadiranState extends Equatable {
  const DetailKehadiranState();
  
  @override
  List<Object> get props => [];
}

final class DetailKehadiranInitial extends DetailKehadiranState {}

// get Detail
final class DetailKehadiranLoading extends DetailKehadiranState {}
final class DetailKehadiranSuccess extends DetailKehadiranState {
  final GetDetailKehadiranModel data;

  const DetailKehadiranSuccess(this.data);

  @override
  List<Object> get props => [data];
}
final class DetailKehadiranFailed extends DetailKehadiranState {
  final String message;

  const DetailKehadiranFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class TokenExpiredState extends DetailKehadiranState {}

// delete kehadiran
final class DeleteKehadiranLoading extends DetailKehadiranState {}
final class DeleteKehadiranSuccess extends DetailKehadiranState {}
final class DeleteKehadiranFailed extends DetailKehadiranState {
  final String message;

  const DeleteKehadiranFailed(this.message);
}