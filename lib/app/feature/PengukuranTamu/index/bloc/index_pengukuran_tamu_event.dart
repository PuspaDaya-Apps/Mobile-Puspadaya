part of 'index_pengukuran_tamu_bloc.dart';

sealed class IndexPengukuranTamuEvent extends Equatable {
  const IndexPengukuranTamuEvent();

  @override
  List<Object> get props => [];
}

final class GetPengukuranTamuEvent extends IndexPengukuranTamuEvent{}