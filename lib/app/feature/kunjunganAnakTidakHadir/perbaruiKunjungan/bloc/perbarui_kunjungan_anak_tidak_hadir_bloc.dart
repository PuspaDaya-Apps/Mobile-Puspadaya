import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'perbarui_kunjungan_anak_tidak_hadir_event.dart';
part 'perbarui_kunjungan_anak_tidak_hadir_state.dart';

class PerbaruiKunjunganAnakTidakHadirBloc extends Bloc<PerbaruiKunjunganAnakTidakHadirEvent, PerbaruiKunjunganAnakTidakHadirState> {
  PerbaruiKunjunganAnakTidakHadirBloc() : super(PerbaruiKunjunganAnakTidakHadirInitial()) {
    on<PerbaruiKunjunganAnakTidakHadirEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
