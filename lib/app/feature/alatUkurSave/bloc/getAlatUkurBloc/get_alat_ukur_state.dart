part of 'get_alat_ukur_bloc.dart';

sealed class GetAlatUkurState extends Equatable {
  const GetAlatUkurState();
  
  @override
  List<Object> get props => [];
}

final class GetAlatUkurProccessState extends GetAlatUkurState {}

final class GetAlatUkurAnakSuccessState extends GetAlatUkurState {
  final AlatUkurSaveModel alatUkurAnak;

  const GetAlatUkurAnakSuccessState(this.alatUkurAnak);
}

final class GetAlatUkurAnakFailedState extends GetAlatUkurState {}

final class GetAlatUkurIbuHamilSuccessState extends GetAlatUkurState {
  final AlatUkurSaveModel alatUkurIbuHamil;

  const GetAlatUkurIbuHamilSuccessState(this.alatUkurIbuHamil);
}

final class GetAlatUkurIbuHamilFailedState extends GetAlatUkurState {}