// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../model/get_desa_kelurahan_response.dart' as DesaModel;
// import '../model/get_dusun_response.dart' as DusunModel;
// import '../model/get_kabupaten_response.dart' as KabupatenModel;
// import '../model/get_kecamatan_response.dart' as KecamatanModel;
// import '../model/get_provinsi_response.dart' as ProvinsiModel;

// part 'select_alamat_state.dart';

// class SelectAlamatCubit extends Cubit<SelectAlamatState> {
//   SelectAlamatCubit() : super(AlamatInitial());

//   void loadProvinsi(List<ProvinsiModel.Datum> provinsi) {
//     // load provinsi

//     // letakkan ke state
//     emit(
//       AddressSelecting(
//         provinsi: provinsi,
//         kabupaten: [],
//         desa: [],
//         kecamatan: [],
//         dusun: [],
//         selectedProvinsi: null,
//         selectedKabupaten: null,
//         selectedKecamatan: null,
//         selectedDesa: null,
//         selectedDusun: null,
//       ),
//     );
//   }

//   void selectProvinsi(
//       String provinsiId, List<KabupatenModel.Datum> allRegencies) {
//     // load all kabupaten

//     final filteredRegencies = allRegencies
//         .where((kabupaten) => kabupaten.provinsi.id == provinsiId)
//         .toList();
//     emit(AddressSelecting(
//       selectedProvinsi: provinsiId,
//       kabupaten: filteredRegencies,
//       kecamatan: [],
//       desa: [],
//       dusun: [],
//       selectedKabupaten: null,
//       selectedKecamatan: null,
//       selectedDesa: null,
//       selectedDusun: null,
//     ));
//   }

//   void pilihKabupaten(
//       String kabupatenId, List<KecamatanModel.Datum> semuaKecamatan) {
//     final kecamatanFiltering =
//         semuaKecamatan.where((k) => k.kabupatenKota.id == kabupatenId).toList();

//     emit(AddressSelecting(
//       selectedKabupaten: kabupatenId,
//       kecamatan: kecamatanFiltering,
//       desa: [],
//       dusun: [],
//       selectedKecamatan: null,
//       selectedDesa: null,
//       selectedDusun: null,
//     ));
//   }

//   void pilihKecamatan(String kecamatanId, List<DesaModel.Datum> semuaDesa) {
//     final desaFiltering =
//         semuaDesa.where((d) => d.kecamatan.id == kecamatanId).toList();

//     emit(AddressSelecting(
//       selectedKecamatan: kecamatanId,
//       desa: desaFiltering,
//       dusun: [],
//       selectedDusun: null,
//       selectedDesa: null,
//     ));
//   }

//   void pilihDesa(String desaId, List<DusunModel.Datum> semuaDusun) {
//     final dusunFiltering =
//         semuaDusun.where((d) => d.desaKelurahan.id == desaId).toList();

//     emit(AddressSelecting(
//       selectedDesa: desaId,
//       dusun: dusunFiltering,
//     ));
//   }
// }
