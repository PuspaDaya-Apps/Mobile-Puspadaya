import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/validator/validator.dart';
import '../../../../../utils/constant/constanst.dart';
import '../../../../model/alat_ukur_response_model.dart';
import '../../../../model/alat_ukur_save_model.dart';
import '../../../../model/paketToScreen/paket_to_create_pengukuran_tamu_model.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/alert_choose_measuring_tools_anak_widget copy.dart';
import '../../../../view/widget/alert_dialog_anak_save_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../../alatUkurSave/bloc/alatUkurSaveBloc/alat_ukur_save_bloc.dart';
import '../../../alatUkurSave/bloc/getAlatUkurBloc/get_alat_ukur_bloc.dart';
import '../../../alatUkurSave/bloc/saveAlatUkurBloc/save_alat_ukur_bloc.dart';
import '../bloc/createPengukuranTamuBloc/create_pengukuran_tamu_bloc.dart';
import '../model/pengukuran_tamu_model.dart';
import 'widget/alert_dialog_result.dart';

class CreatePengukuranTamu extends StatelessWidget {
  const CreatePengukuranTamu({super.key, required this.dataAnak});
  final PaketToCreatePengukuranTamuModel dataAnak;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreatePengukuranTamuBloc(),
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
      child: CreatePengukuranTamuView(dataAnak: dataAnak,),
    );
  }
}

class CreatePengukuranTamuView extends StatefulWidget {
  const CreatePengukuranTamuView({super.key, required this.dataAnak});
  final PaketToCreatePengukuranTamuModel dataAnak;

  @override
  State<CreatePengukuranTamuView> createState() => _CreatePengukuranTamuViewState();
}

class _CreatePengukuranTamuViewState extends State<CreatePengukuranTamuView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController upperArmCircumferenceController = TextEditingController();
  TextEditingController headCircumferenceController = TextEditingController();
  TextEditingController catatanController = TextEditingController();
  TextEditingController keluhanController = TextEditingController();

  bool _isExpanded = false;

  final _formKey = GlobalKey<FormState>();
  String selectedPosition = 'Terlentang';

  String? asiEksklusifValue = '0';
  String? mpasiValue = '0';

  AlatUkurSaveModel alatUkurTamu = AlatUkurSaveModel();
  AlatUkurResponseModel? listAlatUkur;

  bool? isAgeLessThanSixMonths;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlatUkurSaveBloc>(context).add(GetAlatUkur());
    isAgeLessThanSixMonths = isLessThanSixMonths(widget.dataAnak.dataTamu.usia);
  }

  bool isLessThanSixMonths(String age) {
    final regex = RegExp(r'(\d+)\s*tahun\s*(\d+)?\s*bulan');

    final match = regex.firstMatch(age);
    if (match == null) return false; // Format tidak valid, default false

    int years = int.parse(match.group(1) ?? '0');
    int months = int.parse(match.group(2) ?? '0');

    int totalMonths = (years * 12) + months;

    return totalMonths < 6;
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 5;

    final createPengukuranTamuBloc = BlocProvider.of<CreatePengukuranTamuBloc>(context);
    final saveAlatUkurBloc = BlocProvider.of<SaveAlatUkurBloc>(context);

    return BlocListener<GetAlatUkurBloc, GetAlatUkurState>(
      listener: (context, state) {
        if (state is GetAlatUkurAnakSuccessState) {
          logger.i("Berhasil");
          setState(() {
            alatUkurTamu = state.alatUkurAnak;
          });
        }
        if (state is GetAlatUkurAnakFailedState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertChooseMeasuringToolsAnak(
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
                alatUkurTamu = value as AlatUkurSaveModel;
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
            BlocProvider.of<GetAlatUkurBloc>(context).add(GetAlatUkurAnak());
          }
        },
        builder: (context, stateListAlatUkur) {
          if (stateListAlatUkur is AlatUkurSaveProccessState) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              color: Colors.white,
              child: CircularProgressIndicator(
                color: bluePrimaryMain,
              ),
            );
          }
          if (stateListAlatUkur is AlatUkurSaveSuccessState) {
            return Scaffold(
              backgroundColor: backgroundWhite10,
              appBar: PrimaryAppBar(
                title: "Pengukuran Tamu",
                actions: [
                  __buildChangeMeasuringToolsButton(context, saveAlatUkurBloc)
                ],
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
                            duration: const Duration(milliseconds: 300), // Durasi animasi
                            curve: Curves.easeInOut, // Kurva animasi
                            height: _isExpanded
                                ? sizeHeighofSingleForm * 2
                                : sizeHeighofSingleForm, // Tinggi menu saat diperluas/dikecilkan
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Asal Posyandu',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                                  InfoFieldWidget(
                                    text: widget.dataAnak.dataPosyandu.namaPosyandu
                                  ),
                                  SizedBox(height:SizeConfig.calHeightMultiplier(16)),
                                  const Text(
                                    'Nama',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                                  InfoFieldWidget(
                                    text: widget.dataAnak.dataTamu.namaAnak
                                  ),
                                  SizedBox(height:SizeConfig.calHeightMultiplier(16)),
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
                                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                                        InfoFieldWidget(
                                          text: widget.dataAnak.dataTamu.nik
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Usia',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        InfoFieldWidget(
                                          text: widget.dataAnak.dataTamu.usia
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
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
                                              : FluentIcons
                                                  .chevron_down_20_filled,
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
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
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
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                                Row(
                                  spacing: 8,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: MeasurementWidget(
                                        title: 'Tinggi Badan',
                                        hintText: 'contoh: 50',
                                        unit: 'cm',
                                        tool: alatUkurTamu.alatUkurTinggi
                                            ?.alatPengukuranAdmin.jenisAlat,
                                        validator: [
                                          (value) => Validator.required(value,
                                              'Harap Masukan Tinggi Badan'),
                                          (value) => Validator.minNumber(
                                              value, 45, "min 45 max 110"),
                                          (value) => Validator.maxNumber(
                                              value, 110, "min 45 max 110"),
                                        ],
                                        // tool: 'Microtoise',
                                        controller: heightController,
                                      ),
                                    ),
                                    Expanded(
                                      child: MeasurementWidget(
                                        validator: [
                                          (value) => Validator.required(value,
                                              'Harap Masukan Berat Badan'),
                                        ],
                                        title: 'Berat Badan',
                                        hintText: 'contoh: 6.5',
                                        unit: 'kg',
                                        tool: alatUkurTamu.alatUkurBerat
                                            ?.alatPengukuranAdmin.jenisAlat,
                                        controller: weightController,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                                isAgeLessThanSixMonths == false ||
                                        isAgeLessThanSixMonths == null
                                    ? Row(
                                        spacing: 8,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: MeasurementWidget(
                                              title: 'Lingkar Kepala',
                                              hintText: 'contoh: 13.5',
                                              unit: 'cm',
                                              validator: [
                                                (value) => Validator.required(
                                                    value,
                                                    'Harap Masukan Lingkar Kepala'),
                                              ],
                                              tool: alatUkurTamu
                                                  .alatUkurLingkarKepala
                                                  ?.alatPengukuranAdmin
                                                  .jenisAlat,
                                              controller:
                                                  headCircumferenceController,
                                            ),
                                          ),
                                          Expanded(
                                            child: MeasurementWidget(
                                              title: 'Lingkar Lengan Atas',
                                              hintText: 'contoh: 35',
                                              validator: [
                                                (value) => Validator.required(
                                                    value,
                                                    'Harap Masukan Lingkar Lengan Atas'),
                                              ],
                                              unit: 'cm',
                                              tool: alatUkurTamu
                                                  .alatUkurLingkarLengan
                                                  ?.alatPengukuranAdmin
                                                  .jenisAlat,
                                              controller:
                                                  upperArmCircumferenceController,
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                isAgeLessThanSixMonths == false ||
                                        isAgeLessThanSixMonths == null
                                    ? SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(16))
                                    : SizedBox.shrink(),
                                Row(
                                  children: [
                                    isAgeLessThanSixMonths == true ||
                                            isAgeLessThanSixMonths == null
                                        ? Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Asi Ekskusif',
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeConfig
                                                      .calHeightMultiplier(8),
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
                                                      groupValue: int.parse(
                                                          asiEksklusifValue!),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          asiEksklusifValue =
                                                              value.toString();
                                                        });
                                                      },
                                                      label: 'Ya',
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                          .calHeightMultiplier(
                                                              16),
                                                    ),
                                                    CustomRadioButton(
                                                      value: 0,
                                                      groupValue: int.parse(
                                                          asiEksklusifValue!),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          asiEksklusifValue =
                                                              value.toString();
                                                        });
                                                      },
                                                      label: 'Tidak',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    isAgeLessThanSixMonths == false ||
                                            isAgeLessThanSixMonths == null
                                        ? Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'MPASI',
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeConfig
                                                      .calHeightMultiplier(8),
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
                                                      groupValue: int.parse(
                                                          mpasiValue!),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          mpasiValue =
                                                              value.toString();
                                                        });
                                                      },
                                                      label: 'Ya',
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                          .calHeightMultiplier(
                                                              16),
                                                    ),
                                                    CustomRadioButton(
                                                      value: 0,
                                                      groupValue: int.parse(
                                                          mpasiValue!),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          mpasiValue =
                                                              value.toString();
                                                        });
                                                      },
                                                      label: 'Tidak',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
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
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
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
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                                BlocListener<CreatePengukuranTamuBloc,
                                    CreatePengukuranTamuState>(
                                  listener: (context, state) {
                                    debugPrint(state.toString());
                                    if (state
                                        is CreatePengukuranTamuSuccesState) {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialogResult(
                                            nik: state
                                                .pengukuranTamuResponseModel
                                                .data!
                                                .anak
                                                .nik,
                                            name: state
                                                .pengukuranTamuResponseModel
                                                .data!
                                                .anak
                                                .nama,
                                            statusStunting: state
                                                .pengukuranTamuResponseModel
                                                .data!
                                                .statusStunting,
                                            statusGizi: state
                                                .pengukuranTamuResponseModel
                                                .data!
                                                .statusGizi
                                                .statusWasting,
                                            statusWasting: state
                                                .pengukuranTamuResponseModel
                                                .data!
                                                .statusGizi
                                                .statusWasting,
                                            mainButton: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.pushNamed(context, CREATE_PENGUKURAN_TAMU);
                                            },
                                            mainButtonMessage:
                                                'Tambah Pengukuran',
                                            cancelButton: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              Navigator.pop(context, 1); // Tutup dialog AlertDialogResult
                                            },
                                            cancelButtonMessage: 'Selesai',
                                            colorMainButton: bluePrimaryMain,
                                          );
                                        },
                                      );
                                    }
                                    if (state is CreatePengukuranTamuFailedState) {
                                      debugPrint(state.error);
                                      showTopSnackBar(
                                          Overlay.of(context),
                                          animationDuration:
                                              const Duration(milliseconds: 600),
                                          displayDuration: const Duration(
                                              milliseconds: 2200),
                                          reverseAnimationDuration:
                                              const Duration(milliseconds: 300),
                                          TopSnackbarWidget()
                                              .error(state.error));
                                    }
                                    if (state is CreatePengukuranTamuNullErrorState) {
                                      showTopSnackBar(
                                          Overlay.of(context),
                                          animationDuration:
                                              const Duration(milliseconds: 600),
                                          displayDuration: const Duration(
                                              milliseconds: 2200),
                                          reverseAnimationDuration:
                                              const Duration(milliseconds: 300),
                                          TopSnackbarWidget()
                                              .warning(state.error));
                                    }
                                  },
                                  child: ButtonPrimary(
                                    color: bluePrimaryMain,
                                    mainButtonMessage: 'Simpan',
                                    mainButton: () {
                                      if (heightController.text.contains(',')) {
                                        showTopSnackBar(
                                          Overlay.of(context),
                                          animationDuration:
                                              const Duration(milliseconds: 600),
                                          displayDuration: const Duration(
                                              milliseconds: 2200),
                                          reverseAnimationDuration:
                                              const Duration(milliseconds: 300),
                                          TopSnackbarWidget().error(
                                              "Harap gunakan titik untuk memberikan nilai desimal"),
                                        );
                                      } else {
                                        if (_formKey.currentState!.validate()) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialogAnakSave(
                                                isAgeLessThanSixMonths: isAgeLessThanSixMonths!,
                                                cancelButton: () {
                                                  Navigator.pop(context);
                                                },
                                                mainButton: () {
                                                  if (isAgeLessThanSixMonths ==
                                                      true) {
                                                    headCircumferenceController
                                                        .text = '0';
                                                    upperArmCircumferenceController
                                                        .text = '0';
                                                    mpasiValue = '-';
                                                  } else {
                                                    asiEksklusifValue = '-';
                                                  }
                                                  logger.d(
                                                      'is age less than 6 bulan value ${isAgeLessThanSixMonths}');
                                                  logger.d(
                                                      'asi ekslusif value ${asiEksklusifValue}');
                                                  logger.d(
                                                      'mpasi value ${mpasiValue}');
                                                  logger.d(
                                                      'value lingkar kelapa ${headCircumferenceController.text}');
                                                  logger.d(
                                                      'value lingkar lengan atas ${upperArmCircumferenceController.text}');
                                                  //  headCircumferenceController.text = '';
                                                  //   upperArmCircumferenceController.text =
                                                  //       '';
                                                  // lingkar kepala, lingkar lengan atas, mpasi, tunjukan asi ekslusif
                                                  createPengukuranTamuBloc.add(SendPengukuranTamuEvent(
                                                    PengukuranTamuModel(
                                                      tanggalPengukuran: DateTime.now(),
                                                      posisiBadan: selectedPosition,
                                                      beratBadan: double.parse(
                                                        weightController.text
                                                      ),
                                                      alatBeratBadanId: alatUkurTamu.alatUkurBerat!.id,
                                                      tinggiBadan: double.parse(
                                                        heightController.text
                                                      ),
                                                      alatTinggiBadanId: alatUkurTamu.alatUkurTinggi!.id,
                                                      lingkarLenganAtas:double.parse(
                                                        upperArmCircumferenceController.text
                                                      ),
                                                      alatLingkarLenganId: alatUkurTamu.alatUkurLingkarLengan?.id,
                                                      lingkarKepala: double.parse(headCircumferenceController.text),
                                                      alatLingkarKepalaId: alatUkurTamu.alatUkurLingkarLengan?.id,
                                                      asiEksklusif: asiEksklusifValue == "1" ? "Iya" : (asiEksklusifValue == "0" ? "Tidak" : "-"),
                                                      mpasi: mpasiValue == "1" ? "Iya" : (mpasiValue == "0" ? "Tidak" : "-"),
                                                      keluhan: keluhanController.text,
                                                      catatan: catatanController.text,
                                                      anakId: widget.dataAnak.dataTamu.id)
                                                  
                                                    ));
                                                },
                                                cancelButtonMessage: 'Tidak',
                                                mainButtonMessage:
                                                    'Iya Simpan Data',
                                                colorMainButton:
                                                    bluePrimaryMain,
                                                heighValue:
                                                    heightController.text,
                                                weightValue:
                                                    weightController.text,
                                                upperArmCircumference:
                                                    upperArmCircumferenceController
                                                        .text,
                                                uterineFundalHeightValue:
                                                    headCircumferenceController
                                                        .text,
                                              );
                                            },
                                          );
                                        } else {
                                          logger.d("form tidak valid");
                                        }
                                      }
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
          builder: (context) => AlertChooseMeasuringToolsAnak(
            title: 'Pilih Alat Ukur',
            mainButton: () {
              Navigator.pop(context);
            },
            mainButtonMessage: 'Simpan',
            colorMainButton: bluePrimaryMain,
            listAlatUkur: listAlatUkur!,
            saveAlatUkurBloc: saveAlatUkurBloc,
            alatUkurAnakSave: alatUkurTamu,
          ),
        ).then((value) {
          if (value != null) {
            setState(() {
              alatUkurTamu = value as AlatUkurSaveModel;
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
