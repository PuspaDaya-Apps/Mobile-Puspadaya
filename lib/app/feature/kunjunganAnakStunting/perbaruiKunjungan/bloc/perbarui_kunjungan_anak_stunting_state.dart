part of 'perbarui_kunjungan_anak_stunting_bloc.dart';

sealed class PerbaruiKunjunganAnakStuntingState extends Equatable {
  const PerbaruiKunjunganAnakStuntingState();
  
  @override
  List<Object> get props => [];
}

final class PerbaruiKunjunganAnakStuntingInitial extends PerbaruiKunjunganAnakStuntingState {}

final class PerbaruiKunjunganAnakStuntingProccessState extends PerbaruiKunjunganAnakStuntingState {}

final class PerbaruiKunjunganAnakStuntingSuccessState extends PerbaruiKunjunganAnakStuntingState {}

final class PerbaruiKunjunganAnakStuntingFailedBuktitate extends PerbaruiKunjunganAnakStuntingState {
  final String error;

  const PerbaruiKunjunganAnakStuntingFailedBuktitate(this.error);
}

final class PerbaruiKunjunganAnakStuntingTokenExpiredState extends PerbaruiKunjunganAnakStuntingState{}

final class ListImagesNullState extends PerbaruiKunjunganAnakStuntingState{}

final class ListTugasNullState extends PerbaruiKunjunganAnakStuntingState{}