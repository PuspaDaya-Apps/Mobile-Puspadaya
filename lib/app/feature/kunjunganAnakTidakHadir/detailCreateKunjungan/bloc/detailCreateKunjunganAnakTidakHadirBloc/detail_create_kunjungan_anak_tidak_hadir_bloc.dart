import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_create_kunjungan_anak_tidak_hadir_event.dart';
part 'detail_create_kunjungan_anak_tidak_hadir_state.dart';

class DetailCreateKunjunganAnakTidakHadirBloc extends Bloc<DetailCreateKunjunganAnakTidakHadirEvent, DetailCreateKunjunganAnakTidakHadirState> {
  DetailCreateKunjunganAnakTidakHadirBloc() : super(DetailCreateKunjunganAnakTidakHadirInitial()) {
    on<DetailCreateKunjunganAnakTidakHadirEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
