import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'perbarui_kunjungan_ibu_hamil_event.dart';
part 'perbarui_kunjungan_ibu_hamil_state.dart';

class PerbaruiKunjunganIbuHamilBloc extends Bloc<PerbaruiKunjunganIbuHamilEvent, PerbaruiKunjunganIbuHamilState> {
  PerbaruiKunjunganIbuHamilBloc() : super(PerbaruiKunjunganIbuHamilInitial()) {
    on<PerbaruiKunjunganIbuHamilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
