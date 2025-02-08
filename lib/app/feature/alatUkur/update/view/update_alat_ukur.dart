import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/dropdown_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../../../../view/widget/textField_widget.dart';
import '../../detail/view/detail_alat_ukur.dart';

class UpdateAlatUkur extends StatelessWidget {
  const UpdateAlatUkur({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdateAlatUkurView();
  }
}

class UpdateAlatUkurView extends StatefulWidget {
  const UpdateAlatUkurView({super.key});

  @override
  State<UpdateAlatUkurView> createState() => UpdateAlatUkurViewState();
}

class UpdateAlatUkurViewState extends State<UpdateAlatUkurView> {
  final TextEditingController _otherController = TextEditingController();
  final TextEditingController _merekAlatController = TextEditingController();
  final List<String> selectJenisAlat = [
    'Alat deteksi dini perkembangan (SDIDTK)',
    'Timbangan Injak Berat Badan Digital',
    'Timbangan Injak Berat Badan Non-Digital',
    'Timbangan Bayi Digital',
    'Timbangan Bayi Non Digital',
    'Timbangan Dacin',
    'Alat Ukur Badan (Microtoise)',
    'Alat Ukur Panjang Tinggi Badan (Stadiometer)',
    'Papan Pengukur Panjang Badan',
    'Pita Lingkar Lengan Atas',
    'Alat Ukur Lingkar Kepala',
    'Metline',
  ];
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

  final List<String> selectKondisiAlat = [
    'Baik',
    'Dimanfaatkan',
    'Rusak',
  ];
  String? selectedAlat;
  String? selectedKondisiAlat;
  List<Map<String, dynamic>> alatDeteksiDini = [
    {'label': 'Kubus', 'isChecked': false, 'isOther': false},
    {'label': 'Lonceng', 'isChecked': true, 'isOther': false},
    {'label': 'Kartu Bergambar', 'isChecked': true, 'isOther': false},
    {'label': 'Bola Ulir', 'isChecked': false, 'isOther': false},
    {'label': 'Lainnya', 'isChecked': false, 'isOther': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Perbarui Alat Ukur',
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
                const Text(
                  'Jenis Alat',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                DropdownWidget(
                  hint: "Pilih Jenis Alat",
                  value: selectedAlat,
                  onChanged: (value) {
                    setState(() {
                      selectedAlat = value;
                    });
                  },
                  items: selectJenisAlat,
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                selectedAlat == 'Alat deteksi dini perkembangan (SDIDTK)'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Alat Deteksi Dini (opsional)',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          Column(
                            children: alatDeteksiDini.map((alat) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IntrinsicWidth(
                                    child: CheckboxListWidget(
                                      isChecked: alat['isChecked'],
                                      label: alat['label'],
                                      onChanged: (value) {
                                        setState(() {
                                          alat['isChecked'] = value!;
                                          if (alat['isOther'] == true &&
                                              !value) {
                                            _otherController.clear();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  if (alat['isOther'] == true &&
                                      alat['isChecked'] == true) ...[
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: TextField(
                                        enabled: alat['isChecked'],
                                        controller: _otherController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          // Menghilangkan outline
                                          isDense: true,
                                        ),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      )
                    : alatGambarMap.containsKey(selectedAlat)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(
                                8), // Berikan border radius
                            child: Image.asset(
                              alatGambarMap[selectedAlat]!,
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Merek Alat',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: _merekAlatController,
                  hintText: "Masukan Merek Alat",
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  isPasswordField: false,
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Kondisi Alat',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                DropdownWidget(
                  hint: "Pilih Kondisi Alat",
                  value: selectedKondisiAlat,
                  onChanged: (value) {
                    setState(() {
                      selectedKondisiAlat = value;
                    });
                  },
                  items: selectKondisiAlat,
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                ButtonPrimary(
                  color: bluePrimaryMain,
                  mainButtonMessage: 'Simpan',
                  mainButton: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
