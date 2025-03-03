import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_anak_tidak_hadir_kunjungan_event.dart';
part 'list_anak_tidak_hadir_kunjungan_state.dart';

class ListAnakTidakHadirKunjunganBloc extends Bloc<ListAnakTidakHadirKunjunganEvent, ListAnakTidakHadirKunjunganState> {
  ListAnakTidakHadirKunjunganBloc() : super(ListAnakTidakHadirKunjunganInitial()) {
    on<ListAnakTidakHadirKunjunganEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
