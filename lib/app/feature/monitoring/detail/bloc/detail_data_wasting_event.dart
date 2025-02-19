part of 'detail_data_wasting_bloc.dart';

sealed class DetailDataWastingEvent extends Equatable {
  const DetailDataWastingEvent();

  @override
  List<Object> get props => [];
}

final class FetchDetailDataWasting extends DetailDataWastingEvent {
  final String id;
  FetchDetailDataWasting({required this.id});
}
