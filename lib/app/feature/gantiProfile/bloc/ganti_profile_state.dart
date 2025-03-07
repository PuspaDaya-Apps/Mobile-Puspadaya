part of 'ganti_profile_bloc.dart';

sealed class GantiProfileState extends Equatable {
  const GantiProfileState();
  
  @override
  List<Object> get props => [];
}
// form ganti profile
final class GantiProfileFormLoading extends GantiProfileState {}
final class GantiProfileFormSuccess extends GantiProfileState {
  final GetDetailUserByIdModel data;

  const GantiProfileFormSuccess(this.data);

  @override
  List<Object> get props => [data];
}
final class GantiProfileFormFailed extends GantiProfileState {
  final String message;

  const GantiProfileFormFailed(this.message);

  @override
  List<Object> get props => [message];
} 



// patch ganti profile
final class GantiProfileInitial extends GantiProfileState {}
final class GantiProfileLoading extends GantiProfileState {}
final class GantiProfileSuccess extends GantiProfileState {}
final class GantiProfileFailed extends GantiProfileState {
  final String message;

  const GantiProfileFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends GantiProfileState {}