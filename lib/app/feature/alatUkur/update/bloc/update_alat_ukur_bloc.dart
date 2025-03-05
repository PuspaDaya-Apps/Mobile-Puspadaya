import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_alat_ukur_event.dart';
part 'update_alat_ukur_state.dart';

class UpdateAlatUkurBloc extends Bloc<UpdateAlatUkurEvent, UpdateAlatUkurState> {
  UpdateAlatUkurBloc() : super(UpdateAlatUkurInitial()) {
    on<UpdateAlatUkurEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
