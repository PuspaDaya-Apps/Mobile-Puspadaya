part of 'create_alat_ukur_bloc.dart';

sealed class CreateAlatUkurEvent extends Equatable {
  const CreateAlatUkurEvent();

  @override
  List<Object> get props => [];
}

final class GetAlatUkurAdmin extends CreateAlatUkurEvent {}

final class PostAlatUkur extends CreateAlatUkurEvent {
  final PostAlatUkurModel data;

  const PostAlatUkur(this.data);

  @override
  List<Object> get props => [data];
}
final class PostAlatUkurAlatDini extends CreateAlatUkurEvent {
  final PostAlatUkurAlatDeteksiDiniModel data;

  const PostAlatUkurAlatDini(this.data);

  @override
  List<Object> get props => [data];
}