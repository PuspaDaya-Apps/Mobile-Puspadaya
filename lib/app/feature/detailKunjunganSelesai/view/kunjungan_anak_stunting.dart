import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/screen_config/size_config.dart';

class DetailKunjunganSelesai extends StatelessWidget {
  const DetailKunjunganSelesai({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganSelesaiView();
  }
}

class DetailKunjunganSelesaiView extends StatefulWidget {
  const DetailKunjunganSelesaiView({super.key});

  @override
  State<DetailKunjunganSelesaiView> createState() =>
      _DetailKunjunganSelesaiViewState();
}

class _DetailKunjunganSelesaiViewState
    extends State<DetailKunjunganSelesaiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Kunjungan',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bluePrimaryMain,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Mulai',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(text: '08.12'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Selesai',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(text: '08.12'),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(16),
                    ),
                    const Text(
                      'Lama Waktu Kunjungan',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(8),
                    ),
                    InfoFieldWidget(text: '15 Menit 20 Detik'),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(16),
                    ),
                    const Text(
                      'Jarak Tempuh',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(8),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InfoFieldWidget(text: '15 Menit 20 Detik'),
                        ),
                        Text('KM'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
