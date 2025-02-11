import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lupa_kata_sandi_event.dart';
part 'lupa_kata_sandi_state.dart';

class LupaKataSandiBloc extends Bloc<LupaKataSandiEvent, LupaKataSandiState> {
  LupaKataSandiBloc() : super(LupaKataSandiInitial()) {
    on<LupaKataSandiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
