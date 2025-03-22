import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_kunjungan_ibu_hamil_event.dart';
part 'detail_kunjungan_ibu_hamil_state.dart';

class DetailKunjunganIbuHamilBloc extends Bloc<DetailKunjunganIbuHamilEvent, DetailKunjunganIbuHamilState> {
  DetailKunjunganIbuHamilBloc() : super(DetailKunjunganIbuHamilInitial()) {
    on<DetailKunjunganIbuHamilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
