part of 'alat_ukur_anak_bloc.dart';

sealed class AlatUkurAnakEvent extends Equatable {
  const AlatUkurAnakEvent();

  @override
  List<Object> get props => [];
}

final class GetAlatUkur extends AlatUkurAnakEvent {}
