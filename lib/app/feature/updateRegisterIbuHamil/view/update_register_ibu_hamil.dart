import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../model/paketToScreen/paketToUpdateRegisterIbuHamil.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/auto_size_text_field_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/radio_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../createRegisterIbuHamil/model/post_ibu_hamil_model.dart';
import '../../pengukuranAnak/alatUkur/bloc/alat_ukur_anak_bloc.dart';
import '../bloc/update_register_ibu_hamil_bloc.dart';

class UpdateRegisterIbuHamil extends StatelessWidget {
  final PaketToUpdateRegisterIbuHamil data;
  const UpdateRegisterIbuHamil({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlatUkurAnakBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateRegisterIbuHamilBloc(),
        ),
      ],
      child: UpdateRegisterIbuHamilView(
        data: data,
      ),
    );
  }
}

class UpdateRegisterIbuHamilView extends StatefulWidget {
  final PaketToUpdateRegisterIbuHamil data;
  const UpdateRegisterIbuHamilView({super.key, required this.data});

  @override
  State<UpdateRegisterIbuHamilView> createState() =>
      UpdateRegisterIbuHamilViewState();
}

class UpdateRegisterIbuHamilViewState
    extends State<UpdateRegisterIbuHamilView> {
  final _formKey = GlobalKey<FormState>();
  bool _isExpanded = false;
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _upperArmCircumferenceController = TextEditingController();
  TextEditingController _uterineFundusHeightController = TextEditingController();
  TextEditingController _hemogoblinController = TextEditingController();
  TextEditingController _firstDateHaidController = TextEditingController();
  TextEditingController _lastDateHaidController = TextEditingController();
  int? exposedCigaretteSmoke = 0;
  TextEditingController _tabletFeController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  TextEditingController _usiaKehamilanController = TextEditingController();
  TextEditingController _namaBPJSController = TextEditingController();

  String selectedPosyandu = 'Posyandu';
  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';
  String alatUkur = '';

  bool boolNamaBPJS = false;
  String? selectedMemilikiBPJS;
  String? selectedNamaBPJS; 
  int? selectedRadioBPJS;

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

  String convertDateToYYMMDD(DateTime? date) {
    if (date == null) return ''; // Handle jika null
    return DateFormat('yyyy-MM-dd').format(date);
  }

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
  void initState() {
    BlocProvider.of<AlatUkurAnakBloc>(context).add(GetAlatUkur());
    _firstDateHaidController.text = convertDateToYYMMDD(widget.data.data.tanggalPertamaHaid);
    _lastDateHaidController.text = convertDateToYYMMDD(widget.data.data.tanggalTerakhirHaid);
    _heightController.text = widget.data.data.tinggiBadan;
    _weightController.text = widget.data.data.beratBadan;
    _catatanController.text = widget.data.data.catatan;
    _tabletFeController.text = widget.data.data.jumlahTabletFe.toString();
    _upperArmCircumferenceController.text = widget.data.data.lingkarLenganAtas;
    _hemogoblinController.text =  widget.data.data.hemoglobin.replaceAll('.00', '');
    _uterineFundusHeightController.text = widget.data.data.tinggiFundusUteri;
    _usiaKehamilanController.text = widget.data.data.usiaKehamilan.toString();

    if(widget.data.data.kepemilikanBPJS == "Tidak") {
      boolNamaBPJS = false;
      selectedMemilikiBPJS = "Tidak";
    } else {
      boolNamaBPJS = true;
      selectedMemilikiBPJS = "Iya";
    }

    switch(widget.data.data.namaBPJS) {
      case null :
        selectedNamaBPJS = null;
      
      case "BPJS PBI (bantuan)" :
        selectedRadioBPJS = 0;
        selectedNamaBPJS = widget.data.data.namaBPJS;

      case "BPJS Mandiri" :
        selectedRadioBPJS = 1;
        selectedNamaBPJS = widget.data.data.namaBPJS;

      default:
        selectedRadioBPJS = 2;
        _namaBPJSController = TextEditingController(text: widget.data.data.namaBPJS);
    }
    
    super.initState();
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
          title: "Perbarui Ibu Hamil",
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
                            InfoFieldWidget(
                                text: widget.data.data.ibuAnak.namaIbu),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            Text(
                              'Usia Ibu Hamil',
                              style: AppTextStyles.primaryTextNormal
                                  .copyWith(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(
                                text: widget.data.data.ibuAnak.usia),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            Text(
                              'NIK',
                              style: AppTextStyles.primaryTextNormal
                                  .copyWith(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(text: widget.data.data.ibuAnak.nik),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
                            Text(
                              'Nama Suami',
                              style: AppTextStyles.primaryTextNormal
                                  .copyWith(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            InfoFieldWidget(
                                text: widget.data.data.ibuAnak.ayah.namaAyah),
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
                      onChanged: (value) {
                        setState(() {
                          selectedPosyandu = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih Tempat Pengukuran';
                        }
                        return null;
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
                                hintText: 'contoh: 150,5',
                                unit: 'cm',
                                // tool: 'Microtoise',
                                controller: _heightController,
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Tinggi Badan Wajib Diisi'),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              MeasurementWidget(
                                title: 'Lingkar Lengan Atas',
                                hintText: 'contoh: 12,5',
                                unit: 'cm',
                                // tool: 'Pita Lila',
                                controller: _upperArmCircumferenceController,
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Lingkar Lengan Atas Wajib Diisi'),
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
                                hintText: 'contoh: 60,5',
                                unit: 'kg',
                                // tool: 'Timbangan Digital',
                                controller: _weightController,
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Berat Badan Atas Wajib Diisi'),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              MeasurementWidget(
                                title: 'Tinggi Fundus Uteri',
                                hintText: 'contoh: 15,5',
                                unit: 'cm',
                                validator: [
                                  (value) => Validator.required(
                                      value, 'Tinggi Fundus Uteri Wajib Diisi'),
                                ],
                                // tool: 'Alat Ukur Lingkar Kepala',
                                controller: _uterineFundusHeightController,
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
                            validators: [
                              (value) => Validator.required(
                                  value, 'Hemogoblin Wajib Diisi'),
                            ],
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
                    Text(
                      'Usia Kehamilan (Minggu)',
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
                            value, 'Usia Kehamilan harus diisi'),
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
                            spacing: 16,
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
                                validators: [
                                  (value) => Validator.required(
                                      value, 'Jumlah Tablet FE Wajib Diisi')
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    //!
                    SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                    Text(
                      'Kepemilikian BPJS',
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 10,
                      children: [
                        Expanded(
                          child: ButtonPrimary(
                            color: selectedMemilikiBPJS == null ? buttonThird : selectedMemilikiBPJS == "Iya" ? buttonThird : stroke10,
                            mainButtonMessage: 'Iya',
                            mainButton: () {
                              setState(() {
                                selectedMemilikiBPJS = "Iya";
                                boolNamaBPJS = true;

                                selectedRadioBPJS = 0;
                                selectedNamaBPJS = 'BPJS PBI (bantuan)';
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: ButtonPrimary(
                            color: selectedMemilikiBPJS == null ? redPrimaryMain : selectedMemilikiBPJS == "Tidak" ? redPrimaryMain : stroke10,
                            mainButtonMessage: 'Tidak',
                            mainButton: () {
                              setState(() {
                                selectedMemilikiBPJS = "Tidak";
                                boolNamaBPJS = false;

                                selectedRadioBPJS = null;
                                selectedNamaBPJS = null;
                                _namaBPJSController = TextEditingController();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                    boolNamaBPJS == false
                    ? SizedBox()
                    : selectedRadioBPJS == 2
                    ? TextFieldWidget(
                      controller: _namaBPJSController,
                      hintText: "Masukan Nama BPJS Anda",
                      validators: selectedRadioBPJS == 2 ? [
                        (value) => Validator.required(
                            value, 'Nama BPJS Wajib diisi'),
                      ] : null,
                      isPasswordField: false,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    )
                    : Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        CustomRadioButton(
                          value: 0,
                          groupValue: selectedRadioBPJS!,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioBPJS = value;
                              selectedNamaBPJS = 'BPJS PBI (bantuan)';
                            });
                          },
                          label: 'BPJS PBI (bantuan)',
                        ),
                        CustomRadioButton(
                          value: 1,
                          groupValue: selectedRadioBPJS!,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioBPJS = value;
                              selectedNamaBPJS = "BPJS Mandiri";
                            });
                          },
                          label: "BPJS Mandiri",
                        ),
                        CustomRadioButton(
                          value: 2,
                          groupValue: selectedRadioBPJS!,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioBPJS = value;
                            });
                          },
                          label: 'lainnya',
                        ),
                        SizedBox(
                          width: SizeConfig.calHeightMultiplier(10),
                        ),
                      ],
                    ),
                    //!
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
                    BlocListener<UpdateRegisterIbuHamilBloc,
                        UpdateRegisterIbuHamilState>(
                      listener: (context, state) {
                        debugPrint(state.toString());
                        if (state is UpdateRegisterIbuHamilSendSuccess) {
                          showTopSnackBar(
                              Overlay.of(context),
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              displayDuration:
                                  const Duration(milliseconds: 2200),
                              reverseAnimationDuration:
                                  const Duration(milliseconds: 300),
                              TopSnackbarWidget()
                                  .success('Berhasil Perbarui Data Ibu Hamil'));
                          Navigator.pop(context);
                        }
                        if (state is UpdateRegisterIbuHamilFailed) {
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
                                'Nama: ${widget.data.data.ibuAnak.namaIbu} as type ${widget.data.data.ibuAnak.namaIbu.runtimeType}');
                            print(
                                'Usia: ${widget.data.data.ibuAnak.usia} as type ${widget.data.data.ibuAnak.usia.runtimeType}');
                            print(
                                'NIK: ${widget.data.data.ibuAnak.nik} as type ${widget.data.data.ibuAnak.nik.runtimeType}');
                            print(
                                'Nama Suami: ${widget.data.data.ibuAnak.ayah.namaAyah} as type ${widget.data.data.ibuAnak.ayah.namaAyah.runtimeType}');
                            print(
                                'Tinggi Badan: ${_heightController.text} as type ${_heightController.text.runtimeType}');
                            print(
                                'Berat Badan: ${_weightController.text} as type ${_weightController.text.runtimeType}');
                            print(
                                'Tinggi Fundus Uteri: ${_uterineFundusHeightController.text} as type ${_uterineFundusHeightController.text.runtimeType}');
                            print(
                                'Lingkar Lengan Atas: ${_upperArmCircumferenceController.text} as type ${_upperArmCircumferenceController.text.runtimeType}');
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
                            print('ibu id ${widget.data.data.ibuAnak.id}');

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
                              ibuId: widget.data.data.ibuAnak.id,
                              jumlahTabletFe:
                                  _parseInt(_tabletFeController.text),
                              lingkarLenganAtas: _parseDouble(
                                  _upperArmCircumferenceController.text),
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
                              memilkiBPJS: selectedMemilikiBPJS!, 
                              namaBPJS: selectedRadioBPJS == 2 ? _namaBPJSController.text: selectedNamaBPJS
                            );

                            context.read<UpdateRegisterIbuHamilBloc>().add(
                                PatchUpdateRegisterIbuHamil(
                                    postData, widget.data.id));
                          } else {
                            showTopSnackBar(
                              Overlay.of(context),
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              displayDuration:
                                  const Duration(milliseconds: 2200),
                              reverseAnimationDuration:
                                  const Duration(milliseconds: 300),
                              TopSnackbarWidget().warning("Form Tidak Boleh Kosong"));
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
