import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/detailKunjunganSelesai/view/detail_kunjungan_selesai.dart';
import 'package:puspadaya/app/feature/kunjungan/model/Kunjungan.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../model/detailListKunjungan_model.dart';
import '../../../view/widget/daftar_kunjungan_detail_item.dart';

class DetailKunjunganAnakStuntingDone extends StatelessWidget {
  const DetailKunjunganAnakStuntingDone({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganAnakStuntingDoneView();
  }
}

class DetailKunjunganAnakStuntingDoneView extends StatefulWidget {
  const DetailKunjunganAnakStuntingDoneView({super.key});

  @override
  State<DetailKunjunganAnakStuntingDoneView> createState() =>
      _DetailKunjunganAnakStuntingDoneViewState();
}

class _DetailKunjunganAnakStuntingDoneViewState
    extends State<DetailKunjunganAnakStuntingDoneView> {
  List<DetailListkunjunganModel> listDaftarKunjungan = [
    DetailListkunjunganModel(
      nik: "3621554011732625",
      id: '1',
      name: 'Siti Aisyah',
      status: Status.selesai,
      distance: '5,1',
    ),
    DetailListkunjunganModel(
      nik: "3621554011732625",
      id: '2',
      name: 'Rahayu Putri Zahra',
      status: Status.selesai,
      distance: '5,1',
    ),
    DetailListkunjunganModel(
      nik: "3621554011732625",
      id: '3',
      name: 'Indana Maya Zulfa',
      status: Status.selesai,
      distance: '5,1',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Kunjungan Anak Stunting',
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
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bluePrimaryMain,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Mulai',
                                style: TextStyle(
                                  color: Colors.white,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Selesai',
                                style: TextStyle(
                                  color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                          child: InfoFieldWidget(text: '15 Menit 20 Detik'),
                        ),
                        Text(
                          'KM',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Daftar Kunjungan',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return DaftarKunjunganDetailItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailKunjunganSelesai();
                            },
                          ),
                        );
                      },
                      detailKunjungan: listDaftarKunjungan[index],
                      status: listDaftarKunjungan[index].status,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
