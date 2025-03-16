part of 'get_alat_ukur_bloc.dart';

sealed class GetAlatUkurEvent extends Equatable {
  const GetAlatUkurEvent();

  @override
  List<Object> get props => [];
}

final class GetAlatUkurAnak extends GetAlatUkurEvent {}

final class GetAlatUkurIbuHamil extends GetAlatUkurEvent {}