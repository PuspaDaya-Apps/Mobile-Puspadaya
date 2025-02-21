part of 'get_detail_ibu_hamil_bloc.dart';

sealed class GetDetailIbuHamilEvent extends Equatable {
  const GetDetailIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class FetchDetailIbuHamil extends GetDetailIbuHamilEvent {
  final String id;
  FetchDetailIbuHamil({required this.id});
}
