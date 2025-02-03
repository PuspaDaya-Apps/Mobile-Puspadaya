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
          // temp
          List<Jobitems> administrasi = [];
          List<Jobitems> keterampilanBayidanBalitaTugasLainnya = [];
          List<Jobitems> keterampilanIbuHamilDanMenyusui = [];
          List<Jobitems> tambahan = [];
          List<Jobitems> tugasLainnya = [];

          List<Data> temp = getBebanKerjaItemResponseModel.data!;

          for (var value in temp) {
            if(value.tipeTugas == "Administrasi") {
              administrasi.add(
                Jobitems(
                  id: value.id,
                  label: value.namaTugas,
                  bobot: value.bobot,
                  status: false,
                )
              );
            }
            if(value.tipeTugas == "Keterampilan Bayi dan Balita Tugas Lainnya") {
              keterampilanBayidanBalitaTugasLainnya.add(
                Jobitems(
                  id: value.id,
                  label: value.namaTugas,
                  bobot: value.bobot,
                  status: false,
                )
              );
            }
            if(value.tipeTugas == "Keterampilan Ibu Hamil dan Menyusui") {
              keterampilanIbuHamilDanMenyusui.add(
                Jobitems(
                  id: value.id,
                  label: value.namaTugas,
                  bobot: value.bobot,
                  status: false,
                )
              );
            }
            if(value.tipeTugas == "Tambahan") {
              tambahan.add(
                Jobitems(
                  id: value.id,
                  label: value.namaTugas,
                  bobot: value.bobot,
                  status: false,
                )
              );
            }
            if(value.tipeTugas == "Tugas Lainnya") {
              tugasLainnya.add(
                Jobitems(
                  id: value.id,
                  label: value.namaTugas,
                  bobot: value.bobot,
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
                label: "Keterampilan Bayi dan Balita Tugas Lainnya", 
                status: false,
                isExpanded: false,
                subItems: keterampilanBayidanBalitaTugasLainnya,
              ),
              Jobitems(
                label: "Keterampilan Ibu Hamil dan Menyusui", 
                status: false,
                isExpanded: false,
                subItems: keterampilanIbuHamilDanMenyusui,
              ),
              Jobitems(
                label: "Tambahan", 
                status: false,
                isExpanded: false,
                subItems: tambahan,
              ),
              Jobitems(
                label: "Tugas Lainnya", 
                status: false,
                isExpanded: false,
                subItems: tugasLainnya,
              ),
            ]
          ));
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
