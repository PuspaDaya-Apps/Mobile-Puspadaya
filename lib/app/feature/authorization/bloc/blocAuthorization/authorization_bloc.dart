import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationInit()) {
    on<AuthorizationEvent>((event, emit) {});

    on<AuthorizationFalseEvent>((event, emit) async {
      emit(AuthorizationInit());
      debugPrint("step 3");
      SharedPrefUtils().removeAccessToken();
      SharedPrefUtils().removeRefreshToken();
      SharedPrefUtils().removeCurrentUser();
      SharedPrefUtils().removeJumlahWilayah();
      SharedPrefUtils().removeDataWilayah();
      SharedPrefUtils().removeAlatUkurAnak();
      SharedPrefUtils().removeAlatUkurIbuHamil();
      // logut external id 
      OneSignal.logout();

      debugPrint("step 4");
      emit(AuthorizationFalse());
    });

    on<AuthorizationTrueEvent>((event, emit) {
      emit(AuthorizationInit());
      emit(AuthorizationTrue());
    });
  }
}
