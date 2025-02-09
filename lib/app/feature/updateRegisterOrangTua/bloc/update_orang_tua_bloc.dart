import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_orang_tua_event.dart';
part 'update_orang_tua_state.dart';

class UpdateOrangTuaBloc extends Bloc<UpdateOrangTuaEvent, UpdateOrangTuaState> {
  UpdateOrangTuaBloc() : super(UpdateOrangTuaInitial()) {
    on<UpdateOrangTuaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
