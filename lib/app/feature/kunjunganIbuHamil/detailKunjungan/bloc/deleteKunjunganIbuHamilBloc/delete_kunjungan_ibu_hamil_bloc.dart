import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_kunjungan_ibu_hamil_event.dart';
part 'delete_kunjungan_ibu_hamil_state.dart';

class DeleteKunjunganIbuHamilBloc extends Bloc<DeleteKunjunganIbuHamilEvent, DeleteKunjunganIbuHamilState> {
  DeleteKunjunganIbuHamilBloc() : super(DeleteKunjunganIbuHamilInitial()) {
    on<DeleteKunjunganIbuHamilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
