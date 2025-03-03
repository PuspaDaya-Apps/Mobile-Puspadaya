import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'eppgbm_event.dart';
part 'eppgbm_state.dart';

class EppgbmBloc extends Bloc<EppgbmEvent, EppgbmState> {
  EppgbmBloc() : super(EppgbmInitial()) {
    on<EppgbmEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
