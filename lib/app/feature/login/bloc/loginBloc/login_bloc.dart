import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:puspadaya/config/validator/validation_error_model.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/refreshtoken_model.dart';
import '../../model/get_current_user_response_model.dart';
import '../../model/login_model.dart';
import '../../model/login_response_model.dart';
import '../../service/login_api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<SendLoginEvent>(login);

    on<NullErrorEvent>((event, emit) {
      emit(const NullErrorState("Username dan Password Tidak Boleh Kosong"));
    });

    on<GetCurrentUserEvent>(getCurrentUser);
    on<ResetFormEvent>((event, emit) => emit(LoginInitial()));
  }

  Future<void> login(SendLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginProcessState());

    try {
      List<dynamic> response = await LoginApi().loginService(event.loginModel);

      int statusCode = response[0] as int;
      debugPrint('status code = ${statusCode.toString()}');
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response[1]);
      debugPrint(loginResponseModel.toString());

      if (statusCode == 200) {
        if (event.rememberAccount) {
          SharedPrefUtils()
              .storedAccount(json.encode(event.loginModel.toJson()));
        }

        SharedPrefUtils()
            .storedAccessToken(loginResponseModel.data!.accessToken);
        SharedPrefUtils().storedRefreshToken(json.encode(RefreshTokenModel(
                refreshExpiredAt: loginResponseModel.data!.refreshExpiredAt,
                refreshToken: loginResponseModel.data!.refreshToken)
            .toJson()));

        emit(LoginSuccessState(loginResponseModel.data!.accessToken));
      } else if (statusCode == 400) {
        logger.e("error 400 login");
        ValidationErrorModel validationError =
            ValidationErrorModel.fromJson(response[1]);
        if (validationError.errors == null) {
          logger.d('validationError.message = ${validationError.message}');
          emit(LoginFailedState(validationError.message));
        } else {
          logger.d('validationError.errors = ${validationError.errors}');
          emit(LoginFailedFormState(validationError.errors));
        }
      } else {
        emit(LoginFailedState(loginResponseModel.message));
      }
    } catch (error) {
      debugPrint(error.toString());
      emit(LoginFailedState(error.toString()));
    }
  }

  Future<void> getCurrentUser(
      GetCurrentUserEvent event, Emitter<LoginState> emit) async {
    emit(CurrentUserProccesState());

    try {
      List<dynamic> response =
          await LoginApi().getCurrentUserService(event.accessToken);

      int statusCode = response[0] as int;
      GetCurrentUserResponseModel getCurrentUserResponseModel =
          GetCurrentUserResponseModel.fromJson(response[1]);

      if (statusCode == 200) {
        SharedPrefUtils().storedCurrentUser(
            jsonEncode(getCurrentUserResponseModel.data!.toJson()));

        // subject id ketika login agar onesignal bisa memberikan informasi norifikasi berdasarkan id user
        OneSignal.login(getCurrentUserResponseModel.data!.id);
        String? externalId = await OneSignal.User.getExternalId();
        logger.d(externalId);

        emit(CurrentUserSuccesState());
      } else {
        emit(CurrentUserFailedState(getCurrentUserResponseModel.message));
      }
    } catch (error) {
      emit(CurrentUserFailedState(error.toString()));
    }
  }
}
