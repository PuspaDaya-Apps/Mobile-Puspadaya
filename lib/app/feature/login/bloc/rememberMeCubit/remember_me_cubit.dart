import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/login_model.dart';

part 'remember_me_state.dart';

class RememberMeCubit extends Cubit<RememberMeState> {
  RememberMeCubit() : super(RememberMeInitial());

  Future<void> loadAccount () async {
    emit(LoadAccountProccessState());
      
    await SharedPrefUtils().getAccount().then((valueAccount) async {
      if(valueAccount == null) {
        emit(LoadAccountFailedState());
      } else {
        LoginModel loginModel = LoginModel.fromJson(json.decode(valueAccount));

        emit(LoadAccountSuccessState(loginModel));
      }
    });
  }
}
