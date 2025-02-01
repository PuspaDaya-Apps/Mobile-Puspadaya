import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class FeatureMaintenance extends StatelessWidget {
  final String feature;
  const FeatureMaintenance({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: feature,
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 260,
                image: AssetImage(
                  imageMaintenance,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                textAlign: TextAlign.center,
                'Mohon Maaf, Fitur Masih Dalam Masa Pengembangan',
                style: AppTextStyles.primaryTextSemibold.copyWith(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                textAlign: TextAlign.center,
                'Kami berusaha menghadirkannya segera. Terima kasih atas kesabaran dan dukungannya! 😊',
                style: AppTextStyles.secoundaryTextNormal.copyWith(
                  color: textSeecoundary2,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonPrimary(
                  color: bluePrimaryMain,
                  mainButtonMessage: 'Kembali',
                  mainButton: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
