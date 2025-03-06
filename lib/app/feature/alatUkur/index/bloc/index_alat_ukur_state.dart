part of 'index_alat_ukur_bloc.dart';

sealed class IndexAlatUkurState extends Equatable {
  const IndexAlatUkurState();

  @override
  List<Object> get props => [];
}

final class IndexAlatUkurInitial extends IndexAlatUkurState {}

final class IndexAlatUkurLoading extends IndexAlatUkurState {}

final class IndexAlatUkurSuccess extends IndexAlatUkurState {
  final GetAllAlatUkur data;
  const IndexAlatUkurSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class TokenExpiredState extends IndexAlatUkurState{}

final class IndexAlatUkurFailed extends IndexAlatUkurState {
  final String message;
  const IndexAlatUkurFailed(this.message);

  @override
  List<Object> get props => [message];
}