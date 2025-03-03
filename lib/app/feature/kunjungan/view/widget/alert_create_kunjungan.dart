import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../bloc/index_kunjungan_bloc.dart';

class AlertCreateKunjungan extends StatelessWidget {
  const AlertCreateKunjungan({
    super.key,
    required this.indexKunjunganBloc
  });
  final IndexKunjunganBloc indexKunjunganBloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: false,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Pilih Target Kunjungan',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(30),
            ),
            ButtonPrimary(
              mainButtonMessage: 'Anak Stunting',
              mainButton: () {
                Navigator.pop(context, 1);
              },
              color: redPrimaryMain,
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            ButtonPrimary(
              mainButtonMessage: 'Anak Tidak Hadir',
              mainButton: () {
                Navigator.pop(context, 2);
                // Navigator.pop(context);
              },
              color: goldPrimaryMain,
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            ButtonPrimary(
              mainButtonMessage: 'Ibu Hamil',
              mainButton: () {
                Navigator.pop(context, 3);
                // Navigator.pop(context);
              },
              color: bluePrimaryMain,
            ),
          ],
        ),
      ),
    );
  }
}
