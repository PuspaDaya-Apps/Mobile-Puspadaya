import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/view/widget/alert_choose_measuring_tools_widget.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_save_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field_widget.dart';
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class UpdatePengukuranIbuHamil extends StatelessWidget {
  const UpdatePengukuranIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdatePengukuranIbuHamilView();
  }
}

class UpdatePengukuranIbuHamilView extends StatefulWidget {
  const UpdatePengukuranIbuHamilView({super.key});

  @override
  State<UpdatePengukuranIbuHamilView> createState() =>
      _UpdatePengukuranIbuHamilViewState();
}

class _UpdatePengukuranIbuHamilViewState
    extends State<UpdatePengukuranIbuHamilView> {
  final _formKey = GlobalKey<FormState>();
  String selectedPosyandu = 'Posyandu Mawar 1';
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
  TextEditingController _hemogoblinController = TextEditingController();
  TextEditingController _firstDateHaidController = TextEditingController();
  TextEditingController _lastDateHaidController = TextEditingController();
  int? exposedCigaretteSmoke = 0;
  TextEditingController _tabletFeController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();

  Future<void> _selectDateFirstHaid(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      cancelText: "Batalkan",
      confirmText: "OK",
      currentDate: DateTime.now(),
      helpText: "Pilih Tanggal",
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    if (pickedDate != null) {
      setState(() {
        _firstDateHaidController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectDateLastHaid(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      cancelText: "Batalkan",
      confirmText: "OK",
      currentDate: DateTime.now(),
      helpText: "Pilih Tanggal",
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    if (pickedDate != null) {
      setState(() {
        _lastDateHaidController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  final List<String> selectPosyandu = [
    'Posyandu Mawar 1',
    'Posyandu Anggrek 5',
    'Posyandu Melati Indah',
    'Posyandu Melati 3'
  ];
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
                  const Text(
                    'Nama Ibu Hamil',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  InfoFieldWidget(text: 'Siti Aisyah'),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Usia Ibu Hamil',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  InfoFieldWidget(text: '32 Tahun'),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Usia Kehamilan',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  InfoFieldWidget(text: '8 Bulan'),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.black54,
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Tempat Pengukuran',
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  DropdownWidget(
                    hint: 'Tempat Pengukuran',
                    items: selectPosyandu,
                    value: selectedPosyandu,
                    onChanged: (value) {
                      setState(() {
                        selectedPosyandu = value;
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
                              hintText: 'contoh: 13.5',
                              unit: 'cm',
                              // tool: 'Microtoise',
                              controller: _heightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Lengan Atas',
                              hintText: 'contoh: 3.5',
                              unit: 'cm',
                              // tool: 'Pita Lila',
                              controller: _upperArmCircumferenceController,
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
                              hintText: 'contoh: 6.5',
                              unit: 'kg',
                              // tool: 'Timbangan Digital',
                              controller: _weightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Kepala',
                              hintText: 'contoh: 6.5',
                              unit: 'cm',
                              // tool: 'Alat Ukur Lingkar Kepala',
                              controller: _headCircumferenceController,
                            ),
                            // radio button
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Hemogoblin',
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: _hemogoblinController,
                          hintText: "Hemogoblin",
                          isPasswordField: false,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                        ),
                      ),
                      Text(
                        'g/dl',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Tanggal Pertama Haid',
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  DateTimePickerWidget(
                    isDate: true,
                    controller: _firstDateHaidController,
                    selectDate: () {
                      _selectDateFirstHaid(context);
                    },
                    hintText: "Pilih Tanggal",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tanggal harus dipilih";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Tanggal Terakhir Haid',
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  DateTimePickerWidget(
                    isDate: true,
                    controller: _lastDateHaidController,
                    selectDate: () {
                      _selectDateLastHaid(context);
                    },
                    hintText: "Pilih Tanggal",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Tanggal harus dipilih";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              'Terpapar Asap Rokok',
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 16,
                              children: [
                                CustomRadioButton(
                                  value: 1,
                                  groupValue: exposedCigaretteSmoke!,
                                  onChanged: (value) {
                                    setState(() {
                                      exposedCigaretteSmoke = value;
                                    });
                                  },
                                  label: 'Ya',
                                ),
                                CustomRadioButton(
                                  value: 0,
                                  groupValue: exposedCigaretteSmoke!,
                                  onChanged: (value) {
                                    setState(() {
                                      exposedCigaretteSmoke = value;
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
                          spacing: 8,
                          children: [
                            Text(
                              'Tablet Fe',
                              style: AppTextStyles.primaryTextNormal
                                  .copyWith(fontSize: 12),
                            ),
                            TextFieldWidget(
                              controller: _tabletFeController,
                              hintText: "Jumlah Tablet FE",
                              isPasswordField: false,
                              keyboardType: TextInputType.number,
                              obscureText: false,
                            ),
                          ],
                        ),
                      )
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
                  AutoSizeTextFieldWidget(
                    controller: _catatanController,
                    hintText: 'Masukan Catatan',
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  ButtonPrimary(
                    color: bluePrimaryMain,
                    mainButtonMessage: 'Simpan',
                    mainButton: () {
                      Navigator.pop(context);
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
