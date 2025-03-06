part of 'index_alat_ukur_bloc.dart';

sealed class IndexAlatUkurEvent extends Equatable {
  const IndexAlatUkurEvent();

  @override
  List<Object> get props => [];
}
final class GetIndexAlatUkurKader extends IndexAlatUkurEvent {}