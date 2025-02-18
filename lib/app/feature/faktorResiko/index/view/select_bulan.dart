import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl for date formatting

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/card_select_bulan_widget.dart';
import '../model/select_bulan_model.dart';

class SelectBulan extends StatelessWidget {
  final String id;
  const SelectBulan({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SelectBulanView(
      id: id,
    );
  }
}

class SelectBulanView extends StatefulWidget {
  final String id;
  const SelectBulanView({super.key, required this.id});

  @override
  State<SelectBulanView> createState() => _SelectBulanViewState();
}

class _SelectBulanViewState extends State<SelectBulanView> {
  List<SelectBulanModel> itemBulan = [];

  @override
  void initState() {
    super.initState();
    _generateMonths();
  }

  void _generateMonths() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    int currentMonth = now.month;

    // Generate months for the current year and the next year
    for (int i = 0; i < 12; i++) {
      DateTime monthDate = DateTime(currentYear, currentMonth + i);
      String monthName = DateFormat('MMMM', 'id_ID').format(monthDate);
      String monthId =
          (i + 1).toString(); // You can customize this ID as needed

      // Add the month to the list
      itemBulan.add(SelectBulanModel(
        id: monthId,
        namaBulan: monthName,
        tahun: monthDate.year.toString(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Riwayat Faktor Resiko Permasalahan Gizi',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
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
          // Navigator.pushNamed(context, CREATE_REGISTER_ANAK).then((value) {
          //   if(value != null) {
          //     context.read<AnakByPosyanduBloc>().add(FetchAnak());
          //   }
          // });
          // Add your navigation or functionality for adding new items
          print("Floating Action Button Pressed");
        },
      ),
      backgroundColor: backgroundWhite10,
      body: ListView.builder(
        itemCount: itemBulan.length,
        itemBuilder: (context, index) {
          SelectBulanModel bulan = itemBulan[index];
          return Padding(
            padding:
                const EdgeInsets.only(bottom: 5, top: 5, left: 16, right: 16),
            child: CardSelectBulanWidget(
              bulan: bulan.namaBulan,
              tahun: bulan.tahun,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  PARAMETER_FAKTOR_RESIKO,
                  arguments: {
                    'id': widget.id,
                    'bulan': bulan.id,
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
