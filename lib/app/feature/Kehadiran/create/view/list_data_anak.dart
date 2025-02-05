import 'package:flutter/material.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../model/list_data_anak_model.dart';

class ListDataAnak extends StatefulWidget {
  ListDataAnak({super.key});

  @override
  State<ListDataAnak> createState() => _ListDataAnakState();
}

class _ListDataAnakState extends State<ListDataAnak> {
  final List<ListDataAnakModel> listDataAnak = [
    ListDataAnakModel(
        isChecked: false,
        nama: 'Muhammad Kaivan Al Hakim',
        namaIbu: 'Ayu Putri Lestari'),
    ListDataAnakModel(
        isChecked: false, nama: 'Aisyah Zahra Putri', namaIbu: 'Tias Agaskara'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Bintang Harapan',
        namaIbu: 'Putri Kumala Sari'),
    ListDataAnakModel(
        isChecked: false, nama: 'Kaizen Alfarizi', namaIbu: 'Dewi Agustina'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Bintang Harapan',
        namaIbu: 'Putri Kumala Sari'),
    ListDataAnakModel(
        isChecked: false, nama: 'Kaizen Alfarizi', namaIbu: 'Dewi Agustina'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Bintang Harapan',
        namaIbu: 'Putri Kumala Sari'),
    ListDataAnakModel(
        isChecked: false, nama: 'Kaizen Alfarizi', namaIbu: 'Dewi Agustina'),
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
              leading: Checkbox(
                visualDensity: VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                shape: CircleBorder(),
                side: BorderSide(
                  color: stroke10,
                  width: 2,
                ),
                activeColor: bluePrimaryMain,
                checkColor: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                value: dataAnak.isChecked,
                onChanged: (value) {
                  setState(() {
                    dataAnak.isChecked = value!;
                  });
                },
              ),
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
