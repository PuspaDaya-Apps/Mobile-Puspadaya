import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationFalse()) {
    on<AuthorizationEvent>((event, emit) {});

    on<AuthorizationFalseEvent>((event, emit) {
      debugPrint("step 3");
      SharedPrefUtils().removeAccessToken();
      SharedPrefUtils().removeRefreshToken();
      emit(AuthorizationFalse());
    });

    on<AuthorizationTrueEvent>((event, emit) {
      emit(AuthorizationTrue());
    });
  }
}
