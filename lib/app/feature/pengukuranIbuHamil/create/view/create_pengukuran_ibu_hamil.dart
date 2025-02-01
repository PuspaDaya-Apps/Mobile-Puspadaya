import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/Bloc/cubit/search_ibu_hamil_cubit.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/Bloc/cubit/search_ibu_hamil_state.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/view/search_ibu_hamil.dart';
import 'package:puspadaya/app/view/widget/alert_choose_measuring_tools_widget.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_save_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field_widget.dart';
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class CreatePengukuranIbuHamil extends StatelessWidget {
  const CreatePengukuranIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchIbuHamilCubit(),
      child: CreatePengukuranIbuHamilView(),
    );
  }
}

class CreatePengukuranIbuHamilView extends StatefulWidget {
  const CreatePengukuranIbuHamilView({super.key});

  @override
  State<CreatePengukuranIbuHamilView> createState() =>
      _CreatePengukuranIbuHamilViewState();
}

class _CreatePengukuranIbuHamilViewState
    extends State<CreatePengukuranIbuHamilView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageMotherController = TextEditingController();
  TextEditingController _gestationalAgeController = TextEditingController();
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

  String selectedPosyandu = 'Posyandu A';
  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';

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
    'Posyandu A',
    'Posyandu B',
    'Posyandu C',
    'Posyandu D'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Pengukuran Ibu Hamil",
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nama',
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  BlocListener<SearchIbuHamilCubit, SearchIbuHamilState>(
                    listener: (context, state) {
                      if (state is SearchIbuHamilSelected) {
                        _nameController.text = state.name;
                      }
                    },
                    child: TextFormFieldSearch(
                      controller: _nameController,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Usia Ibu Hamil',
                    style:
                        AppTextStyles.primaryTextNormal.copyWith(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _ageMotherController,
                    hintText: "Usia Ibu Hamil",
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Usia Kehamilan',
                    style:
                        AppTextStyles.primaryTextNormal.copyWith(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _gestationalAgeController,
                    hintText: "Usia Kehamilan",
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                  ),
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialogSave(
                            cancelButton: () {
                              Navigator.pop(context);
                            },
                            mainButton: () {
                              Navigator.pop(context);
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
      validator: null,
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchIbuHamil(),
          ),
        );
        logger.d(result);
        if (result != null) {
          // result harus berisi objek Balita
          context
              .read<SearchIbuHamilCubit>()
              .selectIbuHamil(result.name, result.nik);
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
