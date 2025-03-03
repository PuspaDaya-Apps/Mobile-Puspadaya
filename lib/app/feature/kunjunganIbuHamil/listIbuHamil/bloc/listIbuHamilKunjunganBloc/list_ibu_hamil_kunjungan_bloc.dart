import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_ibu_hamil_kunjungan_event.dart';
part 'list_ibu_hamil_kunjungan_state.dart';

class ListIbuHamilKunjunganBloc extends Bloc<ListIbuHamilKunjunganEvent, ListIbuHamilKunjunganState> {
  ListIbuHamilKunjunganBloc() : super(ListIbuHamilKunjunganInitial()) {
    on<ListIbuHamilKunjunganEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
