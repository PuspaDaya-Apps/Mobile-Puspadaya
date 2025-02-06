import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/dropdown_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../../../../view/widget/textField_widget.dart';
import '../../detail/view/detail_alat_ukur.dart';

class CreateAlatUkur extends StatelessWidget {
  const CreateAlatUkur({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateAlatUkurView();
  }
}

class CreateAlatUkurView extends StatefulWidget {
  const CreateAlatUkurView({super.key});

  @override
  State<CreateAlatUkurView> createState() => _CreateAlatUkurViewState();
}

class _CreateAlatUkurViewState extends State<CreateAlatUkurView> {
  final TextEditingController _otherController = TextEditingController();
  final TextEditingController _merekAlatController = TextEditingController();
  final List<String> selectJenisAlat = [
    'Alat deteksi dini perkembangan (SDIDTK)',
    'Timbangan Digital',
  ];
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
        title: 'Create Alat Ukur',
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
                    : selectedAlat == 'Timbangan Digital'
                    ? Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kriteria Alat',
                            style: AppTextStyles.primaryTextMedium.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '1.) Kuat dan tahan lama.',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2.) Mempunyai ketelitian 10 g atau 0,01 kg.',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '3.) Kapasitas maksimal 20 kg.',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '4.) Jika timbangan menggunakan baterai, \njenis dan ukuran baterai harus \ntersedia di daerah setempat.',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 10,
                            ),
                            // Removed overflow property to allow wrapping
                          ),
                          SizedBox(height: 10),
                          Text(
                            '5.) Mudah dimobilisasikan untuk kunjungan rumah.',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '6.) Bukan merupakan timbangan pegas atau \nbaby scale manual.',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '7.) Memiliki Standar Nasional Indonesia (SNI).',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
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
