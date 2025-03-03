import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simpan_kunjungan_ibu_hamil_event.dart';
part 'simpan_kunjungan_ibu_hamil_state.dart';

class SimpanKunjunganIbuHamilBloc extends Bloc<SimpanKunjunganIbuHamilEvent, SimpanKunjunganIbuHamilState> {
  SimpanKunjunganIbuHamilBloc() : super(SimpanKunjunganIbuHamilInitial()) {
    on<SimpanKunjunganIbuHamilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
