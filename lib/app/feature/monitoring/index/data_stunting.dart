import 'package:flutter/material.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/shadow.dart';
import '../../../view/widget/riwayat_anak_items_widget.dart';

class DataStunting extends StatelessWidget {
  const DataStunting({super.key});

  @override
  Widget build(BuildContext context) {
    return DataStuntingView();
  }
}

class DataStuntingView extends StatefulWidget {
  const DataStuntingView({super.key});

  @override
  State<DataStuntingView> createState() => _DataStuntingViewState();
}

class _DataStuntingViewState extends State<DataStuntingView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(
            bottom: 5,
            top: 5,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: RiwayatAnakItems(
            onTap: () {
              Navigator.pushNamed(context, DETAIL_MONITORING_STUNTING,arguments: '2');
            },
            name: "Muhammad Kaivan Al Hakim",
            nik: "362155482327263",
            gender: 'Laki-Laki',
          ),
        );
      },
    );
  }
}
