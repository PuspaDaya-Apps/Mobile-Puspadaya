import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_kunjungan_anak_tidak_hadir_event.dart';
part 'create_kunjungan_anak_tidak_hadir_state.dart';

class CreateKunjunganAnakTidakHadirBloc extends Bloc<CreateKunjunganAnakTidakHadirEvent, CreateKunjunganAnakTidakHadirState> {
  CreateKunjunganAnakTidakHadirBloc() : super(CreateKunjunganAnakTidakHadirInitial()) {
    on<CreateKunjunganAnakTidakHadirEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
