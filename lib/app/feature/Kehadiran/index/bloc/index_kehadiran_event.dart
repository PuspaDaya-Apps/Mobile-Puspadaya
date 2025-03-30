part of 'index_kehadiran_bloc.dart';

sealed class IndexKehadiranEvent extends Equatable {
  const IndexKehadiranEvent();

  @override
  List<Object> get props => [];
}

final class GetIndexKehadiranEvent extends IndexKehadiranEvent {}