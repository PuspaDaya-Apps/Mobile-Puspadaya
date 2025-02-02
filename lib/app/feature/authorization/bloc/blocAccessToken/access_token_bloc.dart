import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'access_token_event.dart';
part 'access_token_state.dart';

class AccessTokenBloc extends Bloc<AccessTokenEvent, AccessTokenState> {
  AccessTokenBloc() : super(AccessTokenInitial()) {
    on<AccessTokenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
