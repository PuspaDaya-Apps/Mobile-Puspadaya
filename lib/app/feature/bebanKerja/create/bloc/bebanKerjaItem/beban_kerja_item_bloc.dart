import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/JobItems.dart';
import '../../model/get_beban_kerja_item_response_model.dart';
import '../../service/create_beban_kerja_api.dart';

part 'beban_kerja_item_event.dart';
part 'beban_kerja_item_state.dart';

class BebanKerjaItemBloc extends Bloc<BebanKerjaItemEvent, BebanKerjaItemState> {
  BebanKerjaItemBloc() : super(BebanKerjaItemInitial()) {
    on<BebanKerjaItemEvent>((event, emit) {});

    on<GetBebanKerjaItem>(getBebanKerjaItem);
  }

  Future<void> getBebanKerjaItem (GetBebanKerjaItem event, Emitter<BebanKerjaItemState> emit) async {
    emit(BebanKerjaItemProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(BebanKerjaItemTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await CreateBebanKerjaApi().getBebanKerjaItemService(accessToken);

        int statusCode = response[0] as int;
        final GetBebanKerjaItemResponseModel getBebanKerjaItemResponseModel = GetBebanKerjaItemResponseModel.fromJson(response[1]);

        if(statusCode == 200) {

          //! temp
          List<Jobitems> administrasi = [];
          List<Jobitems> keterampilanBayidanBalita= [];
          List<Jobitems> keterampilanIbuHamilDanMenyusui = [];
          List<Jobitems> keterampilan = [];
          List<Jobitems> tambahan = [];
          List<Jobitems> tugasTambahan = [];

          List<Data> temp = getBebanKerjaItemResponseModel.data!;

          for (var value in temp) {
            if(value.kategori == "Administrasi") {
              administrasi.add(
                Jobitems(
                  id: value.id,
                  label: value.namakompetensi,
                  bobot: value.bobotNilai,
                  status: false,
                )
              );
            }
            if(value.kategori == "Keterampilan Bayi dan Balita") {
              keterampilanBayidanBalita.add(
                Jobitems(
                  id: value.id,
                  label: value.namakompetensi,
                  bobot: value.bobotNilai,
                  status: false,
                )
              );
            }
            if(value.kategori == "Keterampilan Ibu Hamil dan Menyusui") {
              keterampilanIbuHamilDanMenyusui.add(
                Jobitems(
                  id: value.id,
                  label: value.namakompetensi,
                  bobot: value.bobotNilai,
                  status: false,
                )
              );
            }
            if(value.kategori == "Keterampilan") {
              keterampilan.add(
                Jobitems(
                  id: value.id,
                  label: value.namakompetensi,
                  bobot: value.bobotNilai,
                  status: false,
                )
              );
            }
            if(value.kategori == "Tambahan") {
              tambahan.add(
                Jobitems(
                  id: value.id,
                  label: value.namakompetensi,
                  bobot: value.bobotNilai,
                  status: false,
                )
              );
            }
            if(value.kategori == "Tugas Tambahan") {
              tugasTambahan.add(
                Jobitems(
                  id: value.id,
                  label: value.namakompetensi,
                  bobot: value.bobotNilai,
                  status: false,
                )
              );
            }
          }

          emit(BebanKerjaItemSuccessState(
            [
              Jobitems(
                label: "Administrasi", 
                status: false,
                isExpanded: false,
                subItems: administrasi,
              ),
              Jobitems(
                label: "Keterampilan Bayi dan Balita", 
                status: false,
                isExpanded: false,
                subItems: keterampilanBayidanBalita,
              ),
              Jobitems(
                label: "Keterampilan Ibu Hamil dan Menyusui", 
                status: false,
                isExpanded: false,
                subItems: keterampilanIbuHamilDanMenyusui,
              ),
              Jobitems(
                label: "Keterampilan", 
                status: false,
                isExpanded: false,
                subItems: keterampilan,
              ),
              Jobitems(
                label: "Tambahan", 
                status: false,
                isExpanded: false,
                subItems: tambahan,
              ),
              Jobitems(
                label: "Tugas Tambahan", 
                status: false,
                isExpanded: false,
                subItems: tugasTambahan,
              ),
            ]
          ));

          //!||||||||||||||||||||||||||||||| 
          //List<Jobitems> balita = [];
          // List<Jobitems> ibuHamilDanMenyususui = [];
          // List<Jobitems> kunjunganRumah = [];
          // List<Jobitems> tugasTambahan = [];

          // List<Data> temp = getBebanKerjaItemResponseModel.data!;

          // for (var value in temp) {
          //   if(value.jenisKompetensi == "Balita") {
          //     balita.add(
          //       Jobitems(
          //         id: value.id,
          //         label: value.namakompetensi,
          //         bobot: value.bobotNilai,
          //         status: false,
          //       )
          //     );
          //   }
          //   if(value.jenisKompetensi == "Ibu Hamil dan Menyusui") {
          //     ibuHamilDanMenyususui.add(
          //       Jobitems(
          //         id: value.id,
          //         label: value.namakompetensi,
          //         bobot: value.bobotNilai,
          //         status: false,
          //       )
          //     );
          //   }
          //   if(value.jenisKompetensi == "Kunjungan Rumah") {
          //     kunjunganRumah.add(
          //       Jobitems(
          //         id: value.id,
          //         label: value.namakompetensi,
          //         bobot: value.bobotNilai,
          //         status: false,
          //       )
          //     );
          //   }
          //   if(value.jenisKompetensi == "Tugas Tambahan") {
          //     tugasTambahan.add(
          //       Jobitems(
          //         id: value.id,
          //         label: value.namakompetensi,
          //         bobot: value.bobotNilai,
          //         status: false,
          //       )
          //     );
          //   }
          // } 

          // emit(BebanKerjaItemSuccessState([
          //     Jobitems(
          //       label: "Balita", 
          //       status: false,
          //       isExpanded: false,
          //       subItems: balita,
          //     ),
          //     Jobitems(
          //       label: "Ibu Hamil dan Menyusui", 
          //       status: false,
          //       isExpanded: false,
          //       subItems: ibuHamilDanMenyususui,
          //     ),
          //     Jobitems(
          //       label: "Kunjungan Rumah ", 
          //       status: false,
          //       isExpanded: false,
          //       subItems: kunjunganRumah,
          //     ),
          //     Jobitems(
          //       label: "Tugas Tambahan", 
          //       status: false,
          //       isExpanded: false,
          //       subItems: tugasTambahan,
          //     ),
          //   ]
          // ));
        
        } else if (statusCode == 401) {
          emit(BebanKerjaItemTokenExpiredState());
        } else {
          emit(BebanKerjaItemFailedState(getBebanKerjaItemResponseModel.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(BebanKerjaItemFailedState(error.toString()));
      }
    }
  }
}
