import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/alatUkur/detail/view/detail_alat_ukur.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/card_alat_ukur_widget.dart';
import '../../../../view/widget/search_text_field_widget.dart';
import '../../model/alat_ukur_Item_model.dart';

class AlatUkur extends StatelessWidget {
  const AlatUkur({super.key});

  @override
  Widget build(BuildContext context) {
    return AlatUkurView();
  }
}

class AlatUkurView extends StatefulWidget {
  const AlatUkurView({super.key});

  @override
  State<AlatUkurView> createState() => _AlatUkurViewState();
}

class _AlatUkurViewState extends State<AlatUkurView> {
  TextEditingController _searchController = TextEditingController();
  final Map<String, String> alatGambarMap = {
    'Timbangan Injak Berat Badan Digital': imageTimbanganInjakBeratBadanDigital,
    'Timbangan Injak Berat Badan Non-Digital':
        imageTimbanganInjakBeratBadanNonDigital,
    'Timbangan Bayi Digital': imageTimbanganBayiDigital,
    'Timbangan Bayi Non Digital': imageTimbanganBayiNonDigital,
    'Timbangan Dacin': imageTimbanganDacin,
    'Alat Ukur Badan (Microtoise)': imageAlatUkurBadanMicrotoise,
    'Alat Ukur Panjang Tinggi Badan (Stadiometer)':
        imageAlatUkurPanjangTinggiBadanStadiometer,
    'Papan Pengukur Panjang Badan': imagePapanPengukurPanjangBadan,
    'Pita Lingkar Lengan Atas': imagePitLingkarLenganAtas,
    'Alat Ukur Lingkar Kepala': imageAlatUkurLingkarKepala,
    'Metline': imageMetline,
  };
  List<AlatUkurItemModel> alatUkur = [
    AlatUkurItemModel(
      id: '1',
      nama: 'Timbangan Injak Berat Badan Digital',
      merek: 'Kenko',
      kondisi: 'Baik',
      image: imageTimbanganInjakBeratBadanDigital,
    ),
    AlatUkurItemModel(
      id: '2',
      nama: 'Timbangan Injak Berat Badan Non-Digital',
      merek: 'Krisbow',
      kondisi: 'Baik',
      image: imageTimbanganInjakBeratBadanNonDigital,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Timbangan Bayi Digital',
      merek: 'Krisbow',
      kondisi: 'Baik',
      image: imageTimbanganBayiDigital,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Timbangan Bayi Non-Digital',
      merek: 'Krisbow',
      kondisi: 'Baik',
      image: imageTimbanganBayiNonDigital,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Timbangan Dacin',
      merek: 'Kenko',
      kondisi: 'Baik',
      image: imageTimbanganDacin,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Alat Ukur Tinggi Badan (Microtoise)',
      merek: 'Krisbow',
      kondisi: 'Dimanfaatkan',
      image: imageAlatUkurBadanMicrotoise,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Alat Ukur Panjang & Tinggi Badan (Stadiometer)',
      merek: 'Krisbow',
      kondisi: 'Dimanfaatkan',
      image: imageAlatUkurPanjangTinggiBadanStadiometer,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Papan Pengukur Panjang Badan',
      merek: 'Krisbow',
      kondisi: 'Rusak',
      image: imagePapanPengukurPanjangBadan,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Pita Lingkar Lengan Atas (LILA) usia 6-59 bulan',
      merek: 'Krisbow',
      kondisi: 'Rusak',
      image: imagePitLingkarLenganAtas,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Alat Ukur Lingkar Kepala',
      merek: 'Krisbow',
      kondisi: 'Rusak',
      image: imageAlatUkurLingkarKepala,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Metline',
      merek: 'Krisbow',
      kondisi: 'Rusak',
      image: imageMetline,
    ),
    AlatUkurItemModel(
      id: '3',
      nama: 'Alat Deteksi Dini Perkembangan (SDIDTK kit)',
      merek: 'Libra',
      kondisi: 'Dimanfaatkan',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Trigger fetch event when the view is initialized
    logger.d('trigger fetch');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Alat Ukur',
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
          Navigator.pushNamed(context, CREATE_ALAT_UKUR);
          // Add your navigation or functionality for adding new items
          print("Floating Action Button Pressed");
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Expanded(
                    child: SearchTextFieldWidget(
                      controller: _searchController,
                      hintText: 'Cari Data Alat Ukur',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      size: 30,
                      FluentIcons.filter_24_filled,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: alatUkur.length, // Ganti dengan data yang diambil
                  itemBuilder: (context, index) {
                    final AlatUkurItemModel alatUkurItem = alatUkur[index]; //
                    // Ganti dengan data yang diambil
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CardAlatUkurWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailAlatUkur(alatUkur: alatUkurItem);
                              },
                            ),
                          );
                          // Navigator.pushNamed(
                          //   context,
                          //   DETAIL_ALAT_UKUR,
                          //   arguments: alatUkurItem.id, // Pass the id directly
                          // );
                        },
                        nama: alatUkurItem.nama,
                        merek: alatUkurItem.merek,
                        kondisi: alatUkurItem.kondisi,
                      ),
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
