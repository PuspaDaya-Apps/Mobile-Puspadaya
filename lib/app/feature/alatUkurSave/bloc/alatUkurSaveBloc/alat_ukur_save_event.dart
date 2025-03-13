part of 'alat_ukur_save_bloc.dart';

sealed class AlatUkurSaveEvent extends Equatable {
  const AlatUkurSaveEvent();

  @override
  List<Object> get props => [];
}

final class GetAlatUkur extends AlatUkurSaveEvent {}