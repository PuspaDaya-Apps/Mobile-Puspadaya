import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/alert_choose_measuring_tools_widget.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/auto_size_text_field_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/radio_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../cubit/search_ibu_hamil_cubit.dart';
import 'model/ibu_hamil_item_model.dart';
import 'search_ibu_hamil.dart';

class UpdateRegisterIbuHamil extends StatelessWidget {
  const UpdateRegisterIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchIbuHamilCubit(),
      child: UpdateRegisterIbuHamilView(),
    );
  }
}

class UpdateRegisterIbuHamilView extends StatefulWidget {
  const UpdateRegisterIbuHamilView({super.key});

  @override
  State<UpdateRegisterIbuHamilView> createState() =>
      UpdateRegisterIbuHamilViewState();
}

class UpdateRegisterIbuHamilViewState
    extends State<UpdateRegisterIbuHamilView> {
  final _formKey = GlobalKey<FormState>();
  bool _isExpanded = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaSuamiController = TextEditingController();
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
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9;
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Perbarui Ibu Hamil",
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
                  AnimatedContainer(
                    // color: Colors.red,
                    duration:
                        const Duration(milliseconds: 300), // Durasi animasi
                    curve: Curves.easeInOut, // Kurva animasi
                    height: _isExpanded
                        ? sizeHeighofSingleForm * 4
                        : sizeHeighofSingleForm, // Tinggi menu saat diperluas/dikecilkan
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
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
                          BlocListener<SearchIbuHamilCubit,
                              SearchIbuHamilState>(
                            listener: (context, state) {
                              if (state is SearchIbuHamilSelected) {
                                _nameController.text = state.namaIbu;
                                _ageController.text = state.usia;
                                _nikController.text = state.nik;
                                _namaSuamiController.text = state.namaSuami;
                              }
                            },
                            child: TextFormFieldSearch(
                              controller: _nameController,
                            ),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Text(
                            'Usia Ibu Hamil',
                            style: AppTextStyles.primaryTextNormal
                                .copyWith(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          TextFieldWidget(
                            controller: _ageController,
                            hintText: "Usia Ibu Hamil",
                            isPasswordField: false,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Text(
                            'NIK',
                            style: AppTextStyles.primaryTextNormal
                                .copyWith(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          TextFieldWidget(
                            controller: _nikController,
                            hintText: "NIK",
                            isPasswordField: false,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Text(
                            'Nama Suami',
                            style: AppTextStyles.primaryTextNormal
                                .copyWith(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          TextFieldWidget(
                            controller: _namaSuamiController,
                            hintText: "Nama Suami",
                            isPasswordField: false,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
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
                                  'Detail Ibu Hamil',
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
                      ],
                    ),
                  ),
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
                              // tool: 'Microtoise',
                              controller: _heightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Lengan Atas',
                              hintText: 'contoh: 3,5',
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
                              hintText: 'contoh: 6,5',
                              unit: 'kg',
                              // tool: 'Timbangan Digital',
                              controller: _weightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Kepala',
                              hintText: 'contoh: 6,5',
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
        IbuHamilItemModel result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchIbuHamil(),
          ),
        );
        logger.d(result);
        if (result != null) {
          // result harus berisi objek Balita
          context.read<SearchIbuHamilCubit>().selectIbuHamil(
                namaIbu: result.nama,
                namaSuami: result.namaSuami,
                nik: result.nik,
                usia: result.usia,
              );
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
