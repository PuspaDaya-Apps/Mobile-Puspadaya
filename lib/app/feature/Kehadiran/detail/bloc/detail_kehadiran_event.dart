part of 'detail_kehadiran_bloc.dart';

sealed class DetailKehadiranEvent extends Equatable {
  const DetailKehadiranEvent();

  @override
  List<Object> get props => [];
}
final class GetDetailKehadiranEvent extends DetailKehadiranEvent {
  final String id;
  const GetDetailKehadiranEvent({required this.id});

  @override
  List<Object> get props => [id];
} 
final class DeleteKehadiranEvent extends DetailKehadiranEvent {
  final String id;
  const DeleteKehadiranEvent({required this.id});

  @override
  List<Object> get props => [id];

}