import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_kk_state.dart';

class SearchKKCubit extends Cubit<SearchKKState> {
  SearchKKCubit() : super(SearchKKInitial());

  void selectKK(String nomorKK, String namaAyah, String namaIbu) {
    emit(SearchKKSelected(nomorKK, namaAyah, namaIbu));
  }
}
