import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tugas_kunjungan_ibu_hamil_event.dart';
part 'tugas_kunjungan_ibu_hamil_state.dart';

class TugasKunjunganIbuHamilBloc extends Bloc<TugasKunjunganIbuHamilEvent, TugasKunjunganIbuHamilState> {
  TugasKunjunganIbuHamilBloc() : super(TugasKunjunganIbuHamilInitial()) {
    on<TugasKunjunganIbuHamilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
