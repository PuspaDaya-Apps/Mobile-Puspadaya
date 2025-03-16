part of 'index_pengukuran_ibu_hamil_bloc.dart';

sealed class IndexPengukuranIbuHamilEvent extends Equatable {
  const IndexPengukuranIbuHamilEvent();

  @override
  List<Object> get props => [];
}

final class GetPengukuranIbuHamilEvent extends IndexPengukuranIbuHamilEvent{}