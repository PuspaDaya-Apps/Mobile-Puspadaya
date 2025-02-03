import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/bebanKerja/create/model/JobItems.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/create_beban_kerja_model.dart';
import '../../model/create_beban_kerja_response_model.dart';
import '../../service/create_beban_kerja_api.dart';

part 'create_beban_kerja_event.dart';
part 'create_beban_kerja_state.dart';

class CreateBebanKerjaBloc extends Bloc<CreateBebanKerjaEvent, CreateBebanKerjaState> {
  CreateBebanKerjaBloc() : super(CreateBebanKerjaInitial()) {
    on<CreateBebanKerjaEvent>((event, emit) {});

    on<SendBebanKerjaEvent>(sendBebanKerja);

    on<NullErrorEvent>((event, emit) {
      emit(const CreateBebanKerjaNullErrorState("Form penilaian mandiri tidak boleh kosong"));
    });
  }

  Future<void> sendBebanKerja (SendBebanKerjaEvent event, Emitter<CreateBebanKerjaState> emit ) async {
    emit(CreateBebanKerjaProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CreateBebanKerjaTokenExpiredState());
    } else {
      try {
        List<String> itemBebanKerjaId = [];

        for (var value1 in event.item) {
          for (var value2 in value1.subItems!) {
            if(value2.status) {
              itemBebanKerjaId.add(value2.id!);
            }
          }
        }
        
        debugPrint(DateFormat("y-MM", 'id_ID').format(DateTime.now()));
        

        List<dynamic> response = await CreateBebanKerjaApi().createBebanKerjaService(
          accessToken,
          CreateBebanKerjaModel(
            bulan: DateFormat("y-MM", 'id_ID').format(DateTime(2024,02,20,12,23,21)),
            // bulan: DateFormat("y-MM", 'id_ID').format(DateTime.now()),
            tugasDikerjakan: itemBebanKerjaId
          )
        );

        int statusCode = response[0] as int;
        final CreateBebanKerjaResponseModel createBebanKerjaResponseModel = CreateBebanKerjaResponseModel.fromJson(response[1]);

        if(statusCode == 201) {
          emit(CreateBebanKerjaSuccesState(createBebanKerjaResponseModel));
        } else if (statusCode == 401) {
          emit(CreateBebanKerjaTokenExpiredState());
        } else {
          emit(CreateBebanKerjaFailedState(createBebanKerjaResponseModel.message));
        }
      } catch (error) {
        emit(CreateBebanKerjaFailedState(error.toString()));
      }
    }
  }
}
