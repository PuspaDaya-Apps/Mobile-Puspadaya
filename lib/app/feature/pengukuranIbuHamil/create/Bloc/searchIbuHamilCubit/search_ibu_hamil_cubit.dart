import 'package:bloc/bloc.dart';
import 'search_ibu_hamil_state.dart';

class SearchIbuHamilCubit extends Cubit<SearchIbuHamilState> {
  SearchIbuHamilCubit() : super(SearchIbuHamilInitial());

  void selectIbuHamil(String name, String nik) {
    emit(SearchIbuHamilSelected(name, nik));
  }
}
