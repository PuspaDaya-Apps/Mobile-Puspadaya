import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/post_orang_tua_body.dart' as post_orang_tua;
part 'orang_tua_form_state.dart';

class OrangTuaFormCubit extends Cubit<OrangTuaFormState> {
  OrangTuaFormCubit() : super(OrangTuaLoaded  ());

  void updateAyah(post_orang_tua.Ayah ayah) {
    final currentState = state;
    if (currentState is OrangTuaLoaded) {
      emit(currentState.copyWith(ayah: ayah));
    }
  }

  void updateIbu(post_orang_tua.Ibu ibu) {
    final currentState = state;
    if (currentState is OrangTuaLoaded) {
      emit(currentState.copyWith(ibu: ibu));
    }
  }

  post_orang_tua.PostOrangTuaBody getPostBody() {
    final currentState = state;
    if (currentState is OrangTuaLoaded &&
        currentState.ayah != null &&
        currentState.ibu != null) {
      return post_orang_tua.PostOrangTuaBody(
        ayah: currentState.ayah!,
        ibu: currentState.ibu!,
      );
    } else {
      throw Exception("Data ayah dan/atau ibu belum lengkap");
    }
  }
}
