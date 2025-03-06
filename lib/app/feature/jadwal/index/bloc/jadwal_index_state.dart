part of 'jadwal_index_bloc.dart';

sealed class JadwalIndexState extends Equatable {
  const JadwalIndexState();

  @override
  List<Object> get props => [];
}

final class JadwalIndexInitial extends JadwalIndexState {}

final class JadwalIndexLoading extends JadwalIndexState {}

final class JadwalIndexSuccess extends JadwalIndexState {
  final GetDataJadwalPosyandu data;

  const JadwalIndexSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class JadwalIndexFailed extends JadwalIndexState {
  final String message;

  const JadwalIndexFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends JadwalIndexState {}


// delete
final class DeleteJadwalPosyanduLoading extends JadwalIndexState {

}

final class DeleteJadwalPosyanduSuccess extends JadwalIndexState {

}
