import 'package:flutter/material.dart';

import '../../../../../config/theme/shadow.dart';
import '../../model/list_data_ibu_model.dart';

class ListDataIbu extends StatefulWidget {
  ListDataIbu({super.key});

  @override
  State<ListDataIbu> createState() => _ListDataIbuState();
}

class _ListDataIbuState extends State<ListDataIbu> {
  List<ListDataIbuModel> listDataIbu = [
    ListDataIbuModel(
        isChecked: false, nama: 'Raina Laksmiwati', nik: '3621554282332633'),
    ListDataIbuModel(
        isChecked: false, nama: 'Zaenab Nasyidah', nik: '3621056421567845'),
    ListDataIbuModel(
        isChecked: false, nama: 'Yessi Sudiati', nik: '3621550987651090'),
    ListDataIbuModel(
        isChecked: false,
        nama: 'Zulaikha Ira Hassanah',
        nik: '3621559812000995'),
    ListDataIbuModel(
        isChecked: false, nama: 'Paris Yuni Lestari', nik: '362121006665558'),
    ListDataIbuModel(
        isChecked: false,
        nama: 'Laila Dian Yuliarti M.Farm',
        nik: '3621550091238342'),
    ListDataIbuModel(
        isChecked: false, nama: 'Salwa Handayani', nik: '3621557780346711'),
    ListDataIbuModel(
        isChecked: false, nama: 'Iriana Suryatmi', nik: '3621550011274498'),
    ListDataIbuModel(
        isChecked: false,
        nama: 'Iriana Permata M.TI.',
        nik: '3621550998765129'),
    ListDataIbuModel(
        isChecked: false, nama: 'Cinthia Puspita', nik: '362150011298749'),
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
