import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/refreshtoken_model.dart';
import '../../model/accesstoken_model.dart';
import '../../model/accesstoken_response_model.dart';
import '../../model/logout_response_model.dart';
import '../../service/authentication_api.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});

    on<AppStartEvent>(appStart);

    on<OnBoardingDoneEvent>((event, emit) {
      SharedPrefUtils().storedOnBoarding();
    });

    on<GetAccesTokenEvent>(getAccesToken);

    on<LogoutEvent>(logout);
  }

  Future<void> appStart (AppStartEvent event, Emitter<AuthenticationState> emit) async {
    
    await SharedPrefUtils().getOnBoarding().then((valueOnBoarding) async{
      if (valueOnBoarding == null) {
        emit(AuthenticationFirstTime());
      } else {
        await SharedPrefUtils().getRefreshToken().then((valueRefreshToken) {
          if (valueRefreshToken != null) {
            RefreshTokenModel refreshTokenModel = RefreshTokenModel.fromJson(json.decode(valueRefreshToken));

            debugPrint(refreshTokenModel.refreshExpiredAt.toString());

            if (refreshTokenModel.refreshExpiredAt.isBefore(DateTime.now())) {
              emit(AuthenticationFalse());
            } else {
              emit(AuthenticationTrue());
            }
          } else {
            emit(AuthenticationFalse());
          }          
        });
      }
    });
  }

  Future<void> getAccesToken (GetAccesTokenEvent event, Emitter<AuthenticationState> emit) async {
   
    await SharedPrefUtils().getRefreshToken().then((valueRefreshToken) async {
      if (valueRefreshToken == null) {
        emit(AuthenticationFalse());
      } else {
        RefreshTokenModel refreshTokenModel = RefreshTokenModel.fromJson(json.decode(valueRefreshToken));

        try {
          List<dynamic> response = await AuthenticationApi().getAccesTokenService(
            AccessTokenModel(refreshToken: refreshTokenModel.refreshToken)
          );

          int statusCode = response[0] as int;
          AccessTokenResponseModel accessTokenResponseModel = AccessTokenResponseModel.fromJson(response[1]);

          if(statusCode == 200) {
            SharedPrefUtils().storedAccessToken(accessTokenResponseModel.data!.accessToken);
            emit(RefreshTokenValid());
          } else if (statusCode == 401) {
            emit(AuthenticationFalse());
          } else {
            emit(RefreshTokenFailed(accessTokenResponseModel.message));
          }
        } catch (error) {
          emit(RefreshTokenFailed(error.toString()));
        }
      }
    });
  }

  Future<void> logout (LogoutEvent event, Emitter<AuthenticationState> emit) async {
    
    await SharedPrefUtils().getAccessToken().then((valueAccessToken) async {
      if (valueAccessToken == null) {
        emit(AuthenticationFalse());
      } else {
        try {
          List<dynamic> response = await AuthenticationApi().logoutService(valueAccessToken);

          int statusCode = response[0] as int;
          LogoutResponseModel logoutResponseModel = LogoutResponseModel.fromJson(response[1]);

          if (statusCode == 200) {
            emit(LogoutSuccess());
          } else if (statusCode == 401) {
            emit(AuthenticationFalse());
          } else {
            emit(LogoutFailed(logoutResponseModel.message));
          }
        } catch (error) {
          emit(LogoutFailed(error.toString()));
        }
      }
    });
  }

}
