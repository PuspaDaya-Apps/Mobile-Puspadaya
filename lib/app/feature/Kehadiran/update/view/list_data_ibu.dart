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
        isChecked: false,
        nama: 'Muhammad Kaivan Al Hakim',
        nik: '362155428233263'),
    ListDataIbuModel(
        isChecked: false, nama: 'Aisyah Zahra Putri', nik: ' 362155428233263'),
    ListDataIbuModel(
        isChecked: false, nama: 'Bintang Harapan', nik: '362155428233263'),
    ListDataIbuModel(
        isChecked: false, nama: 'Kaizen Alfarizi', nik: ' 362155428233263'),
    ListDataIbuModel(
        isChecked: false, nama: 'Bintang Harapan', nik: '362155428233263'),
    ListDataIbuModel(
        isChecked: false, nama: 'Kaizen Alfarizi', nik: ' 362155428233263'),
    ListDataIbuModel(
        isChecked: false, nama: 'Bintang Harapan', nik: '362155428233263'),
    ListDataIbuModel(
        isChecked: false, nama: 'Kaizen Alfarizi', nik: ' 362155428233263'),
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
