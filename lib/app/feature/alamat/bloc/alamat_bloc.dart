import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alamat_event.dart';
part 'alamat_state.dart';

class AlamatBloc extends Bloc<AlamatEvent, AlamatState> {
  AlamatBloc() : super(AlamatInitial()) {
    on<AlamatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
