import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/current_user_model.dart';
import '../model/index_beban_kerja_response_model.dart';
import '../service/index_beban_kerja_api.dart';

part 'index_beban_kerja_event.dart';
part 'index_beban_kerja_state.dart';

class IndexBebanKerjaBloc extends Bloc<IndexBebanKerjaEvent, IndexBebanKerjaState> {
  IndexBebanKerjaBloc() : super(IndexBebanKerjaInitial()) {
    on<IndexBebanKerjaEvent>((event, emit) {});

    on<GetBebanKerjaEvent>(getBebanKerja);
  }

  Future<void> getBebanKerja (GetBebanKerjaEvent event, Emitter<IndexBebanKerjaState> emit) async {
    emit(IndexBebanKerjaProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();
    String? currentUser = await SharedPrefUtils().getCurrentUser();


    if(accessToken == null) {
      emit(IndexBebanKerjaTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await IndexBebanKerjaApi().indexBebanKerjaService(accessToken);

        int statusCode = response[0] as int;
        logger.d(response[1].toString());
        final IndexBebanKerjaResponseModel indexBebanKerjaResponseModel = IndexBebanKerjaResponseModel.fromJson(response[1]);
        
        if(statusCode == 200) {
          if(currentUser == null) {
            emit(const IndexBebanKerjaFailedState("Tidak dapat menemukan user"));
          } else {
            CurrentUserModel currentUserModel = CurrentUserModel.fromJson(json.decode(currentUser));

            emit(IndexBebanKerjaSuccessState(
              indexBebanKerjaResponseModel:  indexBebanKerjaResponseModel,
              posyandu: currentUserModel.posyandu.namaPosyandu
            ));
          }
        } else if (statusCode == 401) {
          emit(IndexBebanKerjaTokenExpiredState());
        } else {
          debugPrint("FAILED");
          emit(IndexBebanKerjaFailedState(indexBebanKerjaResponseModel.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(IndexBebanKerjaFailedState(error.toString()));
      }
    }
  }
}
