import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../feature/RiwayatAnak/detail/model/chart_data_model.dart';

class ChartPage extends StatefulWidget {
  final List<ChartDataModel> data;
  const ChartPage({super.key, required this.data});
  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  void initState() {
    super.initState();
  }

  final ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
    enableDoubleTapZooming: true,
    enableSelectionZooming: true,
    enablePanning: true,
    enablePinching: true,
    zoomMode: ZoomMode.x,
  );

  @override
  Widget build(BuildContext context) {
    // Menghitung nilai maksimum untuk sumbu Y
    // Menghitung nilai maksimum untuk sumbu Y
    // Menghitung nilai maksimum dan minimum untuk sumbu Y
    double maxYValue = 1;
    double minYValue = 1;

    if (widget.data.isNotEmpty) {
      // Menghitung nilai maksimum
      maxYValue = widget.data
          .map((item) => item.yellowHighHigh)
          .reduce((value, element) => value > element ? value : element);
      maxYValue = (maxYValue + 2).ceil().toDouble(); // Membulatkan ke atas

      // Menghitung nilai minimum
      minYValue = widget.data
          .map((item) => item.yellowLowLow)
          .reduce((value, element) => value < element ? value : element);
      minYValue = (minYValue - 1).floor().toDouble(); // Membulatkan ke bawah

      // Jika nilai minimum <= 0, atur menjadi 1
      if (minYValue <= 0) {
        minYValue = 1;
      }
    }

    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 400,
      child: SfCartesianChart(
        enableAxisAnimation: true,
        zoomPanBehavior: _zoomPanBehavior,
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(fontSize: 16),
          maximumLabels: 100,
          autoScrollingDelta: 6,
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(width: 0),
        ),
        primaryYAxis: NumericAxis(minimum: minYValue, maximum: maxYValue),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          builder: (data, point, series, pointIndex, seriesIndex) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Data Pengukuran : ${data[seriesIndex].x}',
                    style: TextStyle(color: Colors.white),
                  ),
                  // Text(
                  //   'Tanggal Pengukuran : ${data.}',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                ],
              ),
            );
          },
        ),
        series: <CartesianSeries<ChartDataModel, num>>[
          // Red Zone Low
          SplineRangeAreaSeries<ChartDataModel, num>(
            dataSource: widget.data,
            xValueMapper: (ChartDataModel point, _) => point.x,
            lowValueMapper: (ChartDataModel point, _) => point.yellowLowLow,
            highValueMapper: (ChartDataModel point, _) => point.yellowLowHigh,
            color: Color(0xFFFFD700),
            enableTooltip: true,
          ),
          // Orange Zone Low
          SplineRangeAreaSeries<ChartDataModel, num>(
            dataSource: widget.data,
            xValueMapper: (ChartDataModel point, _) => point.x,
            lowValueMapper: (ChartDataModel point, _) => point.greenLightLowLow,
            highValueMapper: (ChartDataModel point, _) =>
                point.greenLightLowHigh,
            color: Color(0xFF90EE90),
            enableTooltip: true,
          ),
          // Green Zone
          SplineRangeAreaSeries<ChartDataModel, num>(
            dataSource: widget.data,
            xValueMapper: (ChartDataModel point, _) => point.x,
            lowValueMapper: (ChartDataModel point, _) => point.greenLow,
            highValueMapper: (ChartDataModel point, _) => point.greenHigh,
            color: Color(0xFF008000),
            enableTooltip: true,
          ),
          // Orange Zone High
          SplineRangeAreaSeries<ChartDataModel, num>(
            dataSource: widget.data,
            xValueMapper: (ChartDataModel point, _) => point.x,
            lowValueMapper: (ChartDataModel point, _) =>
                point.greenLightHighLow,
            highValueMapper: (ChartDataModel point, _) =>
                point.greenLightHighHigh,
            color: Color(0xFF90EE90),
            enableTooltip: true,
          ),
          // Red Zone High
          SplineRangeAreaSeries<ChartDataModel, num>(
            dataSource: widget.data,
            xValueMapper: (ChartDataModel point, _) => point.x,
            lowValueMapper: (ChartDataModel point, _) => point.yellowHighLow,
            highValueMapper: (ChartDataModel point, _) => point.yellowHighHigh,
            color: Color(0xFFFFD700),
            enableTooltip: true,
          ),

          LineSeries<ChartDataModel, num>(
            dataSource: widget.data,
            xValueMapper: (ChartDataModel point, _) => point.x,
            yValueMapper: (ChartDataModel point, _) => point.greenLine,
            color: Color.fromARGB(255, 0, 150, 77),
            width: 4,
            // dashArray: <double>[5, 5], // Garis putus-putus untuk membedakan
            markerSettings: MarkerSettings(isVisible: false),
          ),
          // SplineSeries<ChartDataModel, num>(
          //   dataSource: widget.data,
          //   width: 4,
          //   xValueMapper: (ChartDataModel point, _) => point.x,
          //   yValueMapper: (ChartDataModel point, _) => point.y,
          //   markerSettings: MarkerSettings(
          //     isVisible: true,
          //     shape: DataMarkerType.circle,
          //     width: 6,
          //     height: 6,
          //     borderColor: Colors.black,
          //     color: Colors.black,
          //   ),
          //   color: Colors.blue,
          //   splineType: SplineType.natural, // Membuat garis lebih halus
          //   dataLabelSettings: DataLabelSettings(isVisible: true),
          //   enableTooltip: true,
          // ),
        ],
      ),
    );
  }
}