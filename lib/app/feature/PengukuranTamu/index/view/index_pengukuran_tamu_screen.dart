import 'package:flutter/material.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/pengukuran_tamu_items_widget.dart';
import 'model/pengukuran_tamu_item_model.dart';

class IndexPengukuranTamuScreen extends StatelessWidget {
  const IndexPengukuranTamuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexPengukuranTamuScreenView();
  }
}

class IndexPengukuranTamuScreenView extends StatefulWidget {
  const IndexPengukuranTamuScreenView({super.key});

  @override
  State<IndexPengukuranTamuScreenView> createState() =>
      _IndexPengukuranTamuScreenViewState();
}

class _IndexPengukuranTamuScreenViewState
    extends State<IndexPengukuranTamuScreenView> {
  List<PengukuranTamuItemModel> listPengukuranItem = [
    PengukuranTamuItemModel(
      nama: 'Naufal Azalia',
      nik: '3321065006020001',
      posyanduAsal: 'Posyandu Indah 2',
      tanggal: '12 Januari 2024',
    ),
    PengukuranTamuItemModel(
      nama: 'Andamari Noerani',
      nik: '3321061306990005',
      posyanduAsal: 'Posyandu Anggrek 3',
      tanggal: '16 Januari 2024',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listPengukuranItem.length,
      itemBuilder: (context, index) {
        PengukuranTamuItemModel pengukuranItem = listPengukuranItem[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: PengukuranTamuItems(
            onTap: () {
              Navigator.pushNamed(context, DETAIL_PENGUKURAN_TAMU,
                  arguments: '2');
            },
            name: pengukuranItem.nama,
            nik: pengukuranItem.nik,
            date: pengukuranItem.tanggal,
            place: pengukuranItem.posyanduAsal,
          ),
        );
      },
    );
  }
}
