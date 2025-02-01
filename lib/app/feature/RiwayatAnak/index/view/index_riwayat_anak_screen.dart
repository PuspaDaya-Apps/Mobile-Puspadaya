import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/riwayat_anak_items_widget.dart';

class IndexRiwayatAnakScreen extends StatelessWidget {
  const IndexRiwayatAnakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexRiwayatAnakScreenView();
  }
}

class IndexRiwayatAnakScreenView extends StatefulWidget {
  const IndexRiwayatAnakScreenView({super.key});

  @override
  State<IndexRiwayatAnakScreenView> createState() =>
      _IndexRiwayatAnakScreenViewState();
}

class _IndexRiwayatAnakScreenViewState extends State<IndexRiwayatAnakScreenView> {
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
          child: RiwayatAnakItems(
            onTap: () {
              Navigator.pushNamed(context, DETAIL_RIWAYAT_ANAK);
            },
            name: "Muhammad Kaivan Al Hakim",
            nik: "362155482327263",
            gender: 'Laki-Laki',
          )
        );
      },
    );
  }
}
