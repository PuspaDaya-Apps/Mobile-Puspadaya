part of 'detail_faktor_resiko_bloc.dart';

sealed class DetailFaktorResikoState extends Equatable {
  const DetailFaktorResikoState();

  @override
  List<Object> get props => [];
}

final class DetailFaktorResikoInitial extends DetailFaktorResikoState {}

final class DetailFaktorResikoLoading extends DetailFaktorResikoState {}

final class DetailFaktorResikoSuccess extends DetailFaktorResikoState {
  final GetDetailRiwayatFaktorResikoModel data;
  const DetailFaktorResikoSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class DetailFaktorResikoFailed extends DetailFaktorResikoState {
  final String message;
  const DetailFaktorResikoFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends DetailFaktorResikoState {}
