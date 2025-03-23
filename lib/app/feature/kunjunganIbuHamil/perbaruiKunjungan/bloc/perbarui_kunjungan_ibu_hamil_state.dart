part of 'perbarui_kunjungan_ibu_hamil_bloc.dart';

sealed class PerbaruiKunjunganIbuHamilState extends Equatable {
  const PerbaruiKunjunganIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class PerbaruiKunjunganIbuHamilInitial extends PerbaruiKunjunganIbuHamilState {}

final class PerbaruiKunjunganIbuHamilProccessState extends PerbaruiKunjunganIbuHamilState {}

final class PerbaruiKunjunganIbuHamilSuccessState extends PerbaruiKunjunganIbuHamilState {}

final class PerbaruiKunjunganIbuHamilFailedBuktitate extends PerbaruiKunjunganIbuHamilState {
  final String error;

  const PerbaruiKunjunganIbuHamilFailedBuktitate(this.error);
}

final class PerbaruiKunjunganIbuHamilTokenExpiredState extends PerbaruiKunjunganIbuHamilState{}

final class ListImagesNullState extends PerbaruiKunjunganIbuHamilState{}

final class ListTugasNullState extends PerbaruiKunjunganIbuHamilState{}
