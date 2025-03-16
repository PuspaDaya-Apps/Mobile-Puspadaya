import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/RiwayatAnak/detail/model/chart_data_model.dart';

import '../../../../../utils/logger/logger.dart';
import '../model/get_detail_riwayat_pengukuran_anak_model.dart'
    as GetDetailRiwayatPengukuranAnakModel;

part 'select_chart_state.dart';

class SelectChartCubit extends Cubit<SelectChartState> {
  SelectChartCubit() : super(SelectChartInitial());
  void selectChart(
    String gender,
    int selectedIndex,
    String waktu,
    List<GetDetailRiwayatPengukuranAnakModel.Pengukuran>
        pengukuran, // <- Data pengukuran dari backend
    DateTime
        tanggalLahirAnak, // <- Tambahkan tanggal lahir anak untuk hitung usia
  ) async {
    // Validasi input
    if (selectedIndex < 0 || selectedIndex > 1) {
      emit(SelectChartFailed('Invalid selection index'));
      return;
    }

    if (!['0-24', '2-5'].contains(waktu)) {
      emit(SelectChartFailed('Invalid time range'));
      return;
    }

    if (pengukuran == null) {
      emit(SelectChartFailed('Measurement data is null'));
      return;
    }

    emit(SelectChartLoading());
    try {
      logger.d('get data json from local, index $selectedIndex, time $waktu');
      String jsonString;

      // Load the appropriate JSON file based on selections
      if (selectedIndex == 0 && waktu == "0-24" && gender == "Laki-laki") {
        jsonString = await rootBundle.loadString(
            'assets/json/laki_laki/berat_badan_laki_laki_0-24.json');
      } else if (selectedIndex == 0 &&
          waktu == "2-5" &&
          gender == "Laki-laki") {
        jsonString = await rootBundle
            .loadString('assets/json/laki_laki/berat_badan_laki_laki_2-5.json');
      } else if (selectedIndex == 1 &&
          waktu == "0-24" &&
          gender == "Laki-laki") {
        jsonString = await rootBundle.loadString(
            'assets/json/laki_laki/tinggi_badan_laki_laki_0-24.json');
      } else if (selectedIndex == 1 &&
          waktu == "2-5" &&
          gender == "Laki-laki") {
        jsonString = await rootBundle.loadString(
            'assets/json/laki_laki/tinggi_badan_laki_laki_2-5.json');
      } else if (selectedIndex == 0 &&
          waktu == "0-24" &&
          gender == "Perempuan") {
        jsonString = await rootBundle.loadString(
            'assets/json/perempuan/berat_badan_perempuan_0-24.json');
      } else if (selectedIndex == 0 &&
          waktu == "2-5" &&
          gender == 'Perempuan') {
        jsonString = await rootBundle
            .loadString('assets/json/perempuan/berat_badan_perempuan_2-5.json');
      } else if (selectedIndex == 1 &&
          waktu == "0-24" &&
          gender == 'Perempuan') {
        jsonString = await rootBundle.loadString(
            'assets/json/perempuan/tinggi_badan_perempuan_0-24.json');
      } else if (selectedIndex == 1 &&
          waktu == "2-5" &&
          gender == 'Perempuan') {
        jsonString = await rootBundle.loadString(
            'assets/json/perempuan/tinggi_badan_perempuan_2-5.json');
      } else {
        emit(SelectChartFailed('Invalid selection'));
        return;
      }

      logger.d('Loaded JSON data: $jsonString');

      // Mendekode data JSON
      List<dynamic> jsonData = json.decode(jsonString);
      List<ChartDataModel> chartReference =
          jsonData.map((item) => ChartDataModel.fromJson(item)).toList();

      // Menggabungkan data referensi dengan data pengukuran
      List<ChartDataModel> chartData = _mergeChartWithPengukuran(
        chartReference,
        pengukuran,
        selectedIndex,
        tanggalLahirAnak,
      );

      emit(SelectChartSuccess(chartData));
    } catch (e) {
      emit(SelectChartFailed('Failed to load data: ${e.toString()}'));
    }
  }

  /// 🔹 Fungsi untuk menggabungkan data referensi dengan data pengukuran
  /// Menggabungkan data referensi dengan data pengukuran
  List<ChartDataModel> _mergeChartWithPengukuran(
    List<ChartDataModel> chartReference,
    List<GetDetailRiwayatPengukuranAnakModel.Pengukuran> pengukuran,
    int selectedIndex,
    DateTime tanggalLahirAnak,
  ) {
    return chartReference.map((chartItem) {
      GetDetailRiwayatPengukuranAnakModel.Pengukuran? closestPengukuran;
      double closestDiff = double.infinity;

      for (var pengukuranItem in pengukuran) {
        int usiaBulan = _hitungUsiaDalamBulan(
            tanggalLahirAnak, pengukuranItem.tanggalPengukuran);
        double diff = (usiaBulan - chartItem.x).abs().toDouble();

        if (diff < closestDiff) {
          closestDiff = diff;
          closestPengukuran = pengukuranItem;
        }
      }

      double? yValue;
      if (closestPengukuran != null) {
        yValue = selectedIndex == 0
            ? double.tryParse(closestPengukuran.tinggiBadan)
            : double.tryParse(closestPengukuran.beratBadan);
      }

      return ChartDataModel(
        x: chartItem.x,
        y: yValue,
        yellowLowLow: chartItem.yellowLowLow,
        yellowLowHigh: chartItem.yellowLowHigh,
        greenLightLowLow: chartItem.greenLightLowLow,
        greenLightLowHigh: chartItem.greenLightLowHigh,
        greenLow: chartItem.greenLow,
        greenLine: chartItem.greenLine,
        greenHigh: chartItem.greenHigh,
        greenLightHighLow: chartItem.greenLightHighLow,
        greenLightHighHigh: chartItem.greenLightHighHigh,
        yellowHighLow: chartItem.yellowHighLow,
        yellowHighHigh: chartItem.yellowHighHigh,
      );
    }).toList();
  }

  /// Menghitung usia anak dalam bulan berdasarkan tanggal pengukuran
  int _hitungUsiaDalamBulan(DateTime tanggalLahir, DateTime tanggalPengukuran) {
    return ((tanggalPengukuran.difference(tanggalLahir).inDays) / 30).floor();
  }
}
