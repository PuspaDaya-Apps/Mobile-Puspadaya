import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/notification_response_model.dart';
import '../service/notification_api.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});

    on<GetNotification>(getNotification);
  }

  Future<void> getNotification (GetNotification event, Emitter<NotificationState> emit) async {
    emit(NotificationProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(NotificationTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await NotificationApi().getNotificationApi(accessToken);

        int statusCode = response[0] as int;
        final NotificationResponseModel notificationResponseModel = NotificationResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(NotificationSuccessState(notificationResponseModel));
        } else if (statusCode == 401) {
          emit(NotificationTokenExpiredState());
        } else {
          emit(NotificationFailedState(notificationResponseModel.message));
        }
      } catch (error) {
        emit(NotificationFailedState(error.toString()));
      }
    }
  }
}
