import 'package:flutter/material.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../model/list_data_ibu_model.dart';

class ListDataIbu extends StatefulWidget {
  ListDataIbu({super.key});

  @override
  State<ListDataIbu> createState() => _ListDataIbuState();
}

class _ListDataIbuState extends State<ListDataIbu> {
  final List<ListDataIbuModel> listDataIbu = [
    ListDataIbuModel(
        isChecked: false, nama: 'Umi Yolanda', nik: '8081009812346577'),
    ListDataIbuModel(
        isChecked: false,
        nama: 'Ratih Farah Hassanah S.H.',
        nik: '3501009989123301'),
    ListDataIbuModel(
        isChecked: false, nama: 'Mutia Haryanti', nik: '8081000090123411'),
    ListDataIbuModel(
        isChecked: false, nama: 'Oliva Hastuti', nik: '35010083421871950'),
    ListDataIbuModel(
        isChecked: false, nama: 'Ida Siti Astuti', nik: '8081000091673975'),
    ListDataIbuModel(
        isChecked: false,
        nama: 'Ratih Zamira Nurdiyanti',
        nik: '35010081935401929'),
    ListDataIbuModel(
        isChecked: false, nama: 'Gina Uyainah', nik: '8081001019649274'),
    ListDataIbuModel(
        isChecked: false, nama: 'Tari Pertiwi S.Psi', nik: '3501001184920385'),
    ListDataIbuModel(
        isChecked: false, nama: 'Jessica Mayasari', nik: '8081007864091202'),
    ListDataIbuModel(
        isChecked: false,
        nama: 'Agnes Zaenab Puspita',
        nik: '3501000099912847'),
  ];

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataIbu.length,
      itemBuilder: (context, index) {
        final dataAnak = listDataIbu[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              dataAnak.isChecked = !dataAnak.isChecked;
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
              subtitle: Text('NIK : ${dataAnak.nik}'),
            ),
          ),
        );
      },
    );
  }
}
