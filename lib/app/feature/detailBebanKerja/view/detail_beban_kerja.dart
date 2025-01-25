import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class DetailBebanKerja extends StatelessWidget {
  const DetailBebanKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailBebanKerjaView();
  }
}

class DetailBebanKerjaView extends StatefulWidget {
  const DetailBebanKerjaView({super.key});

  @override
  State<DetailBebanKerjaView> createState() => _DetailBebanKerjaViewState();
}

class _DetailBebanKerjaViewState extends State<DetailBebanKerjaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Beban Kerja',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                textAlign: TextAlign.start,
                'Bulan',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(8),
              ),
              InfoFieldWidget(text: 'September 2024'),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.black54,
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(12)),
              Center(
                child: Text(
                  'Daftar Pekerjaan',
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
