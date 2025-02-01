import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/pengukuran_anak_items_widget.dart';

class IndexPengukuranAnakScreen extends StatelessWidget {
  const IndexPengukuranAnakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexPengukuranAnakScreenView();
  }
}

class IndexPengukuranAnakScreenView extends StatefulWidget {
  const IndexPengukuranAnakScreenView({super.key});

  @override
  State<IndexPengukuranAnakScreenView> createState() =>
      _IndexPengukuranAnakScreenViewState();
}

class _IndexPengukuranAnakScreenViewState extends State<IndexPengukuranAnakScreenView> {
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
          child: PengukuranAnakItems(
            onTap: () {
              Navigator.pushNamed(context, DETAIL_PENGUKURAN_ANAK);
            },
            name: "Muhammad Kaivan Al Hakim",
            nik: "362155482327263",
            date: "08/10/2024",
            place: "Posyandu A",
          )
        );
      },
    );
  }
}
