import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_create_kunjungan_ibu_hamil_event.dart';
part 'detail_create_kunjungan_ibu_hamil_state.dart';

class DetailCreateKunjunganIbuHamilBloc extends Bloc<DetailCreateKunjunganIbuHamilEvent, DetailCreateKunjunganIbuHamilState> {
  DetailCreateKunjunganIbuHamilBloc() : super(DetailCreateKunjunganIbuHamilInitial()) {
    on<DetailCreateKunjunganIbuHamilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
