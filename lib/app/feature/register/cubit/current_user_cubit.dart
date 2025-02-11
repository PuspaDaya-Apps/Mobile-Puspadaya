import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../model/current_user_model.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  CurrentUserCubit() : super(CurrentUserInitial());

   Future<void> getCurrentUserModel () async {
    emit(CurrentUserProccessState());

    String? currentUserValue = await SharedPrefUtils().getCurrentUser();

    if(currentUserValue != null) {
      CurrentUserModel currentUserModel = CurrentUserModel.fromJson(json.decode(currentUserValue));

      emit(CurrentUserSuccessState(currentUserModel));
    } else {
      emit(CurrentUserFailedState());
    }
  }
}
