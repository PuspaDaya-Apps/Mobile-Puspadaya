part of 'update_kehadiran_bloc.dart';

sealed class UpdateKehadiranEvent extends Equatable {
  const UpdateKehadiranEvent();

  @override
  List<Object> get props => [];
}

final class UpdateKehadiranEventSubmit extends UpdateKehadiranEvent {
  final String id;
  final PostCreateKehadiranModel data;

  const UpdateKehadiranEventSubmit({required this.data,required this.id});

  @override
  List<Object> get props => [data,id];
}