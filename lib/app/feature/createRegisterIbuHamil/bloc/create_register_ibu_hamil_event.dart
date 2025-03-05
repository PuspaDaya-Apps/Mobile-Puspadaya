part of 'create_register_ibu_hamil_bloc.dart';

sealed class CreateRegisterIbuHamilEvent extends Equatable {
  const CreateRegisterIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class FetchSearchIbuHamil extends CreateRegisterIbuHamilEvent {}

final class PostCreateIbuHamil extends CreateRegisterIbuHamilEvent {
  final PostIbuHamilModel data;
  PostCreateIbuHamil(this.data);
  @override
  List<Object> get props => [data];
}
