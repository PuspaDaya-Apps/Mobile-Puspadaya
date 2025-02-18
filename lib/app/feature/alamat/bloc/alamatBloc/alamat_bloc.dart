import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:puspadaya/app/feature/alamat/service/get_alamat.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/current_user_model.dart';
import '../../../../model/data_wilayah_model.dart';
import '../../../../model/jumlah_wilayah_model.dart';
import '../../model/get_desa_kelurahan_response.dart';
import '../../model/get_dusun_response.dart';
import '../../model/get_jumlah_wilayah_response_model.dart';
import '../../model/get_kabupaten_response.dart';
import '../../model/get_kecamatan_response.dart';
import '../../model/get_provinsi_response.dart';

part 'alamat_event.dart';

part 'alamat_state.dart';

class AlamatBloc extends Bloc<AlamatEvent, AlamatState> {
  AlamatBloc() : super(AlamatInitial()) {

    on<CheckAlamatEvent>(checkAlamat);
    
    on<GetAlamatEvent>(getAlamat);
  }

  Future<void> checkAlamat (CheckAlamatEvent event, Emitter<AlamatState> emit) async {
    emit(CheckAlamatProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();
    String? jumlahWilayah = await SharedPrefUtils().getJumlahWilayah();

    if(accessToken == null) {
      emit(AlamatTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await GetAlamatApi().getJumlahWilayah(accessToken);

        int statusCode = response[0] as int;
        final GetJumlahWilayahResponseModel getJumlahWilayahResponseModel = GetJumlahWilayahResponseModel.fromJson(response[1]);

        if (statusCode == 200) {
          if(jumlahWilayah == null) {
            debugPrint("jadwal not found");
            emit(CheckAlamatPerbaruiDataState());
          } {
            final JumlahWilayahModel jumlahWilayahModel = JumlahWilayahModel.fromJson(json.decode(jumlahWilayah!));

            if (
              getJumlahWilayahResponseModel.totalProvinsi == jumlahWilayahModel.totalProvinsi && 
              getJumlahWilayahResponseModel.totalKabupatenKota == jumlahWilayahModel.totalKabupatenKota &&
              getJumlahWilayahResponseModel.totalKecamatan == jumlahWilayahModel.totalKecamatan &&
              getJumlahWilayahResponseModel.totalDesaKelurahan == jumlahWilayahModel.totalDesaKelurahan &&
              getJumlahWilayahResponseModel.totalDusun == jumlahWilayahModel.totalDusun
            ) {
              debugPrint(" if success");
              emit(CheckAlamatDataValidState());
            } else {
              debugPrint(" if failed");
              emit(CheckAlamatPerbaruiDataState());
            }
          }
        } else if (statusCode == 401) {
          emit(AlamatTokenExpiredState());
        } else {
          emit(CheckAlamatFailedState(getJumlahWilayahResponseModel.message!));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(CheckAlamatFailedState(error.toString()));
      }
    }
    
  }
  
  Future<void> getAlamat (GetAlamatEvent event, Emitter<AlamatState> emit) async {
    emit(GetAlamatProccessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();
    String? getCurrentUser = await SharedPrefUtils().getCurrentUser();

    if(accessToken == null) {
      emit(AlamatTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await GetAlamatApi().getJumlahWilayah(accessToken);
        
        int statusCode = response[0] as int;
        final GetJumlahWilayahResponseModel getJumlahWilayahResponseModel = GetJumlahWilayahResponseModel.fromJson(response[1]);
        
        if(statusCode == 200) {
          SharedPrefUtils().storedJumlahWilayah(json.encode(
            JumlahWilayahModel(
              totalProvinsi: getJumlahWilayahResponseModel.totalProvinsi!,
              totalKabupatenKota: getJumlahWilayahResponseModel.totalKabupatenKota!,
              totalKecamatan: getJumlahWilayahResponseModel.totalKecamatan!,
              totalDesaKelurahan: getJumlahWilayahResponseModel.totalDesaKelurahan!,
              totalDusun: getJumlahWilayahResponseModel.totalDusun!,
            ).toJson()));

          List<dynamic> responseProvinsi = await GetAlamatApi().getProvinsi(accessToken, getJumlahWilayahResponseModel.totalProvinsi!);
          List<dynamic> responseKota = await GetAlamatApi().getKabupaten(accessToken, getJumlahWilayahResponseModel.totalKabupatenKota!);
          List<dynamic> responseKecamatan = await GetAlamatApi().getKecamatan(accessToken, getJumlahWilayahResponseModel.totalKecamatan!);
          List<dynamic> responseDesa = await GetAlamatApi().getDesaKelurahan(accessToken, getJumlahWilayahResponseModel.totalDesaKelurahan!);
          List<dynamic> responseDusun = await GetAlamatApi().getDusun(accessToken, getJumlahWilayahResponseModel.totalDusun!);

          int statusCodeProvinsi = responseProvinsi[0] as int;
          int statusCodeKota = responseKota[0] as int;
          int statusCodeKecamatan = responseKecamatan[0] as int;
          int statusCodeDesa = responseDesa[0] as int;
          int statusCodeDusun = responseDusun[0] as int;

          GetProvinsiResponse provinsi = GetProvinsiResponse.fromJson(responseProvinsi[1]);
          GetKabupatenResponse kabupatenKota = GetKabupatenResponse.fromJson(responseKota[1]);
          GetKecamatanResponse kecamatan = GetKecamatanResponse.fromJson(responseKecamatan[1]);
          GetDesaKelurahanResponse desaKelurahan = GetDesaKelurahanResponse.fromJson(responseDesa[1]);
          GetDusunResponse dusun = GetDusunResponse.fromJson(responseDusun[1]);

          if (statusCodeProvinsi == 200 &&
          statusCodeKota == 200 &&
          statusCodeKecamatan == 200 &&
          statusCodeDesa == 200 &&
          statusCodeDusun == 200
          ) {
            if(getCurrentUser != null) {
              CurrentUserModel currentUserModel = CurrentUserModel.fromJson(json.decode(getCurrentUser));

              debugPrint('maping data mulai');
              mapingDataToModel(
                currentUserModel, 
                provinsi: provinsi, 
                kabupatenKota: kabupatenKota, 
                kecamatan: kecamatan, 
                desaKelurahan: desaKelurahan, 
                dusun: dusun,
              );
              debugPrint('maping data selesai');
            } else {
              emit(AlamatUserNotFoundState());
            }
          } else {
            emit(const GetAlamatFailedState("gagal get data"));
          }


        } else if (statusCode == 401) {
          emit(AlamatTokenExpiredState());
        } else {
          debugPrint("FAILED");
          emit(GetAlamatFailedState(getJumlahWilayahResponseModel.message!));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(GetAlamatFailedState(error.toString()));
      }
    }
  } 

  Future<void> mapingDataToModel (
    CurrentUserModel currentUserModel,
    {
      required GetProvinsiResponse provinsi,
      required GetKabupatenResponse kabupatenKota,
      required GetKecamatanResponse kecamatan,
      required GetDesaKelurahanResponse desaKelurahan,
      required GetDusunResponse dusun
  }) async {

    try {
      DataWilayahModel dataWilayahModel = DataWilayahModel(
        provinsi : DataProvinsi(
          id: currentUserModel.provinsi.id,
          namaProvinsi: currentUserModel.provinsi.namaProvinsi,
          kodeProvinsi: '',
          kabupatenKota: []
        )
      );

      debugPrint("data provinsi");
      //provinsi
      for(var value in provinsi.data!) {
        if(value.id == currentUserModel.id) {
          dataWilayahModel = DataWilayahModel(
            provinsi: DataProvinsi(
              id: value.id, 
              namaProvinsi: value.namaProvinsi, 
              kodeProvinsi: value.kodeProvinsi, 
              kabupatenKota: []
            )
          );
        }
      }
      
      debugPrint("data kota");
      //kabupaten kota
      for(var value in kabupatenKota.data!) {
        if(value.provinsi.id == dataWilayahModel.provinsi.id) {
          dataWilayahModel.provinsi.kabupatenKota.add(
            DataKabupatenKota(
              id: value.id, 
              namaKabupatenKota: value.namaKabupatenKota, 
              kodeKabupatenKota: value.kodeKabupatenKota, 
              kecamatan: []
            )
          );
        }
      }

      debugPrint("data kecamatan");
      //kecamatam
      for(var valueStored in dataWilayahModel.provinsi.kabupatenKota) {
        for(var valueGet in kecamatan.data!) {
          if(valueGet.kabupatenKota.id == valueStored.id) {
            valueStored.kecamatan.add(
              DataKecamatan(
                id: valueGet.id, 
                namaKecamatan: valueGet.namaKecamatan, 
                kodeKecamatan: valueGet.kodeKecamatan, 
                desaKelurahan: []
              )
            );
          }
        }
      }
      
      debugPrint("data desa");
      //desa kelurahan
      for(var valueStoredKota in dataWilayahModel.provinsi.kabupatenKota) {
        for(var valueStoredkecamatan in valueStoredKota.kecamatan) {
          for(var valueGet in desaKelurahan.data!) {
            if(valueGet.kecamatan.id == valueStoredkecamatan.id) {
              valueStoredkecamatan.desaKelurahan.add(
                DataDesaKelurahan(
                  id: valueGet.id, 
                  namaDesaKelurahan: valueGet.namaDesaKelurahan, 
                  dusun: []
                )
              );
            }
          }
        }
      }

      debugPrint("data dusun");
      //dusun
      for(var valueStoredKota in dataWilayahModel.provinsi.kabupatenKota) {
        for(var valueStoredkecamatan in valueStoredKota.kecamatan) {
          for(var valueStoredDesa in valueStoredkecamatan.desaKelurahan) {
            for(var valueGet in dusun.data!) {
              if(valueGet.desaKelurahan.id == valueStoredDesa.id) {
                valueStoredDesa.dusun.add(
                  DataDusun(
                    id: valueGet.id, 
                    namaDusun: valueGet.namaDusun
                  )
                );
              }
            }
          }
        }
      }

      for(var valueStoredKota in dataWilayahModel.provinsi.kabupatenKota) {
        debugPrint ("##kota : ${valueStoredKota.namaKabupatenKota} kecamatan : ${valueStoredKota.kecamatan.length.toString()}##");
        for(var valueStoredkecamatan in valueStoredKota.kecamatan) {
          debugPrint ("##kecamtan : ${valueStoredkecamatan.namaKecamatan} desa : ${valueStoredkecamatan.desaKelurahan.length.toString()}##");
          for(var valueStoredDesa in valueStoredkecamatan.desaKelurahan) {
            debugPrint ("##desa : ${valueStoredDesa.namaDesaKelurahan} dusun : ${valueStoredDesa.dusun.length.toString()}##");
          }
        }
      }

      
      SharedPrefUtils().storedDataWilayah(json.encode(dataWilayahModel.toJson()));
      debugPrint("data selesai di maping");
    } catch (error) {
      debugPrint("error maping");
      debugPrint(error.toString());
    }
  } 
}
