part of 'save_alat_ukur_bloc.dart';

sealed class SaveAlatUkurEvent extends Equatable {
  const SaveAlatUkurEvent();

  @override
  List<Object> get props => [];
}

final class SaveAlatUkurAnak extends SaveAlatUkurEvent {
  final AlatUkurSaveModel alatUkurAnak;

  const SaveAlatUkurAnak(this.alatUkurAnak);
}

final class SaveAlatUkurIbuHamil extends SaveAlatUkurEvent {
  final AlatUkurSaveModel alatUkurIbuHamil;

  const SaveAlatUkurIbuHamil(this.alatUkurIbuHamil);
}