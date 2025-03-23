part of 'ganti_profile_bloc.dart';

sealed class GantiProfileEvent extends Equatable {
  const GantiProfileEvent();

  @override
  List<Object> get props => [];
}
final class PatchGantiProfile extends GantiProfileEvent {
  final PatchGantiProfileModel data;

  const PatchGantiProfile(this.data);

  @override
  List<Object> get props => [data];

}
final class GetDetailUser extends GantiProfileEvent {
  final String userId;

  const GetDetailUser(this.userId);

  @override
  List<Object> get props => [userId];

}