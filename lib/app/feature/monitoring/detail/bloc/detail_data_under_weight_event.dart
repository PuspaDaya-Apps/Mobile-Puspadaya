part of 'detail_data_under_weight_bloc.dart';

sealed class DetailDataUnderWeightEvent extends Equatable {
  const DetailDataUnderWeightEvent();

  @override
  List<Object> get props => [];
}

final class FetchDetailDataUnderWeight extends DetailDataUnderWeightEvent {
  final String id;
  FetchDetailDataUnderWeight({required this.id});
}
