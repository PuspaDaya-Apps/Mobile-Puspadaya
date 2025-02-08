import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_ibu_hamil.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/shadow.dart';
import '../../../view/widget/riwayat_ibu_hamil_items_widget.dart';

class DataIbuHamil extends StatelessWidget {
  const DataIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return DataIbuHamilView();
  }
}

class DataIbuHamilView extends StatefulWidget {
  const DataIbuHamilView({super.key});

  @override
  State<DataIbuHamilView> createState() => _DataIbuHamilViewState();
}

class _DataIbuHamilViewState extends State<DataIbuHamilView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 5,
            top: 5,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: RiwayatIbuHamilItems(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return DetailMonitoringIbuHamil(
              //       detailMonitoring: null,
              //     );
              //   },
              // ));
            },
            name: "Siti Aminah",
            nik: "362155482327264",
            gestationalAge: "6 bulan",
          ),
        );
      },
    );
  }
}
