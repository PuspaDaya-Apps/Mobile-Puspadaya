import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../../config/theme/shadow.dart';
import '../../model/list_data_ibu_model.dart';
import '../model/get_detail_kehadiran_model.dart' as get_detail_kehadiran_model;

class ListDataIbu extends StatelessWidget {
  final List<get_detail_kehadiran_model.KehadiranIbuHamil> data;
  ListDataIbu({super.key, required this.data});

  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          'Tidak ada data ibu hamil',
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
        // final dataAnak = listDataIbu[index];
        return Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: shadowSm,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            title: Text(data[index].namaIbuHamil),
            subtitle: Text('NIK : ${data[index].nik}'),
          ),
        );
      },
    );
  }
}
