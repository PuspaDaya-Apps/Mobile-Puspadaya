import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/pengukuran_ibu_hamil_items_widget.dart';

class IndexPengukuranIbuHamilScreen extends StatelessWidget {
  const IndexPengukuranIbuHamilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexPengukuranIbuHamilScreenView();
  }
}

class IndexPengukuranIbuHamilScreenView extends StatefulWidget {
  const IndexPengukuranIbuHamilScreenView({super.key});

  @override
  State<IndexPengukuranIbuHamilScreenView> createState() =>
      _IndexPengukuranIbuHamilScreenViewState();
}

class _IndexPengukuranIbuHamilScreenViewState extends State<IndexPengukuranIbuHamilScreenView> {
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
          child: PengukuranIbuHamilItems(
            onTap: () {
              Navigator.pushNamed(context, DETAIL_PENGUKURAN_IBU_HAMIL);
            },
            name: "Siti Aminah",
            nik: "362155482327264",
            date: "08/10/2024",
          )
        );
      },
    );
  }
}
