part of 'detail_faktor_resiko_bloc.dart';

sealed class DetailFaktorResikoEvent extends Equatable {
  const DetailFaktorResikoEvent();

  @override
  List<Object> get props => [];
}

final class FetchDetailFaktorResiko extends DetailFaktorResikoEvent {
  final String id;
  const FetchDetailFaktorResiko({required this.id});
}
