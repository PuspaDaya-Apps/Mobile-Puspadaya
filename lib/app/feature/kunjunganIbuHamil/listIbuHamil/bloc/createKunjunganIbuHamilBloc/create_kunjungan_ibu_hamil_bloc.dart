import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_kunjungan_ibu_hamil_event.dart';
part 'create_kunjungan_ibu_hamil_state.dart';

class CreateKunjunganIbuHamilBloc extends Bloc<CreateKunjunganIbuHamilEvent, CreateKunjunganIbuHamilState> {
  CreateKunjunganIbuHamilBloc() : super(CreateKunjunganIbuHamilInitial()) {
    on<CreateKunjunganIbuHamilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
