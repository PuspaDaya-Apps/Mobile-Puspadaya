import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tugas_kunjungan_anak_tidak_hadir_event.dart';
part 'tugas_kunjungan_anak_tidak_hadir_state.dart';

class TugasKunjunganAnakTidakHadirBloc extends Bloc<TugasKunjunganAnakTidakHadirEvent, TugasKunjunganAnakTidakHadirState> {
  TugasKunjunganAnakTidakHadirBloc() : super(TugasKunjunganAnakTidakHadirInitial()) {
    on<TugasKunjunganAnakTidakHadirEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
