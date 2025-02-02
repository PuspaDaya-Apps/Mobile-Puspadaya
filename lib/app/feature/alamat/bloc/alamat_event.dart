part of 'alamat_bloc.dart';

sealed class AlamatEvent extends Equatable {
  const AlamatEvent();

  @override
  List<Object> get props => [];
}

class ShowAllSectionEvent extends AlamatEvent {
  const ShowAllSectionEvent();

  @override
  List<Object> get props => [];
}

class SelectKabupaten extends AlamatEvent {
  final String idProvinsi;

  const SelectKabupaten(this.idProvinsi);

  @override
  List<Object> get props => [idProvinsi];
}

class SelectKecamatan extends AlamatEvent {
  final String idKabupaten;

  const SelectKecamatan(this.idKabupaten);

  @override
  List<Object> get props => [idKabupaten];
}

class SelectDesa extends AlamatEvent {
  final DesaKelurahanModel.GetDesaKelurahanResponse desa;

  const SelectDesa(this.desa);

  @override
  List<Object> get props => [desa];
}

class SelectDusun extends AlamatEvent {
  final DusunModel.GetDusunResponse dusun;

  const SelectDusun(this.dusun);

  @override
  List<Object> get props => [dusun];
}
