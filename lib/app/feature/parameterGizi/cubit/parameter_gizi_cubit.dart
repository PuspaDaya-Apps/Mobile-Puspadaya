import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; // Import this to use json.decode
import '../../../../utils/logger/logger.dart';
import '../model/parameter_gizi_model.dart';

part 'parameter_gizi_state.dart';

class ParameterGiziCubit extends Cubit<ParameterGiziState> {
  ParameterGiziCubit() : super(ParameterGiziInitial());

  void selectGender(String jenisKelamin, String satuan) async {
    emit(ParameterGiziLoading());
    try {
      logger.d(
          'get data json from local, jenis kelamin $jenisKelamin, satuan $satuan');
      String jsonString;

      // Load the appropriate JSON file based on selections
      if (jenisKelamin == 'Laki-Laki' && satuan == 'Tinggi Badan') {
        jsonString =
            await rootBundle.loadString('assets/json/laki_laki_tinggi.json');
      } else if (jenisKelamin == 'Laki-Laki' && satuan == 'Berat Badan') {
        jsonString =
            await rootBundle.loadString('assets/json/laki_laki_berat.json');
      } else if (jenisKelamin == 'Perempuan' && satuan == 'Tinggi Badan') {
        jsonString =
            await rootBundle.loadString('assets/json/perempuan_tinggi.json');
      } else if (jenisKelamin == 'Perempuan' && satuan == 'Berat Badan') {
        jsonString =
            await rootBundle.loadString('assets/json/perempuan_berat.json');
      } else {
        emit(ParameterGiziError('Invalid selection'));
        return;
      }

      logger.d('get data $jsonString');

      // Decode the JSON string into a Map
      Map<String, dynamic> jsonData = json.decode(jsonString);

      // Convert the Map to your model
      ParameterGiziModel data = ParameterGiziModel.fromJson(jsonData);
      emit(ParameterGiziLoaded(data));
    } catch (e) {
      emit(ParameterGiziError('Failed to load data: ${e.toString()}'));
    }
  }
}
