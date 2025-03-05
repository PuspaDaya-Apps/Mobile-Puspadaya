import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/auto_size_text_field_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/radio_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../pengukuranAnak/alatUkur/bloc/alat_ukur_anak_bloc.dart';
import '../bloc/create_register_ibu_hamil_bloc.dart';
import '../cubit/search_ibu_hamil_cubit.dart';
import '../model/post_ibu_hamil_model.dart';
import 'model/ibu_hamil_item_model.dart';
import 'search_ibu_hamil.dart';

class CreateRegisterIbuHamil extends StatelessWidget {
  const CreateRegisterIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateRegisterIbuHamilBloc(),
        ),
        BlocProvider(
          create: (context) => SearchIbuHamilCubit(),
        ),
        BlocProvider(
          create: (context) => AlatUkurAnakBloc(),
        ),
      ],
      child: CreateRegisterIbuHamilView(),
    );
  }
}

class CreateRegisterIbuHamilView extends StatefulWidget {
  const CreateRegisterIbuHamilView({super.key});

  @override
  State<CreateRegisterIbuHamilView> createState() =>
      _CreateRegisterIbuHamilViewState();
}

class _CreateRegisterIbuHamilViewState
    extends State<CreateRegisterIbuHamilView> {
  final _formKey = GlobalKey<FormState>();
  bool _isExpanded = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaSuamiController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _uterineFundusHeightController =
      TextEditingController();
  TextEditingController _armCircumferenceController = TextEditingController();
  TextEditingController _hemogoblinController = TextEditingController();
  TextEditingController _firstDateHaidController = TextEditingController();
  TextEditingController _lastDateHaidController = TextEditingController();
  int? exposedCigaretteSmoke = 0;
  TextEditingController _tabletFeController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  TextEditingController _usiaKehamilanController = TextEditingController();

  String selectedPosyandu = 'Posyandu Mawar 1';
  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';
  late String ibuId;
  String alatUkur = '';
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlatUkurAnakBloc>(context).add(GetAlatUkur());
  }

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

    setState(() {
      _firstDateHaidController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
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

    setState(() {
      _lastDateHaidController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
    }

  final List<String> selectPosyandu = [
    'Posyandu Mawar 1',
    'Posyandu Anggrek 5',
    'Posyandu Melati Indah',
    'Posyandu Melati 3'
  ];

  int _parseInt(String value) {
    return int.tryParse(value.trim()) ?? 0;
  }

  double _parseDouble(String value) {
    return double.tryParse(value.trim()) ?? 0.0;
  }

  String _formatDate(String value) {
    try {
      DateTime parsedDate = DateTime.parse(value.trim());
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      return "0000-00-00"; // Jika format salah, kirim default atau kosong
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9;
    return BlocListener<AlatUkurAnakBloc, AlatUkurAnakState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is AlatUkurAnakSuccessState) {
          alatUkur = state.alatUkurResponseModel.data![0].id;
        }
        if (state is AlatUkurAnakFailedState) {
          showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().error(state.error));
        }
      },
      child: Scaffold(
        backgroundColor: backgroundWhite10,
        appBar: PrimaryAppBar(
          title: "Tambah Ibu Hamil",
          actions: [
            // GestureDetector(
            //   onTap: () {
            //     showDialog(
            //       context: context,
            //       builder: (context) => AlertChooseMeasuringTools(
            //         title: 'Pilih Alat Ukur',
            //         mainButton: () {
            //           Navigator.pop(context);
            //         },
            //         mainButtonMessage: 'Simpan',
            //         colorMainButton: bluePrimaryMain,
            //         selectedHeight: selectedHeight,
            //         selectedWeight: selectedWeight,
            //         selectedUpperArmCircumference:
            //             selectedUpperArmCircumference,
            //         selectedUterineFundalHeight: selectedUterineFundalHeight,
            //         onHeightChanged: (value) {
            //           setState(() {
            //             selectedHeight = value;
            //           });
            //         },
            //         onWeightChanged: (value) {
            //           setState(() {
            //             selectedWeight = value;
            //           });
            //         },
            //         onUpperArmCircumferenceChanged: (value) {
            //           setState(() {
            //             selectedUpperArmCircumference = value;
            //           });
            //         },
            //         onUterineFundalHeightChanged: (value) {
            //           setState(() {
            //             selectedUterineFundalHeight = value;
            //           });
            //         },
            //       ),
            //     );
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.only(right: 24),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //     decoration: BoxDecoration(
            //       color: bluePrimary30,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Row(
            //       spacing: 2,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(
            //           FontAwesomeIcons.penToSquare,
            //           color: Colors.white,
            //           size: 14,
            //         ),
            //         Text(
            //           'Ubah Alat',
            //           style: AppTextStyles.primaryTextMedium.copyWith(
            //             fontSize: 12,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                                  ibuId = state.ibuId;
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
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
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
                              validators: [
                                (value) => Validator.required(
                                    value, "Usia Ibu Hamil Wajib Diisi"),
                              ],
                            ),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            Text(
                              'NIK',
                              style: AppTextStyles.primaryTextNormal
                                  .copyWith(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            TextFieldWidget(
                              controller: _nikController,
                              hintText: "NIK",
                              validators: [
                                (value) => Validator.required(
                                    value, "NIK Wajib Diisi"),
                              ],
                              isPasswordField: false,
                              keyboardType: TextInputType.number,
                              obscureText: false,
                            ),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
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
                              validators: [
                                (value) => Validator.required(
                                    value, "Nama Suami Wajib Diisi"),
                              ],
                            ),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
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
                                    style: AppTextStyles.primaryTextMedium
                                        .copyWith(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tempat pengukuran Wajib dipilih";
                        }
                        return null;
                      },
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
                                hintText: 'contoh: 150 cm',
                                unit: 'cm',
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Tingi Badan Wajib diisi'),
                                ],
                                // tool: 'Microtoise',
                                controller: _heightController,
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              MeasurementWidget(
                                title: 'Tinggi Fundus Uteri',
                                hintText: 'contoh: 10 cm',
                                unit: 'cm',
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Tinggi Fundus Uteri Wajib diisi'),
                                ],
                                // tool: 'Pita Lila',
                                controller: _uterineFundusHeightController,
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
                                hintText: 'contoh: 50,5',
                                unit: 'kg',
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Berat Badan Wajib diisi'),
                                ],
                                // tool: 'Timbangan Digital',
                                controller: _weightController,
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              MeasurementWidget(
                                title: 'Lingkar Lengan Atas',
                                hintText: 'contoh: 15',
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Lingkar Lengan Atas Wajib diisi'),
                                ],
                                unit: 'cm',
                                // tool: 'Alat Ukur Lingkar Lengan Atas',
                                controller: _armCircumferenceController,
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
                            validators: [
                              (value) => Validator.required(
                                  value, 'Hemogoblin Wajib diisi'),
                            ],
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
                          return "Tanggal Wajib dipilih";
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
                          return "Tanggal Wajib dipilih";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                    Text(
                      'Usia Kehamilan',
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                    TextFieldWidget(
                      controller: _usiaKehamilanController,
                      hintText: "Usia Kehamilan (minggu)",
                      validators: [
                        (value) => Validator.required(
                            value, 'Usia Kehamilan Wajib diisi'),
                      ],
                      isPasswordField: false,
                      keyboardType: TextInputType.number,
                      obscureText: false,
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
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
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
                                validators: [
                                  (value) => Validator.required(
                                      value, 'Jumlah Table FE Wajib diisi'),
                                ],
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
                    BlocListener<CreateRegisterIbuHamilBloc,
                        CreateRegisterIbuHamilState>(
                      listener: (context, state) {
                        debugPrint(state.toString());
                        if (state is CreateRegisterIbuHamilSendSuccess) {
                          showTopSnackBar(
                              Overlay.of(context),
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              displayDuration:
                                  const Duration(milliseconds: 2200),
                              reverseAnimationDuration:
                                  const Duration(milliseconds: 300),
                              TopSnackbarWidget()
                                  .success('Berhasil Menambah Data Ibu Hamil'));
                          Navigator.pop(context);
                        }
                        if (state is CreateRegisterIbuHamilSendFailed) {
                          debugPrint(state.error.message);
                          showTopSnackBar(
                              Overlay.of(context),
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              displayDuration:
                                  const Duration(milliseconds: 2200),
                              reverseAnimationDuration:
                                  const Duration(milliseconds: 300),
                              TopSnackbarWidget().error(state.error.message));
                        }
                      },
                      child: ButtonPrimary(
                        color: bluePrimaryMain,
                        mainButtonMessage: 'Simpan',
                        mainButton: () {
                          if (_formKey.currentState!.validate()) {
                            print(
                                'Nama: ${_nameController.text} as type ${_nameController.text.runtimeType}');
                            print(
                                'Usia: ${_ageController.text} as type ${_ageController.text.runtimeType}');
                            print(
                                'NIK: ${_nikController.text} as type ${_nikController.text.runtimeType}');
                            print(
                                'Nama Suami: ${_namaSuamiController.text} as type ${_namaSuamiController.text.runtimeType}');
                            print(
                                'Tinggi Badan: ${_heightController.text} as type ${_heightController.text.runtimeType}');
                            print(
                                'Berat Badan: ${_weightController.text} as type ${_weightController.text.runtimeType}');
                            print(
                                'Tinggi Fundus Uteri: ${_uterineFundusHeightController.text} as type ${_uterineFundusHeightController.text.runtimeType}');
                            print(
                                'Lingkar Lengan Atas: ${_armCircumferenceController.text} as type ${_armCircumferenceController.text.runtimeType}');
                            print(
                                'Hemogoblin: ${_hemogoblinController.text} as type ${_hemogoblinController.text.runtimeType}');
                            print(
                                'Tanggal Pertama Haid: ${_firstDateHaidController.text} as type ${_firstDateHaidController.text.runtimeType}');
                            print(
                                'Tanggal Terakhir Haid: ${_lastDateHaidController.text} as type ${_lastDateHaidController.text.runtimeType}');
                            print(
                                'Tablet Fe: ${_tabletFeController.text} as type ${_tabletFeController.text.runtimeType}');
                            print(
                                'Catatan: ${_catatanController.text} as type ${_catatanController.text.runtimeType}');
                            print(
                                'Usia Kehamilan: ${_usiaKehamilanController.text} as type ${_usiaKehamilanController.text.runtimeType}');
                            print(
                                'alat id ${alatUkur} as type ${alatUkur.runtimeType}');
                            print(
                                'is terpapar asap rokok ${exposedCigaretteSmoke == 1 ? "Iya" : "Tidak"}');
                            print('ibu id ${ibuId}');

                            print(
                                'formated Date is ${_formatDate(_firstDateHaidController.text)}');

                            PostIbuHamilModel postData = PostIbuHamilModel(
                              alatBeratBadanId: alatUkur,
                              alatLingkarLenganId: alatUkur,
                              alatTinggiBadanId: alatUkur,
                              alatTinggiFundusId: alatUkur,
                              beratBadan: _parseDouble(_weightController.text),
                              catatan: _catatanController.text,
                              hemoglobin:
                                  _parseDouble(_hemogoblinController.text),
                              ibuId: ibuId,
                              jumlahTabletFe:
                                  _parseInt(_tabletFeController.text),
                              lingkarLenganAtas: _parseDouble(
                                  _armCircumferenceController.text),
                              terpaparAsapRokok:
                                  exposedCigaretteSmoke == 1 ? "Iya" : "Tidak",
                              tinggiBadan: _parseDouble(_heightController.text),
                              tinggiFundusUteri: _parseDouble(
                                  _uterineFundusHeightController.text),
                              tanggalPertamaHaid:
                                  _formatDate(_firstDateHaidController.text),
                              tanggalTerakhirHaid:
                                  _formatDate(_lastDateHaidController.text),
                              usiaKehamilan:
                                  _parseInt(_usiaKehamilanController.text),
                            );

                            context
                                .read<CreateRegisterIbuHamilBloc>()
                                .add(PostCreateIbuHamil(postData));
                          }
                        },
                      ),
                    ),
                  ],
                ),
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
        // result Wajib berisi objek Balita
        context.read<SearchIbuHamilCubit>().selectIbuHamil(
              namaIbu: result.nama,
              namaSuami: result.namaSuami,
              nik: result.nik,
              usia: result.usia,
              ibuId: result.ibuId,
            );
        // Kembalikan data ke halaman sebelumnya
        // Navigator.pop(context, result);
            },
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: Icon(
          FluentIcons.search_24_regular,
        ),
        hintText: 'Pilih Ibu Hamil',
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
