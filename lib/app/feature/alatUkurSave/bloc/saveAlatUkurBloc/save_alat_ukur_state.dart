part of 'save_alat_ukur_bloc.dart';

sealed class SaveAlatUkurState extends Equatable {
  const SaveAlatUkurState();
  
  @override
  List<Object> get props => [];
}

final class SaveAlatUkurInitial extends SaveAlatUkurState {}

//! anak
final class SaveAlatUkurAnakProccessState extends SaveAlatUkurState {}

final class SaveAlatUkurAnakSuccessState extends SaveAlatUkurState {}

final class SaveAlatUkurAnakFailedState extends SaveAlatUkurState {
  final String error;

  const SaveAlatUkurAnakFailedState(this.error);
}

//! ibu hamil
final class SaveAlatUkurIbuHamilProccessState extends SaveAlatUkurState {}

final class SaveAlatUkurIbuHamilSuccessState extends SaveAlatUkurState {}

final class SaveAlatUkurIbuHamilFailedState extends SaveAlatUkurState {
  final String error;

  const SaveAlatUkurIbuHamilFailedState(this.error);
}
