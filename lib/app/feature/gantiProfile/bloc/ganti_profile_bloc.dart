import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/patch_ganti_profile.dart';

part 'ganti_profile_event.dart';
part 'ganti_profile_state.dart';

class GantiProfileBloc extends Bloc<GantiProfileEvent, GantiProfileState> {
  GantiProfileBloc() : super(GantiProfileInitial()) {
    on<GantiProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
