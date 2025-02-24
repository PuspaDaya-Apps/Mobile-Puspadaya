part of 'index_kunjungan_bloc.dart';

sealed class IndexKunjunganEvent extends Equatable {
  const IndexKunjunganEvent();

  @override
  List<Object> get props => [];
}

final class GetDataKunjungan extends IndexKunjunganEvent {}