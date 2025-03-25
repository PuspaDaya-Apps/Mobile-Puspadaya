import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../RiwayatAnak/detail/model/chart_data_model.dart';
import '../../../RiwayatAnak/detail/model/get_grafik_kms_model.dart';
import '../../model/get_detail_monitoring_anak.dart' as GetDetailMonitoringAnak;

part 'select_chart_state.dart';


class SelectChartCubit extends Cubit<SelectChartState> {
  SelectChartCubit() : super(SelectChartInitial());

  DateTime? tanggalLahirAnak;

  void selectChart(
    String gender,
    int selectedIndex,
    String waktu,
    List<GetGrafikKmsModel> pengukuran,
  ) async {
    if (selectedIndex < 0 || selectedIndex > 1) {
      emit(SelectChartFailed('Invalid selection index'));
      return;
    }

    if (!['0-24', '2-5'].contains(waktu)) {
      emit(SelectChartFailed('Invalid time range'));
      return;
    }

    if (pengukuran.isEmpty) {
      emit(SelectChartFailed('Measurement data is empty'));
      return;
    }

    emit(SelectChartLoading());

    try {
      logger.d('Getting JSON data: index $selectedIndex, time $waktu');
      String jsonString = await _getJsonFile(gender, selectedIndex, waktu);

      List<dynamic> jsonData = json.decode(jsonString);
      List<ChartDataModel> chartReference =
          jsonData.map((item) => ChartDataModel.fromJson(item)).toList();

      List<GetGrafikKmsModel> filteredPengukuran =
          _filterPengukuranByWaktu(pengukuran, waktu);
      logger.d('Filtered data: ${filteredPengukuran.length} items');

      List<ChartDataModel> listChartData = [];

      for (var dataServer in filteredPengukuran) {
        ChartDataModel? chartLokal = chartReference.firstWhere(
          (item) => item.x == dataServer.usiaAnak,
          orElse: () {
            logger.w(
                'No matching chart data for usiaAnak: ${dataServer.usiaAnak}');
            return ChartDataModel(
              x: dataServer.usiaAnak,
              tanggalPengukuran: '',
              yellowLowLow: 0,
              yellowLowHigh: 0,
              greenLightLowLow: 0,
              greenLightLowHigh: 0,
              greenLow: 0,
              greenLine: 0,
              greenHigh: 0,
              greenLightHighLow: 0,
              greenLightHighHigh: 0,
              yellowHighLow: 0,
              yellowHighHigh: 0,
              y: 0,
            );
          },
        );

        double? nilaiY;
        if (selectedIndex == 0) {
          nilaiY = dataServer.tinggiBadan != null
              ? double.tryParse(dataServer.tinggiBadan!)
              : null;
        } else {
          nilaiY = dataServer.beratBadan != null
              ? double.tryParse(dataServer.beratBadan!)
              : null;
        }

        listChartData.add(ChartDataModel(
          x: dataServer.usiaAnak,
          tanggalPengukuran: dataServer.tanggalPengukuran,
          y: nilaiY,
          yellowLowLow: chartLokal.yellowLowLow,
          yellowLowHigh: chartLokal.yellowLowHigh,
          greenLightLowLow: chartLokal.greenLightLowLow,
          greenLightLowHigh: chartLokal.greenLightLowHigh,
          greenLow: chartLokal.greenLow,
          greenLine: chartLokal.greenLine,
          greenHigh: chartLokal.greenHigh,
          greenLightHighLow: chartLokal.greenLightHighLow,
          greenLightHighHigh: chartLokal.greenLightHighHigh,
          yellowHighLow: chartLokal.yellowHighLow,
          yellowHighHigh: chartLokal.yellowHighHigh,
        ));
      }

      listChartData.sort((a, b) => a.x.compareTo(b.x));

      emit(SelectChartSuccess(listChartData));
    } catch (e, stackTrace) {
      logger.e('Error loading chart data: $e', stackTrace: stackTrace);
      emit(SelectChartFailed('Failed to load data: ${e.toString()}'));
    }
  }

  Future<String> _getJsonFile(
      String gender, int selectedIndex, String waktu) async {
    String basePath = 'assets/json';
    String genderPath =
        gender.toLowerCase() == "laki-laki" ? "laki_laki" : "perempuan";
    String typePath = selectedIndex == 0 ? "tinggi_badan" : "berat_badan";

    return rootBundle.loadString(
        '$basePath/$genderPath/${typePath}_${genderPath}_$waktu.json');
  }

  List<GetGrafikKmsModel> _filterPengukuranByWaktu(
      List<GetGrafikKmsModel> pengukuran, String waktu) {
    if (waktu == "0-24") {
      return pengukuran.where((item) => item.usiaAnak <= 24).toList();
    } else if (waktu == "2-5") {
      return pengukuran
          .where((item) => item.usiaAnak >= 24 && item.usiaAnak <= 60)
          .toList();
    } else {
      return [];
    }
  }

  DateTime parseDate(String dateString) {
    DateFormat format = DateFormat("d MMMM y", "id_ID");
    return format.parse(dateString);
  }
}
