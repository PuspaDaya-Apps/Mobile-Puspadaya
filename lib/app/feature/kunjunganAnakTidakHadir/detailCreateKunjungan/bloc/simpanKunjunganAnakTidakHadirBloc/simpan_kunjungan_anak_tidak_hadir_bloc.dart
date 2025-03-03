import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simpan_kunjungan_anak_tidak_hadir_event.dart';
part 'simpan_kunjungan_anak_tidak_hadir_state.dart';

class SimpanKunjunganAnakTidakHadirBloc extends Bloc<SimpanKunjunganAnakTidakHadirEvent, SimpanKunjunganAnakTidakHadirState> {
  SimpanKunjunganAnakTidakHadirBloc() : super(SimpanKunjunganAnakTidakHadirInitial()) {
    on<SimpanKunjunganAnakTidakHadirEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
