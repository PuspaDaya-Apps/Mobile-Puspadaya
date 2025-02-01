import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/pengukuran_tamu_items_widget.dart';

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

class _IndexPengukuranTamuScreenViewState extends State<IndexPengukuranTamuScreenView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: boxShadow(),
          ),
          child: PengukuranTamuItems(
            onTap: () {
              Navigator.pushNamed(context, DETAIL_PENGUKURAN_TAMU);
            },
            name: "Ahmad Tamu",
            nik: "362155482327265",
            date: "08/10/2024",
            place: "Posyandu B",
          )
        );
      },
    );
  }
}
