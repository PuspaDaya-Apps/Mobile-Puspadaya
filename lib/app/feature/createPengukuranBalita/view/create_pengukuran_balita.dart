import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/createPengukuranBalita/bloc/cubit/search_balita_cubit.dart';
import 'package:puspadaya/app/feature/createPengukuranBalita/model/balita_search.dart';
import 'package:puspadaya/app/feature/createPengukuranBalita/view/search_balita.dart';
import 'package:puspadaya/app/view/widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/config/validator/pengukuran_balita_validator.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class CreatePengukuranBalita extends StatelessWidget {
  const CreatePengukuranBalita({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBalitaCubit(),
      child: const CreatePengukuranBalitaView(),
    );
  }
}

class CreatePengukuranBalitaView extends StatefulWidget {
  const CreatePengukuranBalitaView({super.key});

  @override
  State<CreatePengukuranBalitaView> createState() =>
      _CreatePengukuranBalitaViewState();
}

class _CreatePengukuranBalitaViewState
    extends State<CreatePengukuranBalitaView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _upperArmCircumferenceController =
      TextEditingController();
  TextEditingController _headCircumferenceController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();

  bool _isExpanded = false;

  final _formKey = GlobalKey<FormState>();
  String selectedPosyandu = 'Posyandu A';
  String selectedPosition = 'Terlentang';
  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';

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
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9.7;

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Pengukuran Anak",
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialogFormWidget(
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
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    // color: Colors.red,
                    duration:
                        const Duration(milliseconds: 300), // Durasi animasi
                    curve: Curves.easeInOut, // Kurva animasi
                    height: _isExpanded
                        ? sizeHeighofSingleForm * 3
                        : sizeHeighofSingleForm, // Tinggi menu saat diperluas/dikecilkan
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nama',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          BlocListener<SearchBalitaCubit, SearchBalitaState>(
                            listener: (context, state) {
                              if (state is SearchBalitaSelected) {
                                _nameController.text = state.name;
                                _nikController.text = state.nik;
                              }
                            },
                            child: TextFormFieldSearch(
                              controller: _nameController,
                            ),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Visibility(
                            visible: _isExpanded,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'NIK',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                TextFieldWidget(
                                  controller: _nikController,
                                  hintText: "NIK",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  validator: (value) {},
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                                const Text(
                                  'Usia',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                TextFieldWidget(
                                  controller: _ageController,
                                  hintText: "Usia",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  validator: (value) {},
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Ukuran Row hanya mengikuti konten
                              children: [
                                Text(
                                  'Detail Anak',
                                  style:
                                      AppTextStyles.primaryTextMedium.copyWith(
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
                                    controller:
                                        _upperArmCircumferenceController,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  Text(
                                    'Asi Ekskusif',
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8),
                                  ),
                                  // radio button
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        width:
                                            SizeConfig.calHeightMultiplier(16),
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
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8),
                                  ),
                                  // radio button
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogSave(
                                  cancelButton: () {
                                    Navigator.pop(context);
                                  },
                                  mainButton: () {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialogResult(
                                          nik: _nikController.text,
                                          name: _nameController.text,
                                          statusStunting: 'Normal',
                                          statusGizi: 'Normal',
                                          mainButton: () {
                                            Navigator.pop(context);
                                          },
                                          mainButtonMessage:
                                              'Tambah Pengukuran',
                                          cancelButton: () {
                                            Navigator.pop(
                                                context); // Tutup dialog AlertDialogResult
                                            // ! terdapat permasalahan disini
                                          },
                                          cancelButtonMessage: 'Selesai',
                                          colorMainButton: bluePrimaryMain,
                                        );
                                      },
                                    );
                                  },
                                  cancelButtonMessage: 'Tidak',
                                  mainButtonMessage: 'Iya Simpan Data',
                                  colorMainButton: bluePrimaryMain,
                                  heighValue: _heightController.text,
                                  weightValue: _weightController.text,
                                  upperArmCircumference:
                                      _upperArmCircumferenceController.text,
                                  uterineFundalHeightValue:
                                      _upperArmCircumferenceController.text,
                                );
                              },
                            );

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldSearch extends StatelessWidget {
  const TextFormFieldSearch({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      validator: (value) {
        PengukuranBalitaValidator.validateNama(value!);
      },
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchBalita(),
          ),
        );
        logger.d(result);
        if (result != null) {
          // result harus berisi objek Balita
          context
              .read<SearchBalitaCubit>()
              .selectBalita(result.name, result.nik);
          // Kembalikan data ke halaman sebelumnya
          // Navigator.pop(context, result);
        }
      },
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: Icon(
          FluentIcons.search_24_regular,
        ),
        hintText: 'Pilih Anak',
        hintStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
        filled: true,
        fillColor: backgroundWhite10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: bluePrimaryMain),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
      ),
    );
  }
}

class AlertDialogFormWidget extends StatelessWidget {
  final String title;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;
  final String selectedHeight;
  final String selectedWeight;
  final String selectedUpperArmCircumference;
  final String selectedUterineFundalHeight;
  final ValueChanged onHeightChanged;
  final ValueChanged onWeightChanged;
  final ValueChanged onUpperArmCircumferenceChanged;
  final ValueChanged onUterineFundalHeightChanged;

  List<String> selectHeight = [
    'Microtoise',
    'Alat Ukur Tinggi Badan',
    'Alat Ukur Lainnya',
  ];

  List<String> selectWeight = [
    'Timbangan Digital',
    'Timbangan Manual',
    'Timbangan Lainnya',
  ];

  List<String> selectUpperArmCircumference = [
    'Pita Lila',
    'Alat Ukur Lainnya',
  ];

  List<String> selectUterineFundalHeight = [
    'Metline',
    'Alat Ukur Lainnya',
  ];

  AlertDialogFormWidget({
    super.key,
    required this.title,
    required this.mainButton,
    required this.mainButtonMessage,
    required this.colorMainButton,
    required this.selectedHeight,
    required this.selectedWeight,
    required this.selectedUpperArmCircumference,
    required this.selectedUterineFundalHeight,
    required this.onHeightChanged,
    required this.onWeightChanged,
    required this.onUpperArmCircumferenceChanged,
    required this.onUterineFundalHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true, // Make the dialog scrollable
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
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
                      Text(
                        'Tinggi Badan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DropdownWidget(
                        items: selectHeight,
                        hint: 'Tinggi Badan',
                        value: selectedHeight,
                        onChanged: onHeightChanged, // Update selected height
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Lingkar Lengan Atas',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DropdownWidget(
                        items: selectUpperArmCircumference,
                        hint: 'Lingkar Lengan Atas',
                        value: selectedUpperArmCircumference,
                        onChanged:
                            onUpperArmCircumferenceChanged, // Update selected upper arm circumference
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Berat Badan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DropdownWidget(
                        items: selectWeight,
                        hint: 'Berat Badan',
                        value: selectedWeight,
                        onChanged: onWeightChanged, // Update selected weight
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Tinggi Fundus Uteri',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DropdownWidget(
                        items: selectUterineFundalHeight,
                        hint: 'Tinggi Fundus Uteri',
                        value: selectedUterineFundalHeight,
                        onChanged:
                            onUterineFundalHeightChanged, // Update selected uterine fundal height
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(30)),
            ButtonPrimary(
              mainButtonMessage: mainButtonMessage,
              mainButton: mainButton,
              color: colorMainButton,
            ),
          ],
        ),
      ),
    );
  }
}

class AlertDialogSave extends StatelessWidget {
  final String heighValue;
  final String weightValue;
  final String upperArmCircumference;
  final String uterineFundalHeightValue;

  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;
  final String? cancelButtonMessage;
  final VoidCallback? cancelButton;
  const AlertDialogSave({
    super.key,
    required this.mainButton,
    required this.mainButtonMessage,
    required this.colorMainButton,
    this.cancelButtonMessage,
    this.cancelButton,
    required this.heighValue,
    required this.weightValue,
    required this.upperArmCircumference,
    required this.uterineFundalHeightValue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true, // Make the dialog scrollable
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage(imageConfirmSave),
                height: 200,
                width: 200,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              'Apakah Anda Yakin Untuk Menyimpan Data?',
              style: AppTextStyles.primaryTextSemibold.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(12)),
            Text(
              textAlign: TextAlign.start,
              'Data Pengukuran : ',
              style: AppTextStyles.secoundaryText.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
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
                      Text(
                        'Tinggi Badan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: heighValue,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'cm',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Lingkar Lengan Atas',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: upperArmCircumference,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'cm',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
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
                      Text(
                        'Berat Badan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: weightValue,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'kg',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Tinggi Fundus Uteri',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                              text: uterineFundalHeightValue,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'cm',
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(30)),
            ButtonPrimary(
              mainButtonMessage: mainButtonMessage,
              mainButton: mainButton,
              color: colorMainButton,
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(12),
            ),
            // Tampilkan cancel button hanya jika keduanya tidak null
            if (cancelButtonMessage != null && cancelButton != null)
              Center(
                child: GestureDetector(
                  onTap: cancelButton,
                  child: Text(
                    cancelButtonMessage!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class AlertDialogResult extends StatelessWidget {
  final String nik;
  final String name;
  final String statusStunting;
  final String statusGizi;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;
  final String? cancelButtonMessage;
  final VoidCallback? cancelButton;

  const AlertDialogResult({
    super.key,
    required this.nik,
    required this.name,
    required this.statusStunting,
    required this.statusGizi,
    required this.mainButton,
    required this.mainButtonMessage,
    required this.colorMainButton,
    this.cancelButtonMessage,
    this.cancelButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true, // Make the dialog scrollable
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure Column adapts to its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Hasil Pengukuran',
                style: AppTextStyles.primaryTextSemibold.copyWith(
                  fontSize: SizeConfig.calHeightMultiplier(16),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(12)),
            Text(
              'Identitas Anak',
              style: AppTextStyles.primaryTextSemibold.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(4)),
            Text(
              'NIK : ${nik}',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            Text(
              'Nama : ${name}',
              style: AppTextStyles.primaryTextNormal.copyWith(
                fontSize: SizeConfig.calHeightMultiplier(12),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(12)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status Stunting',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(text: statusStunting),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status Gizi',
                        style: AppTextStyles.primaryTextMedium.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(text: statusGizi),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(30)),
            ButtonPrimary(
              mainButtonMessage: mainButtonMessage,
              mainButton: mainButton,
              color: colorMainButton,
            ),
            if (cancelButtonMessage != null && cancelButton != null) ...[
              SizedBox(height: SizeConfig.calHeightMultiplier(12)),
              Center(
                child: GestureDetector(
                  onTap: cancelButton,
                  child: Text(
                    cancelButtonMessage!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
