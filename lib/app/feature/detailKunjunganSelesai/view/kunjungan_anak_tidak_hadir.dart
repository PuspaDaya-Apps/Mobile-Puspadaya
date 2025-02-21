import 'package:flutter/material.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../model/detailListKunjungan_model.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/daftar_kunjungan_detail_item.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../kunjungan/model/Kunjungan.dart';
import '../../kunjunganAnakStunting/detailKunjungan/view/detail_kunjungan_anak_stunting.dart';
import '../../kunjunganAnakTidakHadir/detailKunjungan/view/detail_kunjungan_anak_tidak_hadir.dart';

class DetailKunjunganAnakTidakHadirDone extends StatelessWidget {
  const DetailKunjunganAnakTidakHadirDone({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganAnakTidakHadirDoneView();
  }
}

class DetailKunjunganAnakTidakHadirDoneView extends StatefulWidget {
  const DetailKunjunganAnakTidakHadirDoneView({super.key});

  @override
  State<DetailKunjunganAnakTidakHadirDoneView> createState() =>
      _DetailKunjunganAnakTidakHadirDoneViewState();
}

class _DetailKunjunganAnakTidakHadirDoneViewState
    extends State<DetailKunjunganAnakTidakHadirDoneView> {
  List<DetailListkunjunganModel> listDaftarKunjungan = [
    DetailListkunjunganModel(
      nik: "3626578311732625",
      id: '1',
      name: 'Tedi Prakasa',
      status: Status.selesai,
      distance: '4,1',
    ),
    DetailListkunjunganModel(
      nik: "362158753432625",
      id: '3',
      name: 'Dewi Lestari',
      status: Status.selesai,
      distance: '2,7',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Kunjungan Anak Tidak Hadir',
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
                    InfoFieldWidget(text: '12 Menit 20 Detik'),
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
                          child: InfoFieldWidget(text: '2.4'),
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
                              return DetailKunjunganAnakTidakHadir();
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
