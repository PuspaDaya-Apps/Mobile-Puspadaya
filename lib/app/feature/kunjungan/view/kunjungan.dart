import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';
import 'package:puspadaya/app/feature/kunjungan/view/widget/alert_create_kunjungan.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/kunjungan_items_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class KunjunganScreen extends StatelessWidget {
  const KunjunganScreen({super.key});

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
    // !belum dimulai
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 10)),
      distance: 5.84,
      status: Status.berjalan,
      target: TargetOfKunjugan.anakStunting,
    ),
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 8)),
      distance: 2.84,
      status: Status.selesai,
      target: TargetOfKunjugan.anakTidakHadir,
    ),
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 20)),
      distance: 1.84,
      status: Status.selesai,
      target: TargetOfKunjugan.ibuHamil,
    ),
    // !berjalan
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 15)),
      distance: 4.04,
      status: Status.selesai,
      target: TargetOfKunjugan.anakStunting,
    ),
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 12)),
      distance: 0.2,
      status: Status.selesai,
      target: TargetOfKunjugan.anakTidakHadir,
    ),
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 7)),
      distance: 0.94,
      status: Status.selesai,
      target: TargetOfKunjugan.ibuHamil,
    ),
    // !selesai
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 18)),
      distance: 1.04,
      status: Status.selesai,
      target: TargetOfKunjugan.anakStunting,
    ),
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 5)),
      distance: 1.2,
      status: Status.selesai,
      target: TargetOfKunjugan.anakTidakHadir,
    ),
    KunjunganItem(
      date: DateTime.now().subtract(Duration(days: 3)),
      distance: 1.42,
      status: Status.selesai,
      target: TargetOfKunjugan.ibuHamil,
    ),
  ];

  List<String> name = [
    'Angaskara Sukma Jaya',
    'Cenia Dewi',
    'Kemala Sari',
    'Ari Putra',
    'Mentari Lestarika',
    'Cecep Denta Pasaribu',
  ];

  List<DateTime> tanggal = [
    DateTime.now().subtract(Duration(days: 3)),
    DateTime.now().subtract(Duration(days: 7)),
    DateTime.now().subtract(Duration(days: 9)),
    DateTime.now().subtract(Duration(days: 10)),
    DateTime.now().subtract(Duration(days: 15)),
    DateTime.now().subtract(Duration(days: 19)),
  ];

  List<Status> status = [
    Status.berjalan,
    Status.selesai,
    Status.selesai,
    Status.selesai,
    Status.selesai,
    Status.selesai
  ];

  List<TargetOfKunjugan> kunjungan = [
    TargetOfKunjugan.anakStunting,
    TargetOfKunjugan.ibuHamil,
    TargetOfKunjugan.anakTidakHadir,
    TargetOfKunjugan.anakTidakHadir,
    TargetOfKunjugan.ibuHamil,
    TargetOfKunjugan.anakStunting,
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
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              // Ensure correct rendering of custom widgets
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: KunjunganItemWidget(
                  id: "",
                  nama: name[index],
                  date: tanggal[index],
                  status: status[index],
                  target: kunjungan[index],
                ),
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
