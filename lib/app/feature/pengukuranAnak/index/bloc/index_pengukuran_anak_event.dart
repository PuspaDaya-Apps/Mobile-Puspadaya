part of 'index_pengukuran_anak_bloc.dart';

sealed class IndexPengukuranAnakEvent extends Equatable {
  const IndexPengukuranAnakEvent();

  @override
  List<Object> get props => [];
}

final class GetPengukuranAnakEvent extends IndexPengukuranAnakEvent{}