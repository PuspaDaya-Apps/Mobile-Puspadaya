import 'package:flutter/material.dart';

import '../../../../../config/theme/shadow.dart';
import '../model/get_detail_kehadiran_model.dart' as get_detail_kehadiran_model; 

class ListDataAnak extends StatelessWidget {
  final List<get_detail_kehadiran_model.KehadiranAnak> data;
  const ListDataAnak({super.key,required this.data});

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
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
            subtitle: Text('Nama ibu : ${data[index].namaIbu}'),
          ),
        );
      },
    );
  }
}
