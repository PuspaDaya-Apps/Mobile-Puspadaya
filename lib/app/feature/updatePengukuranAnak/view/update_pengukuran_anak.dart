import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/view/widget/alert_choose_measuring_tools_widget.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_save_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class UpdatePengukuranAnak extends StatelessWidget {
  const UpdatePengukuranAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdatePengukuranAnakView();
  }
}

class UpdatePengukuranAnakView extends StatefulWidget {
  const UpdatePengukuranAnakView({super.key});

  @override
  State<UpdatePengukuranAnakView> createState() =>
      _UpdatePengukuranAnakViewState();
}

class _UpdatePengukuranAnakViewState extends State<UpdatePengukuranAnakView> {
  final _formKey = GlobalKey<FormState>();
  String selectedPosyandu = 'Posyandu A';
  String selectedPosition = 'Terlentang';
  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _upperArmCircumferenceController =
      TextEditingController();
  TextEditingController _headCircumferenceController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();

  final List<String> selectPosyandu = [
    'Posyandu A',
    'Posyandu B',
    'Posyandu C',
    'Posyandu D'
  ];

  final List<String> selectPosition = [
    'Terlentang',
    'Berdiri',
  ];
  int? asiEksklusifValue = 0;
  int? mpasiValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Perbarui Pengukuran",
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertChooseMeasuringTools(
                  title: 'Pilih Alat Ukur',
                  mainButton: () {
                    Navigator.pop(context);
                  },
                  mainButtonMessage: 'Simpan',
                  colorMainButton: bluePrimaryMain,
                  selectedHeight: selectedHeight,
                  selectedWeight: selectedWeight,
                  selectedUpperArmCircumference: selectedUpperArmCircumference,
                  selectedUterineFundalHeight: selectedUterineFundalHeight,
                  onHeightChanged: (value) {
                    setState(() {
                      selectedHeight = value;
                    });
                  },
                  onWeightChanged: (value) {
                    setState(() {
                      selectedWeight = value;
                    });
                  },
                  onUpperArmCircumferenceChanged: (value) {
                    setState(() {
                      selectedUpperArmCircumference = value;
                    });
                  },
                  onUterineFundalHeightChanged: (value) {
                    setState(() {
                      selectedUterineFundalHeight = value;
                    });
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: bluePrimary30,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.penToSquare,
                    color: Colors.white,
                    size: 14,
                  ),
                  Text(
                    'Ubah Alat',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Nama
                  const Text(
                    'Nama',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  InfoFieldWidget(text: 'Zahra Hazza Khusnul Khotimah'),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'NIK',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),

                  InfoFieldWidget(text: '354635284658310023'),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.black54,
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Tempat Pengukuran',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget(
                    items: selectPosyandu,
                    hint: 'Pilih Tempat Posyandu',
                    value: selectedPosyandu,
                    onChanged: (value) {
                      setState(() {
                        selectedPosyandu = value;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Posisi Pengukuran Tinggi Badan',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget(
                    items: selectPosition,
                    hint: 'Pilih Posisi Pengukuran Tinggi Badan',
                    value: selectedPosition,
                    onChanged: (value) {
                      setState(() {
                        selectedPosition = value;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MeasurementWidget(
                              title: 'Tinggi Badan',
                              hintText: 'contoh: 13,5',
                              unit: 'cm',
                              tool: 'Microtoise',
                              controller: _heightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Lengan Atas',
                              hintText: 'contoh: 3,5',
                              unit: 'cm',
                              tool: 'Pita Lila',
                              controller: _upperArmCircumferenceController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            Text(
                              'Asi Ekskusif',
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(8),
                            ),
                            // radio button
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomRadioButton(
                                  value: 1,
                                  groupValue: asiEksklusifValue!,
                                  onChanged: (value) {
                                    setState(() {
                                      asiEksklusifValue = value;
                                    });
                                  },
                                  label: 'Ya',
                                ),
                                SizedBox(
                                  width: SizeConfig.calHeightMultiplier(16),
                                ),
                                CustomRadioButton(
                                  value: 0,
                                  groupValue: asiEksklusifValue!,
                                  onChanged: (value) {
                                    setState(() {
                                      asiEksklusifValue = value;
                                    });
                                  },
                                  label: 'Tidak',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MeasurementWidget(
                              title: 'Berat Badan',
                              hintText: 'contoh: 6,5',
                              unit: 'kg',
                              tool: 'Timbangan Digital',
                              controller: _weightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Kepala',
                              hintText: 'contoh: 6,5',
                              unit: 'cm',
                              tool: 'Alat Ukur Lingkar Kepala',
                              controller: _headCircumferenceController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            Text(
                              'MPASI',
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(8),
                            ),
                            // radio button
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomRadioButton(
                                  value: 1,
                                  groupValue: mpasiValue!,
                                  onChanged: (value) {
                                    setState(() {
                                      mpasiValue = value;
                                    });
                                  },
                                  label: 'Ya',
                                ),
                                SizedBox(width: 16),
                                CustomRadioButton(
                                  value: 0,
                                  groupValue: mpasiValue!,
                                  onChanged: (value) {
                                    setState(() {
                                      mpasiValue = value;
                                    });
                                  },
                                  label: 'Tidak',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Catatan',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  AutoSizeTextFieldWidget(
                    controller: _catatanController,
                    hintText: 'Masukan Catatan',
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Keluhan',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  AutoSizeTextFieldWidget(
                    controller: _keluhanController,
                    hintText: 'Masukan Keluhan',
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  ButtonPrimary(
                    color: bluePrimaryMain,
                    mainButtonMessage: 'Simpan',
                    mainButton: () {
                      Navigator.pop(context);

                      // if (_formKey.currentState!.validate()) {
                      //   print('Nama: ${_nameController.text}');
                      //   print('NIK: ${_nikController.text}');
                      //   print('Usia: ${_ageController.text}');
                      //   print('Tempat Pengukuran: $selectedPosyandu');
                      //   print('Posisi Pengukuran: $selectedPosition');
                      //   print(
                      //       'Tinggi Badan: ${_heightController.text} cm');
                      //   print(
                      //       'Lingkar Lengan Atas: ${_upperArmCircumferenceController.text} cm');
                      //   print(
                      //       'Berat Badan: ${_weightController.text} kg');
                      //   print(
                      //       'Lingkar Kepala: ${_headCircumferenceController.text} cm');
                      //   print(
                      //       'Asi Eksklusif: ${asiEksklusifValue == 1 ? 'Ya' : 'Tidak'}');
                      //   print(
                      //       'MPASI: ${mpasiValue == 1 ? 'Ya' : 'Tidak'}');
                      //   print('Catatan: ${_catatanController.text}');
                      //   print('Keluhan: ${_keluhanController.text}');
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
