part of 'index_kehadiran_bloc.dart';

sealed class IndexKehadiranState extends Equatable {
  const IndexKehadiranState();
  
  @override
  List<Object> get props => [];
}

final class IndexKehadiranInitial extends IndexKehadiranState {}
final class IndexKehadiranLoading extends IndexKehadiranState {}
final class IndexKehadiranSuccess extends IndexKehadiranState {
  final GetIndexKehadiranModel data;

  const IndexKehadiranSuccess(this.data); 

  @override
  List<Object> get props => [data];
}
final class IndexKehadiranFailed extends IndexKehadiranState {
  final String message;

  const IndexKehadiranFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class TokenExpiredState extends IndexKehadiranState {}
