part of 'select_alamat_cubit.dart';

sealed class SelectAlamatState extends Equatable {
  const SelectAlamatState();

  @override
  List<Object> get props => [];
}

final class AlamatInitial extends SelectAlamatState {}

class AddressSelecting extends SelectAlamatState {
  final List<ProvinsiModel.Datum> provinsi;
  final List<KabupatenModel.Datum> kabupaten;
  final List<KecamatanModel.Datum> kecamatan;
  final List<DesaModel.Datum> desa;
  final List<DusunModel.Datum> dusun;

  final String? selectedProvinsi;
  final String? selectedKabupaten;
  final String? selectedKecamatan;
  final String? selectedDesa;
  final String? selectedDusun;

  AddressSelecting({
    this.provinsi = const [],
    this.kabupaten = const [],
    this.kecamatan = const [],
    this.desa = const [],
    this.dusun = const [],
    this.selectedProvinsi,
    this.selectedKabupaten,
    this.selectedKecamatan,
    this.selectedDesa,
    this.selectedDusun,
  });

  @override
  List<Object> get props => [
        provinsi,
        kabupaten,
        kecamatan,
        desa,
        dusun,
        selectedProvinsi!,
        selectedKabupaten!,
        selectedKecamatan!,
        selectedDesa!,
        selectedDusun!,
      ];

  AddressSelecting copyWith({
    List<ProvinsiModel.Datum>? provinsi,
    List<KabupatenModel.Datum>? kabupaten,
    List<KecamatanModel.Datum>? kecamatan,
    List<DesaModel.Datum>? desa,
    List<DusunModel.Datum>? dusun,
    String? selectedProvinsi,
    String? selectedKabupaten,
    String? selectedKecamatan,
    String? selectedDesa,
    String? selectedDusun,
  }) {
    return AddressSelecting(
      provinsi: provinsi ?? this.provinsi,
      kabupaten: kabupaten ?? this.kabupaten,
      kecamatan: kecamatan ?? this.kecamatan,
      desa: desa ?? this.desa,
      dusun: dusun ?? this.dusun,
      selectedProvinsi: selectedProvinsi ?? this.selectedProvinsi,
      selectedKabupaten: selectedKabupaten ?? this.selectedKabupaten,
      selectedKecamatan: selectedKecamatan ?? this.selectedKecamatan,
      selectedDesa: selectedDesa ?? this.selectedDesa,
      selectedDusun: selectedDusun ?? this.selectedDusun,
    );
  }
}
