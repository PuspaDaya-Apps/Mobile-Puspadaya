part of 'detail_alat_ukur_bloc.dart';

sealed class DetailAlatUkurState extends Equatable {
  const DetailAlatUkurState();

  @override
  List<Object> get props => [];
}

final class DetailAlatUkurInitial extends DetailAlatUkurState {}

// detail alat ukur
final class DetailAlatUkurLoading extends DetailAlatUkurState {}

final class DetailAlatUkurSuccess extends DetailAlatUkurState {
  final GetDetailAlatUkurKaderModel data;
  const DetailAlatUkurSuccess(this.data);
  @override
  List<Object> get props => [data];
}

final class DetailAlatUkurFailed extends DetailAlatUkurState {
  final String message;

  const DetailAlatUkurFailed(this.message);

  @override
  List<Object> get props => [message];
}

// delete alat ukur
final class DeleteAlatUkurLoading extends DetailAlatUkurState {}

final class DeleteAlatUkurSuccess extends DetailAlatUkurState {}

final class DeleteAlatUkurFailed extends DetailAlatUkurState {
  final String message;

  const DeleteAlatUkurFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends DetailAlatUkurState {}
