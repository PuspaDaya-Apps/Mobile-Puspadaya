import 'package:flutter/material.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../model/detailListKunjungan_model.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/daftar_kunjungan_detail_item.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../kunjungan/model/Kunjungan.dart';
import 'detail_kunjungan_selesai_anak_stunting.dart';
import 'detail_kunjungan_selesai_ibu_hamil.dart';

class DetailKunjunganIbuHamilDone extends StatelessWidget {
  const DetailKunjunganIbuHamilDone({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganIbuHamilDoneView();
  }
}

class DetailKunjunganIbuHamilDoneView extends StatefulWidget {
  const DetailKunjunganIbuHamilDoneView({super.key});

  @override
  State<DetailKunjunganIbuHamilDoneView> createState() =>
      _DetailKunjunganIbuHamilDoneViewState();
}

class _DetailKunjunganIbuHamilDoneViewState
    extends State<DetailKunjunganIbuHamilDoneView> {
  List<DetailListkunjunganModel> listDaftarKunjungan = [
    DetailListkunjunganModel(
      nik: "3621124011732625",
      id: '1',
      name: 'Ayu Halimah',
      status: Status.selesai,
      distance: '2,1',
    ),
    DetailListkunjunganModel(
      nik: "3621550192732625",
      id: '3',
      name: 'Clara Pratiwi',
      status: Status.selesai,
      distance: '3,0',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Kunjungan Ibu Hamil',
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
                    InfoFieldWidget(text: '8 Menit 1 Detik'),
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
                          child: InfoFieldWidget(text: '5,1'),
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
                              return DetailKunjunganSelesaiIbuHamil();
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
