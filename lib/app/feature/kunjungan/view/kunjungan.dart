import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';
import 'package:puspadaya/app/feature/kunjungan/view/widget/alert_create_kunjungan.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/kunjungan_items_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class Kunjungan extends StatelessWidget {
  const Kunjungan({super.key});

  @override
  Widget build(BuildContext context) {
    return const KunjunganView();
  }
}

class KunjunganView extends StatefulWidget {
  const KunjunganView({super.key});

  @override
  State<KunjunganView> createState() => _KunjunganViewState();
}

class _KunjunganViewState extends State<KunjunganView> {
  final List<KunjunganItem> listOfKunjungan = [
    KunjunganItem(
      date: DateTime.now(),
      distance: 5.84,
      status: Status.belumDiMulai,
      target: TargetOfKunjugan.anakTidakHadir,
    ),
    KunjunganItem(
      date: DateTime.now(),
      distance: 4.84,
      status: Status.berjalan,
      target: TargetOfKunjugan.anakStunting,
    ),
    KunjunganItem(
      date: DateTime.now(),
      distance: 4.84,
      status: Status.selesai,
      target: TargetOfKunjugan.ibuHamil,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Kunjungan',
        background: backgroundWhite10,
        onBackPressed: null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: listOfKunjungan.length,
            itemBuilder: (context, index) {
              // Ensure correct rendering of custom widgets
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: KunjunganItemWidget(item: listOfKunjungan[index]),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bluePrimaryMain,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 38,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertCreateKunjungan();
            },
          );
          // Add your navigation or functionality for adding new items
          print("Floating Action Button Pressed");
        },
      ),
    );
  }
}
