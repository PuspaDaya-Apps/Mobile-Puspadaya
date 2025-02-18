import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alamat_save_state.dart';

class AlamatSaveCubit extends Cubit<AlamatSaveState> {
  AlamatSaveCubit() : super(AlamatSaveInitial());
}
