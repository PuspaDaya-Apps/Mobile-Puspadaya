part of 'update_alat_ukur_bloc.dart';

sealed class UpdateAlatUkurState extends Equatable {
  const UpdateAlatUkurState();
  
  @override
  List<Object> get props => [];
}

final class UpdateAlatUkurInitial extends UpdateAlatUkurState {}
final class UpdateAlataUkurLoading extends UpdateAlatUkurState {}
final class UpdateAlataUkurSuccess extends UpdateAlatUkurState {}
final class TokenExpiredState extends  UpdateAlatUkurState {}
final class UpdateAlatUkurFailed extends UpdateAlatUkurState {
  final String message;
  const UpdateAlatUkurFailed(this.message);

  @override
  List<Object> get props => [message];
}