part of 'example_bloc.dart';

sealed class ExampleState extends Equatable {
  const ExampleState();
  
  @override
  List<Object> get props => [];
}

final class ExampleInitial extends ExampleState {}
