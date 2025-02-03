part of 'index_beban_kerja_bloc.dart';

sealed class IndexBebanKerjaEvent extends Equatable {
  const IndexBebanKerjaEvent();

  @override
  List<Object> get props => [];
}

final class GetBebanKerjaEvent extends IndexBebanKerjaEvent {}