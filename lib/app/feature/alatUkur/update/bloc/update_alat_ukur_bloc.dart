import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/alatUkur/create/bloc/create_alat_ukur_bloc.dart';
import 'package:puspadaya/app/feature/alatUkur/create/model/post_alat_ukur_alat_deteksi_dini_model.dart';

import '../../create/model/post_alat_ukur_model.dart';

part 'update_alat_ukur_event.dart';
part 'update_alat_ukur_state.dart';

class UpdateAlatUkurBloc extends Bloc<UpdateAlatUkurEvent, UpdateAlatUkurState> {
  UpdateAlatUkurBloc() : super(UpdateAlatUkurInitial()) {
    on<UpdateAlatUkurEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
