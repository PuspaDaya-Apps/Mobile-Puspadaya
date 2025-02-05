import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/alamat/service/get_alamat.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/get_provinsi_response.dart' as ProvinsiModel;
import '../model/get_kabupaten_response.dart' as KabupatenModel;
import '../model/get_kecamatan_response.dart' as KecamatanModel;
import '../model/get_desa_kelurahan_response.dart' as DesaKelurahanModel;
import '../model/get_dusun_response.dart' as DusunModel;

part 'alamat_event.dart';

part 'alamat_state.dart';

class AlamatBloc extends Bloc<AlamatEvent, AlamatState> {
  AlamatBloc() : super(AlamatInitial()) {
    on<ShowAllSectionEvent>(_onShowAllSection);
    on<SelectKabupaten>(_onSelectKabupaten);
    on<SelectKecamatan>(_onSelectKecamatan);
    on<SelectDesa>(_onSelectDesa);
    on<SelectDusun>(_onSelectDusun);
  }

  Future<void> _onShowAllSection(
      ShowAllSectionEvent event, Emitter<AlamatState> emit) async {
    emit(AlamatLoading());
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        List<dynamic> responseGetProvinsi =
            await GetAlamat().getProvinsi(accesTokenValue);
        List<dynamic> responseGetKabupaten =
            await GetAlamat().getKabupaten(accesTokenValue);
        List<dynamic> responseGetKecamatan =
            await GetAlamat().getKecamatan(accesTokenValue);
        List<dynamic> responseGetDesaKelurahan =
            await GetAlamat().getDesaKelurahan(accesTokenValue);
        List<dynamic> responseGetDusun =
            await GetAlamat().getDusun(accesTokenValue);

        int statusCode = responseGetProvinsi[0] as int;
        logger.d('statusCode ${statusCode}');

        if (statusCode == 200) {
          ProvinsiModel.GetProvinsiResponse getProvinsiResponse =
              ProvinsiModel.GetProvinsiResponse.fromJson(
                  responseGetProvinsi[1]);
          KabupatenModel.GetKabupatenResponse getKabupatenResponse =
              KabupatenModel.GetKabupatenResponse.fromJson(
                  responseGetKabupaten[1]);
          KecamatanModel.GetKecamatanResponse getKecamatanResponse =
              KecamatanModel.GetKecamatanResponse.fromJson(
                  responseGetKecamatan[1]);
          DesaKelurahanModel.GetDesaKelurahanResponse getDesaKelurahanResponse =
              DesaKelurahanModel.GetDesaKelurahanResponse.fromJson(
                  responseGetDesaKelurahan[1]);
          DusunModel.GetDusunResponse getDusunResponse =
              DusunModel.GetDusunResponse.fromJson(responseGetDusun[1]);
          List<ProvinsiModel.Datum> dataProvinsi = getProvinsiResponse.data;

          List<KabupatenModel.Datum> dataKabupaten = getKabupatenResponse.data;

          List<KecamatanModel.Datum> dataKecamatan = getKecamatanResponse.data;

          List<DesaKelurahanModel.Datum> dataDesaKelurahan =
              getDesaKelurahanResponse.data;

          List<DusunModel.Datum> dataDusun = getDusunResponse.data;

          // Emit state dengan data provinsi
          emit(ShowAllSection(
            provinsi: dataProvinsi,
            kabupaten: dataKabupaten,
            kecamatan: dataKecamatan,
            desaKelurahan: dataDesaKelurahan,
            dusun: dataDusun,
          ));
        }
      } catch (e) {
        emit(AlamatFailure(e.toString()));
      }
    }
  }

  void _onSelectKabupaten(
      SelectKabupaten event, Emitter<AlamatState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        final String provinsiId = event.idProvinsi; //get provinsi id
        List<dynamic> response =
            await GetAlamat().getKabupaten(accesTokenValue);
        int statusCode = response[0] as int;
        logger.d('statusCode ${statusCode}');

        if (statusCode == 200) {
          KabupatenModel.GetKabupatenResponse getKabupatenResponse =
              KabupatenModel.GetKabupatenResponse.fromJson(response[1]);

          // Filter kabupaten berdasarkan ID provinsi
          List<KabupatenModel.Datum> filteredKabupaten =
              getKabupatenResponse.data.where((kabupaten) {
            return kabupaten.provinsi.id == provinsiId; // Memeriksa ID provinsi
          }).toList();

          logger.d(
              'Filtered Kabupaten: ${filteredKabupaten.map((kabupaten) => kabupaten.namaKabupatenKota).toList()}');

          logger.d('provinsi =  ${filteredKabupaten}');

          // Emit state dengan data provinsi
          emit(ShowKabupaten(filteredKabupaten));
        }
      } catch (e) {
        emit(AlamatFailure(e.toString()));
      }
    }
  }

  void _onSelectKecamatan(
      SelectKecamatan event, Emitter<AlamatState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    logger.d(accesTokenValue);

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        final String kabupatenId = event.idKabupaten; //get provinsi id
        List<dynamic> response =
            await GetAlamat().getKecamatan(accesTokenValue);
        int statusCode = response[0] as int;
        logger.d('statusCode ${statusCode}');

        if (statusCode == 200) {
          KecamatanModel.GetKecamatanResponse getKecamatanResponse =
              KecamatanModel.GetKecamatanResponse.fromJson(response[1]);

          // Filter kecamata berdasarkan ID kabupaten
          List<KecamatanModel.Datum> filteredKecamatan =
              getKecamatanResponse.data.where((kecamatan) {
            return kecamatan.kabupatenKota.id ==
                kabupatenId; // Memeriksa ID provinsi
          }).toList();

          logger.d(
              'Filtered Kabupaten: ${filteredKecamatan.map((kecamatan) => kecamatan.namaKecamatan).toList()}');

          logger.d('provinsi =  ${filteredKecamatan}');

          // Emit state dengan data provinsi
          emit(ShowKecamatan(filteredKecamatan));
        }
      } catch (e) {
        emit(AlamatFailure(e.toString()));
      }
    }
  }

  void _onSelectDesa(SelectDesa event, Emitter<AlamatState> emit) {
    emit(SelectedDesa(event.desa));
  }

  void _onSelectDusun(SelectDusun event, Emitter<AlamatState> emit) {
    emit(SelectedDusun(event.dusun));
  }
}
