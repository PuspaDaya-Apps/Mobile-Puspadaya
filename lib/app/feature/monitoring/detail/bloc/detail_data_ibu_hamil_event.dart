part of 'detail_data_ibu_hamil_bloc.dart';

sealed class DetailDataIbuHamilEvent extends Equatable {
  const DetailDataIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class FetchDetailDataIbuHamil extends DetailDataIbuHamilEvent {
  final String id;
  FetchDetailDataIbuHamil({required this.id});
}
