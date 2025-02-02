import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/get_beban_kerja_item_response_model.dart';
import '../../service/create_beban_kerja_api.dart';

part 'beban_kerja_item_event.dart';
part 'beban_kerja_item_state.dart';

class BebanKerjaItemBloc extends Bloc<BebanKerjaItemEvent, BebanKerjaItemState> {
  BebanKerjaItemBloc() : super(BebanKerjaItemInitial()) {
    on<BebanKerjaItemEvent>((event, emit) {});

    on<GetBebanKerjaItem>(getBebanKerjaItem);
  }

  Future<void> getBebanKerjaItem (GetBebanKerjaItem event, Emitter<BebanKerjaItemState> emit) async {
    emit(BebanKerjaItemProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(BebanKerjaItemTokenExpiredState());
    } else {
      try {
        List<dynamic> response = await CreateBebanKerjaApi().getBebanKerjaItemService(accessToken);

        int statusCode = response[0] as int;
        final GetBebanKerjaItemResponseModel getBebanKerjaItemResponseModel = GetBebanKerjaItemResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          emit(BebanKerjaItemSuccessState(getBebanKerjaItemResponseModel));
        } else if (statusCode == 401) {
          emit(BebanKerjaItemTokenExpiredState());
        } else {
          emit(BebanKerjaItemFailedState(getBebanKerjaItemResponseModel.message));
        }
      } catch (error) {
        emit(BebanKerjaItemFailedState(error.toString()));
      }
    }
  }
}
