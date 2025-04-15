import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/alat_ukur_response_model.dart';
import '../../../model/alat_ukur_save_model.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/widget/alert_choose_measuring_tools_ibu_hamil_widget.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/auto_size_text_field_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/radio_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
// import '../../pengukuranAnak/alatUkur/bloc/alat_ukur_anak_bloc.dart';
import '../../alatUkurSave/bloc/alatUkurSaveBloc/alat_ukur_save_bloc.dart';
import '../../alatUkurSave/bloc/getAlatUkurBloc/get_alat_ukur_bloc.dart';
import '../../alatUkurSave/bloc/saveAlatUkurBloc/save_alat_ukur_bloc.dart';
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
          create: (context) => AlatUkurSaveBloc(),
        ),
        BlocProvider(
          create: (context) => GetAlatUkurBloc(),
        ),
        BlocProvider(
          create: (context) => SaveAlatUkurBloc(),
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
  TextEditingController _namaBPJSController = TextEditingController();
  TextEditingController _jarakPosyanduController = TextEditingController();

  String selectedPosyandu = 'Posyandu';

  bool boolNamaBPJS = false;
  String? selectedMemilikiBPJS;
  String? selectedNamaBPJS;
  int? selectedRadioBPJS;

  late String ibuId;

  AlatUkurSaveModel alatUkurIbuHamil = AlatUkurSaveModel();
  AlatUkurResponseModel? listAlatUkur;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlatUkurSaveBloc>(context).add(GetAlatUkur());
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

    final saveAlatUkurBloc = BlocProvider.of<SaveAlatUkurBloc>(context);

    return BlocListener<GetAlatUkurBloc, GetAlatUkurState>(
      listener: (context, state) {
        if (state is GetAlatUkurIbuHamilSuccessState) {
          logger.i("Berhasil");
          setState(() {
            alatUkurIbuHamil = state.alatUkurIbuHamil;
          });
        }
        if (state is GetAlatUkurIbuHamilFailedState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertChooseMeasuringToolsIbuHamil(
              title: 'Pilih Alat Ukur',
              mainButton: () {
                Navigator.pop(context);
              },
              mainButtonMessage: 'Simpan',
              colorMainButton: bluePrimaryMain,
              listAlatUkur: listAlatUkur!,
              saveAlatUkurBloc: saveAlatUkurBloc,
            ),
          ).then((value) {
            if (value != null) {
              setState(() {
                alatUkurIbuHamil = value as AlatUkurSaveModel;
              });
            } else {
              Navigator.pop(context);
            }
          });
        }
      },
      child: BlocConsumer<AlatUkurSaveBloc, AlatUkurSaveState>(
        listener: (context, state) {
          debugPrint(state.toString());
          if (state is AlatUkurSaveFailedState) {}
          if (state is AlatUkurSaveSuccessState) {
            logger.i("pangil event");
            listAlatUkur = state.alatUkurResponseModel;
            BlocProvider.of<GetAlatUkurBloc>(context)
                .add(GetAlatUkurIbuHamil());
          }
        },
        builder: (context, stateListAlatUkur) {
          if (stateListAlatUkur is AlatUkurSaveProccessState) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: SpinKitThreeBounce(
                  color: bluePrimaryMain,
                  size: 50.0,
                ),
              ),
            );
          }
          if (stateListAlatUkur is AlatUkurSaveSuccessState) {
            return Scaffold(
              backgroundColor: backgroundWhite10,
              appBar: PrimaryAppBar(
                title: "Tambah Ibu Hamil",
                actions: [
                  __buildChangeMeasuringToolsButton(context, saveAlatUkurBloc)
                ],
                onBackPressed: () => Navigator.pop(context),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
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
                            duration: const Duration(
                                milliseconds: 300), // Durasi animasi
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
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  BlocListener<SearchIbuHamilCubit,
                                      SearchIbuHamilState>(
                                    listener: (context, state) {
                                      if (state is SearchIbuHamilSelected) {
                                        ibuId = state.ibuId;
                                        _nameController.text = state.namaIbu;
                                        _ageController.text = state.usia;
                                        _nikController.text = state.nik;
                                        _namaSuamiController.text =
                                            state.namaSuami;
                                      }
                                    },
                                    child: TextFormFieldSearch(
                                      controller: _nameController,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16)),
                                  Text(
                                    'Usia Ibu Hamil',
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(fontSize: 12),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  TextFieldWidget(
                                    controller: _ageController,
                                    hintText: "Usia Ibu Hamil",
                                    isPasswordField: false,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                    validators: [
                                      (value) => Validator.required(value),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16)),
                                  Text(
                                    'NIK',
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(fontSize: 12),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  TextFieldWidget(
                                    controller: _nikController,
                                    hintText: "NIK",
                                    validators: [
                                      (value) => Validator.required(value),
                                    ],
                                    isPasswordField: false,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16)),
                                  Text(
                                    'Nama Suami',
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(fontSize: 12),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  TextFieldWidget(
                                    controller: _namaSuamiController,
                                    hintText: "Nama Suami",
                                    isPasswordField: false,
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    validators: [
                                      (value) => Validator.required(value),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16)),
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
                                              : FluentIcons
                                                  .chevron_down_20_filled,
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
                                        (value) => Validator.required(value),
                                      ],
                                      tool: alatUkurIbuHamil.alatUkurTinggi
                                          ?.alatPengukuranAdmin.jenisAlat,
                                      controller: _heightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Tinggi Fundus Uteri',
                                      hintText: 'contoh: 10.3 cm',
                                      unit: 'cm',
                                      // validator: [
                                      //   (value) => Validator.required(value,
                                      //       'Tinggi Fundus Uteri Wajib diisi'),
                                      // ],
                                      tool: alatUkurIbuHamil
                                          .alatUkurTinggiFundus
                                          ?.alatPengukuranAdmin
                                          .jenisAlat,
                                      controller:
                                          _uterineFundusHeightController,
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
                                      hintText: 'contoh: 50.5',
                                      unit: 'kg',
                                      validator: [
                                        (value) => Validator.required(
                                              value,
                                            ),
                                      ],
                                      tool: alatUkurIbuHamil.alatUkurBerat
                                          ?.alatPengukuranAdmin.jenisAlat,
                                      controller: _weightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Lengan Atas',
                                      hintText: 'contoh: 15.1',
                                      validator: [
                                        (value) => Validator.required(
                                              value,
                                            ),
                                      ],
                                      unit: 'cm',
                                      tool: alatUkurIbuHamil
                                          .alatUkurLingkarLengan
                                          ?.alatPengukuranAdmin
                                          .jenisAlat,
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
                                  // validators: [
                                  //   (value) => Validator.required(
                                  //       value, 'Hemogoblin Wajib diisi'),
                                  // ],
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
                          const Text(
                            'Jarak Posyandu (Meter)',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          TextFieldWidget(
                            controller: _jarakPosyanduController,
                            hintText: 'Jarak Posyandu',
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            isPasswordField: false,
                            validators: [],
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
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(8)),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              value,
                                            ),
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
                                  color: selectedMemilikiBPJS == null
                                      ? buttonThird
                                      : selectedMemilikiBPJS == "Iya"
                                          ? buttonThird
                                          : stroke10,
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
                                  color: selectedMemilikiBPJS == null
                                      ? redPrimaryMain
                                      : selectedMemilikiBPJS == "Tidak"
                                          ? redPrimaryMain
                                          : stroke10,
                                  mainButtonMessage: 'Tidak',
                                  mainButton: () {
                                    setState(() {
                                      selectedMemilikiBPJS = "Tidak";
                                      boolNamaBPJS = false;

                                      selectedRadioBPJS = null;
                                      selectedNamaBPJS = null;
                                      _namaBPJSController =
                                          TextEditingController();
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
                                      validators: selectedRadioBPJS == 2
                                          ? [
                                              (value) => Validator.required(
                                                    value,
                                                  ),
                                            ]
                                          : null,
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
                                              selectedNamaBPJS =
                                                  'BPJS PBI (bantuan)';
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
                                          width: SizeConfig.calHeightMultiplier(
                                              10),
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
                                    TopSnackbarWidget().success(
                                        'Berhasil Menambah Data Ibu Hamil'));
                                Navigator.pop(context, 1);
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
                                    TopSnackbarWidget()
                                        .error(state.error.message));
                              }
                            },
                            child: ButtonPrimary(
                              color: bluePrimaryMain,
                              mainButtonMessage: 'Simpan',
                              mainButton: () {
                                if (_formKey.currentState!.validate() &&
                                    selectedMemilikiBPJS != null) {
                                  PostIbuHamilModel postData = PostIbuHamilModel(
                                      jarak: double.tryParse(_jarakPosyanduController.text) ??
                                          0,
                                      alatBeratBadanId:
                                          alatUkurIbuHamil.alatUkurBerat!.id,
                                      alatLingkarLenganId: alatUkurIbuHamil
                                          .alatUkurLingkarLengan!.id,
                                      alatTinggiBadanId:
                                          alatUkurIbuHamil.alatUkurTinggi!.id,
                                      alatTinggiFundusId: alatUkurIbuHamil
                                          .alatUkurTinggiFundus!.id,
                                      beratBadan:
                                          _parseDouble(_weightController.text),
                                      catatan: _catatanController.text,
                                      hemoglobin: _hemogoblinController.text == ""
                                          ? null
                                          : _parseDouble(
                                              _hemogoblinController.text),
                                      ibuId: ibuId,
                                      jumlahTabletFe:
                                          _parseInt(_tabletFeController.text),
                                      lingkarLenganAtas: _parseDouble(
                                          _armCircumferenceController.text),
                                      terpaparAsapRokok: exposedCigaretteSmoke == 1 ? "Iya" : "Tidak",
                                      tinggiBadan: _parseDouble(_heightController.text),
                                      tinggiFundusUteri: _uterineFundusHeightController.text == "" ? null : _parseDouble(_uterineFundusHeightController.text),
                                      tanggalPertamaHaid: _formatDate(_firstDateHaidController.text),
                                      tanggalTerakhirHaid: _formatDate(_lastDateHaidController.text),
                                      memilkiBPJS: selectedMemilikiBPJS!,
                                      namaBPJS: selectedRadioBPJS == 2 ? _namaBPJSController.text : selectedNamaBPJS,
                                      tanggalPengukuran: DateFormat("y-MM-dd", "ID_id").format(DateTime.now()));
                                  context
                                      .read<CreateRegisterIbuHamilBloc>()
                                      .add(PostCreateIbuHamil(postData));
                                } else {
                                  showTopSnackBar(
                                      Overlay.of(context),
                                      animationDuration:
                                          const Duration(milliseconds: 600),
                                      displayDuration:
                                          const Duration(milliseconds: 2200),
                                      reverseAnimationDuration:
                                          const Duration(milliseconds: 300),
                                      TopSnackbarWidget()
                                          .warning("Form Tidak Boleh Kosong"));
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
            );
          }
          return const ErrorServerScreen();
        },
      ),
    );
  }

  Widget __buildChangeMeasuringToolsButton(
      context, SaveAlatUkurBloc saveAlatUkurBloc) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertChooseMeasuringToolsIbuHamil(
            title: 'Pilih Alat Ukur',
            mainButton: () {
              Navigator.pop(context);
            },
            mainButtonMessage: 'Simpan',
            colorMainButton: bluePrimaryMain,
            listAlatUkur: listAlatUkur!,
            saveAlatUkurBloc: saveAlatUkurBloc,
            alatUkurIbuHamilSave: alatUkurIbuHamil,
          ),
        ).then((value) {
          if (value != null) {
            setState(() {
              alatUkurIbuHamil = value as AlatUkurSaveModel;
            });
          }
        });
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
            const Icon(
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
