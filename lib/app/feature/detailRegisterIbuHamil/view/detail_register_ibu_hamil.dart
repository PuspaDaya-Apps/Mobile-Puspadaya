import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_info_field_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_measuring_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/primary_button_widget.dart';

class DetailRegisterIbuHamil extends StatelessWidget {
  const DetailRegisterIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailRegisterIbuHamilView();
  }
}

class DetailRegisterIbuHamilView extends StatefulWidget {
  const DetailRegisterIbuHamilView({super.key});

  @override
  State<DetailRegisterIbuHamilView> createState() =>
      _DetailRegisterIbuHamilViewState();
}

class _DetailRegisterIbuHamilViewState
    extends State<DetailRegisterIbuHamilView> {
  bool _isExpanded = false;

  // Sample data for display
  final String nama = "Mentari Kumala Sari";
  final String usia = "28";
  final String nik = "213124123412";
  final String namaSuami = "Joko";
  final String tinggiBadan = "150 cm";
  final String beratBadan = "60 kg";
  final String lingkarKepala = "35 cm";
  final String hemoglobin = "12 g/dl";
  final String tempatPengukuran = "Posyandu A";
  final String catatan = "Catatan penting di sini";

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Ibu Hamil',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isExpanded
                      ? sizeHeighofSingleForm * 8.9
                      : sizeHeighofSingleForm,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Ibu Hamil',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(text: nama),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        Text(
                          'NIK',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(text: '1351243345'),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        Text(
                          'Nomor Telepon',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(text: '1351243345'),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        Text(
                          'Umur',
                          style: AppTextStyles.primaryTextNormal
                              .copyWith(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(text: usia),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        Text(
                          'Nama Suami',
                          style: AppTextStyles.primaryTextNormal
                              .copyWith(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(text: namaSuami),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Alamat',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Expanded(
                              child: InfoFieldWidget(text: 'Jawa Timur'),
                            ),
                            Expanded(
                              child: InfoFieldWidget(text: 'Banyuwangi'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Expanded(
                              child: InfoFieldWidget(text: 'Kabat'),
                            ),
                            Expanded(
                              child: InfoFieldWidget(text: 'Kabat'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        InfoFieldWidget(text: 'Bunder'),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Expanded(
                              child: InfoFieldWidget(text: '2'),
                            ),
                            Expanded(
                              child: InfoFieldWidget(text: '14'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        InfoFieldWidget(text: 'Alamat Lengkap'),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(16),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Detail Ibu Hamil',
                          style: AppTextStyles.primaryTextMedium.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        Icon(
                          size: 20,
                          _isExpanded
                              ? FluentIcons.chevron_up_20_filled
                              : FluentIcons.chevron_down_20_filled,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.black54,
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Text(
                  'Tanggal',
                  style: AppTextStyles.primaryTextNormal.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                InfoFieldWidget(text: '12/10/2024'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Text(
                  'Usia Kehamilan',
                  style: AppTextStyles.primaryTextNormal.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                InfoFieldWidget(text: '7 Bulan'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Tinggi Badan',
                            unit: 'cm',
                            value: tinggiBadan,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Lingkar Kepala',
                            unit: 'cm',
                            value: lingkarKepala,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Lingkar Lengan Atas',
                            unit: 'cm',
                            value: tinggiBadan,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoFieldMeasuringWidget(
                            title: 'Tinggi Fundus Uteri',
                            unit: 'cm',
                            value: lingkarKepala,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Text(
                  'Hemoboglin',
                  style: AppTextStyles.primaryTextNormal.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: '11.2'),
                    ),
                    Text(
                      'g/dl',
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Text(
                  'Taggal Terakhir Haid',
                  style: AppTextStyles.primaryTextNormal.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                InfoFieldWidget(text: '11 Agustus 2024'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(
                            'Terpapar Asap Rokok',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          InfoFieldWidget(text: 'Ya'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Text(
                            'Tablet FE',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          InfoFieldWidget(text: '2'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Text(
                  'Catatan',
                  style: AppTextStyles.primaryTextNormal.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                AutoSizeTextInfoFieldWidget(
                  text: catatan,
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                ButtonPrimary(
                  color: goldPrimaryMain,
                  mainButtonMessage: 'Perbarui',
                  mainButton: () {
                    Navigator.pushNamed(context, UPDATE_REGISTER_IBU_HAMIL);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
