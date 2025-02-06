import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/view/search_posyandu.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';

import '../../model/list_data_tamu_model.dart';

class ListDataTamu extends StatefulWidget {
  ListDataTamu({super.key});

  @override
  State<ListDataTamu> createState() => _ListDataTamuState();
}

class _ListDataTamuState extends State<ListDataTamu> {
  final List<ListDataTamuModel> listDataTamu = [
    ListDataTamuModel(
      nama: 'Kurnia Melati Ayu Putri',
      posyanduAsal: 'Posyandu Melati 3',
    )
  ];

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: listDataTamu.length,
            itemBuilder: (context, index) {
              final dataTamu = listDataTamu[index];
              return Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadowSm,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  title: Text(dataTamu.nama!),
                  subtitle: Text('Posyandu Asal : ${dataTamu.posyanduAsal}'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
