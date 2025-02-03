part of 'alamat_bloc.dart';

sealed class AlamatState extends Equatable {
  const AlamatState();

  @override
  List<Object> get props => [];
}

final class AlamatInitial extends AlamatState {}

final class AlamatLoading extends AlamatState {}

class ShowAllSection extends AlamatState {
  final List<ProvinsiModel.Datum> provinsi;
  final List<KabupatenModel.Datum> kabupaten;
  final List<KecamatanModel.Datum> kecamatan;
  final List<DesaKelurahanModel.Datum> desaKelurahan;
  final List<DusunModel.Datum> dusun;
  const ShowAllSection(
      {required this.provinsi,
      required this.kabupaten,
      required this.kecamatan,
      required this.desaKelurahan,
      required this.dusun});

  @override
  List<Object> get props => [provinsi];
}

class SelectedProvinsi extends AlamatState {
  final ProvinsiModel.GetProvinsiResponse provinsi;

  const SelectedProvinsi(this.provinsi);

  @override
  List<Object> get props => [provinsi];
}

class ShowKabupaten extends AlamatState {
  final List<KabupatenModel.Datum> kabupaten;

  const ShowKabupaten(this.kabupaten);

  @override
  List<Object> get props => [kabupaten];
}

class SelectedKabupaten extends AlamatState {
  final KabupatenModel.GetKabupatenResponse kabupaten;

  const SelectedKabupaten(this.kabupaten);

  @override
  List<Object> get props => [kabupaten];
}

class ShowKecamatan extends AlamatState {
  final List<KecamatanModel.Datum> kecamatan;

  const ShowKecamatan(this.kecamatan);

  @override
  List<Object> get props => [kecamatan];
}

class SelectedKecamatan extends AlamatState {
  final KecamatanModel.GetKecamatanResponse kecamatan;

  const SelectedKecamatan(this.kecamatan);

  @override
  List<Object> get props => [kecamatan];
}

class SelectedDesa extends AlamatState {
  final DesaKelurahanModel.GetDesaKelurahanResponse desa;

  const SelectedDesa(this.desa);

  @override
  List<Object> get props => [desa];
}

class SelectedDusun extends AlamatState {
  final DusunModel.GetDusunResponse dusun;

  const SelectedDusun(this.dusun);

  @override
  List<Object> get props => [dusun];
}

class AlamatFailure extends AlamatState {
  final String error;
  const AlamatFailure(this.error);
  @override
  List<Object> get props => [error];
}

class TokenExpiredState extends AlamatState {}
