import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/DetailRegisterOrangTua/bloc/detail_register_orang_tua_bloc.dart';
import '../service/create_register_orang_tua_api.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../model/post_orang_tua_body.dart' as PostOrangTuaBody;

part 'create_register_orang_tua_event.dart';
part 'create_register_orang_tua_state.dart';

class CreateRegisterOrangTuaBloc
    extends Bloc<CreateRegisterOrangTuaEvent, CreateRegisterOrangTuaState> {
  CreateRegisterOrangTuaBloc() : super(CreateRegisterOrangTuaInitial()) {
    on<CreateRegisterOrangTuaEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SendRegisterOrangTua>(registerOrangTua);
  }
  Future<void> registerOrangTua(SendRegisterOrangTua event,
      Emitter<CreateRegisterOrangTuaState> emit) async {
    final accesTokenValue = await SharedPrefUtils().getAccessToken();
    final dataAyah = await SharedPrefUtils().getRegisterOrangTuaAyah();
    final dataIbu = await SharedPrefUtils().getRegisterOrangTuaIbu();
    logger.d(accesTokenValue);
    logger.d('data Ayah ${dataAyah}');
    logger.d('data ibu ${dataIbu}');

    if (accesTokenValue == null) {
      emit(TokenExpiredState());
    } else {
      try {
        // Assuming dataAyah and dataIbu are already defined and populated
        logger.d('convert data ayah ibu to model');
        // Parse the JSON string
        Map<String, dynamic> jsonMapAyah = jsonDecode(dataAyah!);
        Map<String, dynamic> jsonMapIbu = jsonDecode(dataIbu!);
        // Create an instance of Ayah
        final ayahData = PostOrangTuaBody.Ayah.fromJson(jsonMapAyah);
        // final ayahData =
        //     PostOrangTuaBody.Ayah.fromJson(dataAyah as Map<String, dynamic>);
        final ibuData = PostOrangTuaBody.Ibu.fromJson(jsonMapIbu);
        logger.d('parsing to db');
        final postOrangtuaBody = PostOrangTuaBody.PostOrangTuaBody(
          ayah: PostOrangTuaBody.Ayah(
            nomorKartuKeluarga: ayahData.nomorKartuKeluarga,
            nik: ayahData.nik,
            namaAyah: ayahData.namaAyah,
            tempatLahir: ayahData.tempatLahir,
            tanggalLahir: ayahData.tanggalLahir,
            nomorTelepon: ayahData.nomorTelepon,
            rt: ayahData.rt,
            rw: ayahData.rw,
            dusunId: ayahData.dusunId,
            alamat: ayahData.alamat,
            golDarah: ayahData.golDarah,
            jenisDisabilitas: ayahData.jenisDisabilitas,
          ),
          ibu: PostOrangTuaBody.Ibu(
            nomorKartuKeluarga: ibuData.nomorKartuKeluarga,
            nik: ibuData.nik,
            namaIbu: ibuData.namaIbu,
            tempatLahir: ibuData.tempatLahir,
            tanggalLahir: ibuData.tanggalLahir,
            rt: ibuData.rt,
            rw: ibuData.rw,
            dusunId: ibuData.dusunId,
            alamat: ibuData.alamat,
            nomorTelepon: ibuData.nomorTelepon,
            golDarah: ibuData.golDarah,
            jenisKb: ibuData.jenisKb,
            tanggalMelahirkanSebelumnya: ibuData.tanggalMelahirkanSebelumnya,
            jumlahAnak: ibuData.jumlahAnak,
            jenisDisabilitas: ibuData.jenisDisabilitas,
          ),
        );
        logger.d(' post orang tua body = ${postOrangtuaBody}');
        List<dynamic> response = await CreateRegisterOrangTuaApi()
            .postRegisterOrangTua(accesTokenValue, postOrangtuaBody);
        int statusCode = response[0] as int;
        logger.d('statusCode ${statusCode}');
        if (statusCode == 201) {
          logger.d('succes post orang tua');
          emit(CreateRegisterOrangTuaSuccesState());
          final dataAyah = await SharedPrefUtils().removeRegisterOrangTuaAyah();
          final dataIbu = await SharedPrefUtils().removeRegisterOrangTuaIbu();
        } else {
          emit(TokenExpiredState());
        }
      } catch (e) {
        emit(CreateRegisterOrangTuaFailedState(e.toString()));
      }
    }
  }
}
