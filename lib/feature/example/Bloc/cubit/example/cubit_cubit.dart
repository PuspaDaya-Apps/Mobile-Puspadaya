import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(CubitInitial());
}
