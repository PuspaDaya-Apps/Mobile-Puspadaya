import 'package:flutter/material.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../model/list_data_anak_model.dart';

class ListDataAnak extends StatefulWidget {
  const ListDataAnak({super.key});

  @override
  State<ListDataAnak> createState() => _ListDataAnakState();
}

class _ListDataAnakState extends State<ListDataAnak> {
  final List<ListDataAnakModel> listDataAnak = [
    ListDataAnakModel(
        isChecked: false,
        nama: 'Cinthia Novitasari',
        namaIbu: 'Tiara Zelda Hartati'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Bintang Harapan',
        namaIbu: 'Natalia Paramita Zulaika'),
    ListDataAnakModel(
        isChecked: false, nama: 'Hamima Astuti', namaIbu: 'Irma Winda Melani'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Sabrina Purnawati',
        namaIbu: 'Jelita Namaga S.Pt'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Asmadi Hardiansyah',
        namaIbu: 'Gasti Zizi Pratiwi S.Gz'),
    ListDataAnakModel(
        isChecked: false, nama: 'Wakiman Najmudin', namaIbu: 'Faizah Halimah'),
    ListDataAnakModel(
        isChecked: false, nama: 'Pangestu Nababan', namaIbu: 'Dalima Hassanah'),
  ];

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataAnak.length,
      itemBuilder: (context, index) {
        final dataAnak = listDataAnak[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              dataAnak.isChecked = !dataAnak.isChecked!;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowSm,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              title: Text(dataAnak.nama),
              subtitle: Text('Nama ibu : ${dataAnak.namaIbu}'),
            ),
          ),
        );
      },
    );
  }
}
