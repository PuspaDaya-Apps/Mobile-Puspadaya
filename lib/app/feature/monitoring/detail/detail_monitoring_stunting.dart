import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../view/widget/info_field_widget.dart';

class DetailMonitoringStunting extends StatelessWidget {
  final String id;
  const DetailMonitoringStunting({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DetailMonitoringStuntingView(id: id,);
  }
}

class DetailMonitoringStuntingView extends StatefulWidget {
  final String id;
  const DetailMonitoringStuntingView({super.key, required this.id});

  @override
  State<DetailMonitoringStuntingView> createState() =>
      _DetailMonitoringStuntingViewState();
}

class _DetailMonitoringStuntingViewState extends State<DetailMonitoringStuntingView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Monitoring Stunting',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isExpanded
                      ? sizeHeighofSingleForm * 2.98
                      : sizeHeighofSingleForm,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NIK',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(text: '36501231921234'),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Nama',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(text: 'Muhammad Joko Tarup'),
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                                  const Text(
                                    'Status Stunting',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                                  InfoFieldWidget(text: 'Stunting',color: redPrimaryMain,),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                                  const Text(
                                    'Umur',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                                  InfoFieldWidget(text: '1 Tahun 4 Bulan'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _isExpanded,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Nomor Kartu Keluarga',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: '1219382183772431223'),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              const Text(
                                'Nama Ayah',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: 'Martio Hasyim Huda'),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Nama Ibu',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: 'Putri Erika Fatmawati'),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              const Text(
                                textAlign: TextAlign.start,
                                'Alamat',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Banyuwangi'),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Kabat'),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Kabat'),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Bunder'),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(text: '11'),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(text: '03'),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(
                                text: 'Jl. Jendaral Sudirman, Gg. Jembatan Ayu',
                              ),
                            ],
                          ),
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
                          'Detail Anak',
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
                Image(image: AssetImage(imageGrafikPerkembanganAnak)),
                SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.black54,
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Text(
                  'Riwayat Pengukuran',
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
