import 'package:flutter/material.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../utils/logger/logger.dart';
import '../../model/list_data_anak_model.dart';

class ListDataAnak extends StatefulWidget {
  ListDataAnak({super.key});

  @override
  State<ListDataAnak> createState() => _ListDataAnakState();
}

class _ListDataAnakState extends State<ListDataAnak> {
  @override
  void initState() {
    logger.d('trigger init state list data anak creatae kehadiran');
    super.initState();
  }
  final List<ListDataAnakModel> listDataAnak = [
    ListDataAnakModel(
        isChecked: false, nama: 'Mila Nuraini', namaIbu: 'Tami Suartini S.Ked'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Gilda Oliva Yuniar',
        namaIbu: 'Rina Clara Mandasari S.Pd'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Septi Ilsa Widiastuti',
        namaIbu: 'Halima Fitria Nasyidah'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Raden Jumadi Irawan',
        namaIbu: 'Widya Paulin Yulianti M.Pd'),
    ListDataAnakModel(
        isChecked: false, nama: 'Darman Sitorus', namaIbu: 'Nova Padmasari'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Johan Bakidin Napitupulu',
        namaIbu: 'Paulin Winarsih'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Adhiarja Taufan Januar',
        namaIbu: 'Jasmin Riyanti S.Sos'),
    ListDataAnakModel(
        isChecked: false, nama: 'Dadi Damanik', namaIbu: 'Intan Palastri'),
    ListDataAnakModel(
        isChecked: false, nama: 'Kamidin Hakim', namaIbu: 'Maimunah Hastuti'),
    ListDataAnakModel(
        isChecked: false,
        nama: 'Chandra Zulkarnain',
        namaIbu: 'Gawati Andriani S.I.Kom'),
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
