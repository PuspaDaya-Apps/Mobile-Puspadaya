import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/daftar_kehadiran_items_widget.dart';

class IndexKehadiranScreen extends StatelessWidget {
  const IndexKehadiranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexKehadiranScreenView();
  }
}

class IndexKehadiranScreenView extends StatefulWidget {
  const IndexKehadiranScreenView({super.key});

  @override
  State<IndexKehadiranScreenView> createState() =>
      _IndexKehadiranScreenViewState();
}

class _IndexKehadiranScreenViewState extends State<IndexKehadiranScreenView> {
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
            child: DaftarKehadiranItems(
              onTap: () {
                Navigator.pushNamed(context, DETAIL_KEHADIRAN);
              },
              location: "Posyandu A",
              date: "08/10/2024",
              duration: "5 jam 25 menit",
              status: "Sedang Berjalan",
            ));
      },
    );
  }
}
