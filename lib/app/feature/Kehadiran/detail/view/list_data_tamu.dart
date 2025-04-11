import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/shadow.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../model/list_data_tamu_model.dart';
import '../model/get_detail_kehadiran_model.dart' as get_detail_kehadiran_model;

class ListDataTamu extends StatelessWidget {
  final List<get_detail_kehadiran_model.KehadiranTamu>
      data; // Menggunakan listDataTamu dari get_detail_kehadiran_model
  ListDataTamu({super.key, required this.data});

  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          'Tidak ada data Tamu',
          style: TextStyle(
            fontSize: 14,
            color: textSecondary1,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        // final dataTamu = listDataTamu[index];
        return Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: shadowSm,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            title: Text(data[index].namaAnak),
            subtitle: Text('Posyandu Asal : ${data[index].posyanduAsal}'),
          ),
        );
      },
    );
  }
}
