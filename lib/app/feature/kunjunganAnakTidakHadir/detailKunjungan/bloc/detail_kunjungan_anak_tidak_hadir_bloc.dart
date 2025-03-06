import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_kunjungan_anak_tidak_hadir_event.dart';
part 'detail_kunjungan_anak_tidak_hadir_state.dart';

class DetailKunjunganAnakTidakHadirBloc extends Bloc<DetailKunjunganAnakTidakHadirEvent, DetailKunjunganAnakTidakHadirState> {
  DetailKunjunganAnakTidakHadirBloc() : super(DetailKunjunganAnakTidakHadirInitial()) {
    on<DetailKunjunganAnakTidakHadirEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
