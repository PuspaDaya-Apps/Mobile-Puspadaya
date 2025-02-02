import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_register_orang_tua_event.dart';
part 'create_register_orang_tua_state.dart';

class CreateRegisterOrangTuaBloc
    extends Bloc<CreateRegisterOrangTuaEvent, CreateRegisterOrangTuaState> {
  CreateRegisterOrangTuaBloc() : super(CreateRegisterOrangTuaInitial()) {
    on<CreateRegisterOrangTuaEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SendRegisterOrangTua>(registerOrangTua);
  }
  Future<void> registerOrangTua(SendRegisterOrangTua event,
      Emitter<CreateRegisterOrangTuaState> emit) async {
    try {} catch (e) {}
  }
}
