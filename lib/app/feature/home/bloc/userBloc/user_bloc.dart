import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../model/current_user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserProccessState()) {
    on<UserEvent>((event, emit) {});

    on<GetCurrentUser>(getCurrentUser);
  }

  Future<void> getCurrentUser (GetCurrentUser event, Emitter<UserState> emit) async {
    emit(UserProccessState());

    String? currentUserValue = await SharedPrefUtils().getCurrentUser();

    if(currentUserValue != null) {
      CurrentUserModel currentUserModel = CurrentUserModel.fromJson(json.decode(currentUserValue));

      emit(UserSuccessState(currentUserModel));
    } else {
      emit(UserFailedState());
    }
  }
}
