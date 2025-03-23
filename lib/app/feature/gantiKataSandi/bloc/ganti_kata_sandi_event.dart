part of 'ganti_kata_sandi_bloc.dart';

sealed class GantiKataSandiEvent extends Equatable {
  const GantiKataSandiEvent();

  @override
  List<Object> get props => [];
}
final class PostGantiKataSandiEvent extends GantiKataSandiEvent {
  final PostGantiKataSandiModel data;

  const PostGantiKataSandiEvent(this.data);

  @override
  List<Object> get props => [data];
}