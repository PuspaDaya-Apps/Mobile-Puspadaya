import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../model/refreshtoken_model.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import '../service/login_api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<InitialLoginEvent>(initialLogin);

    on<SendLoginEvent>(login);

    on<NullErrorEvent>((event, emit) {
      emit(const NullErrorState("Username dan Password Tidak Boleh Kosong"));
    });
  }

  Future<void> initialLogin (LoginEvent event, Emitter<LoginState> emit) async {

    await SharedPrefUtils().getAccount().then((valueAccount) async {
      if(valueAccount == null) {
        emit(LoadAccountFailedState());
      } else {
        LoginModel loginModel = LoginModel.fromJson(json.decode(valueAccount));

        emit(LoadAccountSuccessState(loginModel));
      }
    });
  }

  Future<void> login (SendLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginProcessState());

    try {
      LoginResponseModel loginResponseModel = await LoginApi().loginService(event.loginModel);

      if(loginResponseModel.statusCode == 200) {
        if(event.rememberAccount) {
          SharedPrefUtils().storedAccount(json.encode(event.loginModel.toJson()));
        }

        SharedPrefUtils().storedAccessToken(loginResponseModel.data!.accessToken);
        SharedPrefUtils().storedRefreshToken(json.encode(RefreshTokenModel(
          refreshExpiredAt: loginResponseModel.data!.refreshExpiredAt,
          refreshToken: loginResponseModel.data!.refreshToken
        ).toJson()));
        
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState(loginResponseModel.message));
      }
    } catch (error) {
      emit(LoginFailedState(error.toString()));
    }
  }
}
