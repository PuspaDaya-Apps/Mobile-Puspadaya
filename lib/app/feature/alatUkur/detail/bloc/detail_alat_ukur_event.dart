part of 'detail_alat_ukur_bloc.dart';

sealed class DetailAlatUkurEvent extends Equatable {
  const DetailAlatUkurEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailAlatUkurEvent extends DetailAlatUkurEvent{
  final String id;
  const GetDetailAlatUkurEvent(this.id);

  @override
  List<Object> get props => [id];

}

final class DetailAlatUkurDeleteEvent extends DetailAlatUkurEvent {
  final String id;
  const DetailAlatUkurDeleteEvent(this.id);

  @override
  List<Object> get props => [id];
}

