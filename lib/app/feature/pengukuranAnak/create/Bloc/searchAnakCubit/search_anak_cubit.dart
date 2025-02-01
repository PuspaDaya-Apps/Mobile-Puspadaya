import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_anak_state.dart';

class SearchAnakCubit extends Cubit<SearchAnakState> {
  SearchAnakCubit() : super(SearchAnakInitial());

  void selectAnak(String name, String nik) {
    emit(SearchAnakSelected(name, nik));
  }
}
