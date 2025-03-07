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