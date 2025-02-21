import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'index_kunjungan_event.dart';
part 'index_kunjungan_state.dart';

class IndexKunjunganBloc extends Bloc<IndexKunjunganEvent, IndexKunjunganState> {
  IndexKunjunganBloc() : super(IndexKunjunganInitial()) {
    on<IndexKunjunganEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
