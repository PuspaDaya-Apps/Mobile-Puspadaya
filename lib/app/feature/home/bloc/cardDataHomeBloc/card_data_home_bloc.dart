import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/card_home_response_model.dart';
import '../../service/home_api.dart';

part 'card_data_home_event.dart';
part 'card_data_home_state.dart';

class CardDataHomeBloc extends Bloc<CardDataHomeEvent, CardDataHomeState> {
  CardDataHomeBloc() : super(CardDataHomeProcessState()) {
    on<CardDataHomeEvent>((event, emit) {});

    on<GetCardHome>(getCardHome);
  }

  Future<void> getCardHome (GetCardHome event, Emitter<CardDataHomeState>emit) async {
    emit(CardDataHomeProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(CardDataHomeTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await HomeApi().getCardHomeService(accessToken);

        int statusCode = response[0] as int;
        final CardHomeResponseModel cardHomeResponseModel = CardHomeResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(CardDataHomeSuccessState(cardHomeResponseModel));
        } else if (statusCode == 401) {
          emit(CardDataHomeTokenExpiredState());
        } else {
          emit(CardDataHomeFailedState(cardHomeResponseModel.message));
        }
      } catch (error) {
        debugPrint(error.toString());
        emit(CardDataHomeFailedState(error.toString()));
      }
    }
  }
}
