import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/beban_kader_items_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class BebanKerja extends StatelessWidget {
  const BebanKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return const BebanKerjaView();
  }
}

class BebanKerjaView extends StatefulWidget {
  const BebanKerjaView({super.key});

  @override
  State<BebanKerjaView> createState() => _BebanKerjaViewState();
}

class _BebanKerjaViewState extends State<BebanKerjaView> {
  @override
  Widget build(BuildContext context) {
    List<BebanKerjaItems> bebanKerja = [
      BebanKerjaItems(
        onTap: () {
          Navigator.pushNamed(context, '');
        },
        place: 'Posyandu Mawar 8',
        date: 'September 2024',
      ),
      BebanKerjaItems(
        onTap: () {},
        place: 'Posyandu Mawar 8',
        date: 'September 2024',
      ),
      BebanKerjaItems(
        onTap: () {},
        place: 'Posyandu Mawar 8',
        date: 'September 2024',
      ),
    ];
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        background: Colors.white,
        title: 'Riwayat Beban Kerja Kader',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: bebanKerja.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: boxShadow(),
                ),
                child: bebanKerja[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
