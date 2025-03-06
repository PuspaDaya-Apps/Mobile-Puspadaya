part of 'update_alat_ukur_bloc.dart';

sealed class UpdateAlatUkurEvent extends Equatable {
  const UpdateAlatUkurEvent();

  @override
  List<Object> get props => [];
}

final class UpdateAlatUkurDeteksiDini extends UpdateAlatUkurEvent {
  final PostAlatUkurAlatDeteksiDiniModel data;
  const UpdateAlatUkurDeteksiDini(this.data);
  @override
  List<Object> get props => [data];
}

final class UpdateAlatUkurKader extends UpdateAlatUkurEvent {
  final String id;
  final PostAlatUkurModel data;
  const UpdateAlatUkurKader(this.id, this.data);

  @override
  List<Object> get props => [id, data];
}
