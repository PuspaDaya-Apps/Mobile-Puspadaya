part of 'index_kunjungan_bloc.dart';

sealed class IndexKunjunganState extends Equatable {
  const IndexKunjunganState();
  
  @override
  List<Object> get props => [];
}

final class IndexKunjunganProccessState extends IndexKunjunganState {}

final class IndexKunjunganSuccessState extends IndexKunjunganState {
  final KunjunganResponseModel kunjunganResponseModel;

  const IndexKunjunganSuccessState(this.kunjunganResponseModel);
}

final class IndexKunjunganFailedState extends IndexKunjunganState {
  final String error;

  const IndexKunjunganFailedState(this.error);
}

final class IndexKunjunganTokenExpiredState extends IndexKunjunganState {}
