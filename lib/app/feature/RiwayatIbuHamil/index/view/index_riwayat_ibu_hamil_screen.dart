import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/riwayat_ibu_hamil_items_widget.dart';

class IndexRiwayatIbuHamilScreen extends StatelessWidget {
  const IndexRiwayatIbuHamilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexRiwayatIbuHamilScreenView();
  }
}

class IndexRiwayatIbuHamilScreenView extends StatefulWidget {
  const IndexRiwayatIbuHamilScreenView({super.key});

  @override
  State<IndexRiwayatIbuHamilScreenView> createState() =>
      _IndexRiwayatIbuHamilScreenViewState();
}

class _IndexRiwayatIbuHamilScreenViewState
    extends State<IndexRiwayatIbuHamilScreenView> {
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
              boxShadow: shadowSm,
            ),
            child: RiwayatIbuHamilItems(
              onTap: () {
                Navigator.pushNamed(context, DETAIL_RIWAYAT_IBU_HAMIL);
              },
              name: "Siti Aminah",
              nik: "362155482327264",
              gestationalAge: "6 bulan",
            ));
      },
    );
  }
}
