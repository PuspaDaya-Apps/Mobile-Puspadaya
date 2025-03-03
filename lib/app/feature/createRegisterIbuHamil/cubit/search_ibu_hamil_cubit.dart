import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_ibu_hamil_state.dart';

class SearchIbuHamilCubit extends Cubit<SearchIbuHamilState> {
  SearchIbuHamilCubit() : super(SearchIbuHamilInitial());

  void selectIbuHamil({
    required String namaIbu,
    required String usia,
    required String nik,
    required String namaSuami,
    required String ibuId,
  }) {
    emit(SearchIbuHamilSelected(namaIbu, usia, nik, namaSuami, ibuId));
  }
}
