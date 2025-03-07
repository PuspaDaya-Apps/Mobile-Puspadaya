part of 'ganti_profile_bloc.dart';

sealed class GantiProfileState extends Equatable {
  const GantiProfileState();
  
  @override
  List<Object> get props => [];
}

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