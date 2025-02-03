part of 'index_beban_kerja_bloc.dart';

sealed class IndexBebanKerjaState extends Equatable {
  const IndexBebanKerjaState();
  
  @override
  List<Object> get props => [];
}

final class IndexBebanKerjaInitial extends IndexBebanKerjaState {}

final class IndexBebanKerjaProcessState extends IndexBebanKerjaState {}

final class IndexBebanKerjaSuccessState extends IndexBebanKerjaState {
  final IndexBebanKerjaResponseModel indexBebanKerjaResponseModel;
  final String posyandu;

  const IndexBebanKerjaSuccessState({
    required this.indexBebanKerjaResponseModel,
    required this.posyandu
  });
}

final class IndexBebanKerjaFailedState extends IndexBebanKerjaState {
  final String error;

  const IndexBebanKerjaFailedState(this.error);
}

final class IndexBebanKerjaTokenExpiredState extends IndexBebanKerjaState {}
