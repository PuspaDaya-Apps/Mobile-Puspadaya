import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/refreshtoken_model.dart';
import '../../model/logout_response_model.dart';
import '../../service/authentication_api.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});

    on<AppStartEvent>(appStart);

    on<ResetState>((event, emit) {
      emit(AuthenticationInitial());
    });

    on<OnBoardingDoneEvent>((event, emit) {
      SharedPrefUtils().storedOnBoarding();
    });

    on<LogoutEvent>(logout);
  }

  Future<void> appStart (AppStartEvent event, Emitter<AuthenticationState> emit) async {

    bool? onBordingValue = await SharedPrefUtils().getOnBoarding();

    if(onBordingValue == null) {
      emit(AuthenticationFirstTime());
    } else {
      String? refreshTokenValue = await SharedPrefUtils().getRefreshToken();
      
      if (refreshTokenValue == null) {
        emit(AuthenticationFalse());
      } else {
        RefreshTokenModel refreshTokenModel = RefreshTokenModel.fromJson(jsonDecode(refreshTokenValue));
        
        if(refreshTokenModel.refreshExpiredAt.isBefore(DateTime.timestamp())) {
          emit(AuthenticationFalse());
        } else {
          emit(AuthenticationTrue());
        }
      }

    }
    
    // await SharedPrefUtils().getOnBoarding().then((valueOnBoarding) async{
    //   if (valueOnBoarding == null) {
        
    //   } else {
    //     await SharedPrefUtils().getRefreshToken().then((valueRefreshToken) {
    //       if (valueRefreshToken != null) {
    //         RefreshTokenModel refreshTokenModel = RefreshTokenModel.fromJson(json.decode(valueRefreshToken));

    //         debugPrint(refreshTokenModel.refreshExpiredAt.toString());

    //         if (refreshTokenModel.refreshExpiredAt.isBefore(DateTime.now())) {
    //           emit(AuthenticationFalse());
    //         } else {
    //           emit(AuthenticationTrue());
    //         }
    //       } else {
    //         emit(AuthenticationFalse());
    //       }          
    //     });
    //   }
    // });
  }

  Future<void> logout (LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(LogoutProcess());
    
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
