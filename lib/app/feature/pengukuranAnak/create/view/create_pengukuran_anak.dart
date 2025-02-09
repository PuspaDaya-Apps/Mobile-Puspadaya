import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/alatUkur/bloc/alat_ukur_anak_bloc.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/create/Bloc/searchAnakCubit/search_anak_cubit.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/create/model/pengukuran_anak_model.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/create/view/search_anak.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/create/view/widget/alert_dialog_result.dart';
import 'package:puspadaya/app/view/widget/alert_choose_measuring_tools_widget.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_save_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../model/paketToScreen/paket_to_create_pengukuran_anak_model.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../Bloc/createPengukuranAnak/create_pengukuran_anak_bloc.dart';

class CreatePengukuranAnak extends StatelessWidget {
  const CreatePengukuranAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchAnakCubit(),
        ),
        BlocProvider(
          create: (context) => CreatePengukuranAnakBloc(),
        ),
        BlocProvider(
          create: (context) => AlatUkurAnakBloc(),
        ),
      ],
      child: const CreatePengukuranAnakView(),
    );
  }
}

class CreatePengukuranAnakView extends StatefulWidget {
  const CreatePengukuranAnakView({super.key});

  @override
  State<CreatePengukuranAnakView> createState() =>
      _CreatePengukuranAnakViewState();
}

class _CreatePengukuranAnakViewState extends State<CreatePengukuranAnakView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController upperArmCircumferenceController =
      TextEditingController();
  TextEditingController headCircumferenceController = TextEditingController();
  TextEditingController catatanController = TextEditingController();
  TextEditingController keluhanController = TextEditingController();

  bool _isExpanded = false;

  final _formKey = GlobalKey<FormState>();
  String selectedPosyandu = 'Posyandu';
  String selectedPosition = 'Terlentang';

  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';

  final List<String> selectPosyandu = ['Posyandu', 'Rumah'];

  final List<String> selectPosition = [
    'Terlentang',
    'Berdiri',
  ];

  late PaketToCreatePengukuranAnakModel paket;

  int? asiEksklusifValue = 0;
  int? mpasiValue = 0;

  late String alatUkur;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlatUkurAnakBloc>(context).add(GetAlatUkur());
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9;

    final createPengukuranAnakBloc =
        BlocProvider.of<CreatePengukuranAnakBloc>(context);

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
          title: "Pengukuran Anak",
          // actions: [__buildChangeMeasuringToolsButton(context)],
          onBackPressed: () => Navigator.pop(context),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
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
                            BlocListener<SearchAnakCubit, SearchAnakState>(
                              listener: (context, state) {
                                if (state is SearchAnakSelected) {
                                  nameController.text = state.name;
                                  nikController.text = state.nik;
                                }
                              },
                              //! textFormField
                              child: TextFormField(
                                readOnly: true,
                                validator: null,
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SearchAnak(),
                                    ),
                                  ).then((paketValue) {
                                    logger.d(paketValue);
                                    setState(() {
                                      if (paketValue != null) {
                                        paket = paketValue;
                                        nameController = TextEditingController(
                                            text: paket.namaAnak);
                                        nikController = TextEditingController(
                                            text: paket.nik);
                                        ageController = TextEditingController(
                                            text: paket.usia);
                                      }
                                    });
                                  });
                                },
                                controller: nameController,
                                style: Theme.of(context).textTheme.bodySmall,
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    FluentIcons.search_24_regular,
                                  ),
                                  hintText: 'Pilih Anak',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.grey),
                                  filled: true,
                                  fillColor: backgroundWhite10,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 1, color: bluePrimaryMain),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                  ),
                                ),
                              ),
                              // child: TextFormFieldSearch(
                              //   controller: nameController,
                              // ),
                            ),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(16)),
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
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  TextFieldWidget(
                                    controller: nikController,
                                    hintText: "NIK",
                                    isPasswordField: false,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16)),
                                  const Text(
                                    'Usia',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  TextFieldWidget(
                                    controller: ageController,
                                    hintText: "Usia",
                                    isPasswordField: false,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                  ),
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16)),
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
                                      hintText: 'contoh: 13.5',
                                      unit: 'cm',
                                      // tool: 'Microtoise',
                                      controller: heightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Lengan Atas',
                                      hintText: 'contoh: 3.5',
                                      unit: 'cm',
                                      // tool: 'Pita Lila',
                                      controller:
                                          upperArmCircumferenceController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
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
                                      controller: weightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Kepala',
                                      hintText: 'contoh: 6.5',
                                      unit: 'cm',
                                      // tool: 'Alat Ukur Lingkar Kepala',
                                      controller: headCircumferenceController,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          width: SizeConfig.calHeightMultiplier(
                                              16),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                        SizedBox(
                                          width: SizeConfig.calHeightMultiplier(
                                              16),
                                        ),
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
                            controller: catatanController,
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
                            controller: keluhanController,
                            hintText: 'Masukan Keluhan',
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          BlocListener<CreatePengukuranAnakBloc,
                              CreatePengukuranAnakState>(
                            listener: (context, state) {
                              debugPrint(state.toString());
                              if (state is CreatePengukuranAnakSuccesState) {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialogResult(
                                      nik: state.pengukuranAnakResponseModel
                                          .data!.anak.nik,
                                      name: state.pengukuranAnakResponseModel
                                          .data!.anak.nama,
                                      statusStunting: state
                                          .pengukuranAnakResponseModel
                                          .data!
                                          .statusStunting,
                                      statusGizi: state.statusGizi,
                                      mainButton: () {
                                        Navigator.pop(context);
                                        Navigator.popAndPushNamed(
                                            context, CREATE_PENGUKURAN_ANAK);
                                      },
                                      mainButtonMessage: 'Tambah Pengukuran',
                                      cancelButton: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context,
                                            1); // Tutup dialog AlertDialogResult
                                      },
                                      cancelButtonMessage: 'Selesai',
                                      colorMainButton: bluePrimaryMain,
                                    );
                                  },
                                );
                              }
                              if (state is CreatePengukuranAnakFailedState) {
                                debugPrint(state.error);
                                showTopSnackBar(
                                    Overlay.of(context),
                                    animationDuration:
                                        const Duration(milliseconds: 600),
                                    displayDuration:
                                        const Duration(milliseconds: 2200),
                                    reverseAnimationDuration:
                                        const Duration(milliseconds: 300),
                                    TopSnackbarWidget().error(state.error));
                              }
                              if (state is CreatePengukuranAnakNullErrorState) {
                                showTopSnackBar(
                                    Overlay.of(context),
                                    animationDuration:
                                        const Duration(milliseconds: 600),
                                    displayDuration:
                                        const Duration(milliseconds: 2200),
                                    reverseAnimationDuration:
                                        const Duration(milliseconds: 300),
                                    TopSnackbarWidget().warning(state.error));
                              }
                            },
                            child: ButtonPrimary(
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
                                        createPengukuranAnakBloc.add(
                                            SendPengukuranAnakEvent(PengukuranAnakModel(
                                                tempatPengukuran:
                                                    selectedPosyandu,
                                                tanggalPengukuran:
                                                    DateTime.now(),
                                                posisiBadan: selectedPosition,
                                                beratBadan: double.parse(
                                                    weightController.text),
                                                alatBeratBadanId: alatUkur,
                                                tinggiBadan: double.parse(
                                                    heightController.text),
                                                alatTinggiBadanId: alatUkur,
                                                lingkarLenganAtas: double.parse(
                                                    upperArmCircumferenceController
                                                        .text),
                                                alatLingkarLenganId: alatUkur,
                                                lingkarKepala: double.parse(
                                                    headCircumferenceController
                                                        .text),
                                                alatLingkarKepalaId: alatUkur,
                                                asiEksklusif:
                                                    asiEksklusifValue == 1
                                                        ? "Iya"
                                                        : "Tidak",
                                                mpasi: mpasiValue == 1
                                                    ? "Iya"
                                                    : "Tidak",
                                                keluhan: keluhanController.text,
                                                catatan: catatanController.text,
                                                anakId: paket.id)));
                                      },
                                      cancelButtonMessage: 'Tidak',
                                      mainButtonMessage: 'Iya Simpan Data',
                                      colorMainButton: bluePrimaryMain,
                                      heighValue: heightController.text,
                                      weightValue: weightController.text,
                                      upperArmCircumference:
                                          upperArmCircumferenceController.text,
                                      uterineFundalHeightValue:
                                          headCircumferenceController.text,
                                    );
                                  },
                                );
                              },
                            ),
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
      ),
    );
  }

  Widget __buildChangeMeasuringToolsButton(context) {
    return GestureDetector(
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
