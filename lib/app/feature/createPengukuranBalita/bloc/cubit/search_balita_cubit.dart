import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_balita_state.dart';

class SearchBalitaCubit extends Cubit<SearchBalitaState> {
  SearchBalitaCubit() : super(SearchBalitaInitial());

  void selectBalita(String name) {
    emit(SearchBalitaSelected(name));
  }
}
