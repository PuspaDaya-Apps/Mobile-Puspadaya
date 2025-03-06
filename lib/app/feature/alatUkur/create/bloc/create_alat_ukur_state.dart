part of 'create_alat_ukur_bloc.dart';

sealed class CreateAlatUkurState extends Equatable {
  const CreateAlatUkurState();
  
  @override
  List<Object> get props => [];
}

final class CreateAlatUkurInitial extends CreateAlatUkurState {}

// initial form
final class CreateAlatUkurInitialFormLoading extends CreateAlatUkurState {}
final class CreateAlatUkurInitialFormSuccess extends CreateAlatUkurState {
  final List<GetAllAlatUkurAdmin> alatUkurAdmin;

  const CreateAlatUkurInitialFormSuccess(this.alatUkurAdmin);
  @override
  List<Object> get props => [alatUkurAdmin];
}
final class CreateAlatUkurInitialFormFailed extends CreateAlatUkurState {
  final String message;

  const CreateAlatUkurInitialFormFailed(this.message);
  @override
  List<Object> get props => [message];
}

// post form

final class CreateAlatUkurPostLoading extends CreateAlatUkurState {}
final class CreateAlatUkurPostSuccess extends CreateAlatUkurState {}
final class CreateAlatUkurPostFailed extends CreateAlatUkurState {
  final String message;

  const CreateAlatUkurPostFailed(this.message);
  @override
  List<Object> get props => [message];
  
}


final class TokenExpiredState extends CreateAlatUkurState {}