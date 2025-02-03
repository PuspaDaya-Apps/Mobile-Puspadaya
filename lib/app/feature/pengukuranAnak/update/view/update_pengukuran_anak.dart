import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import '../../../../model/paketToScreen/paket_to_update_pengukuran_anak_model.dart';
import '../../alatUkur/bloc/alat_ukur_anak_bloc.dart';
import '../../create/model/pengukuran_anak_model.dart';
import '../bloc/update_pengukuran_anak_bloc.dart';

class UpdatePengukuranAnak extends StatelessWidget {
  const UpdatePengukuranAnak({super.key, required this.paket});
  final PaketToUpdatePengukuranAnakModel paket;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdatePengukuranAnakBloc(),
        ),
        BlocProvider(
          create: (context) => AlatUkurAnakBloc(),
        ),
      ],
      child: UpdatePengukuranAnakView(
        paket: paket,
      ),
    );
  }
}

class UpdatePengukuranAnakView extends StatefulWidget {
  const UpdatePengukuranAnakView({super.key, required this.paket});
  final PaketToUpdatePengukuranAnakModel paket;

  @override
  State<UpdatePengukuranAnakView> createState() =>
      _UpdatePengukuranAnakViewState();
}

class _UpdatePengukuranAnakViewState extends State<UpdatePengukuranAnakView> {
  final _formKey = GlobalKey<FormState>();

  late String selectedPosyandu;
  late String selectedPosition;

  late String idAlatUkur;

  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';

  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController upperArmCircumferenceController;
  late TextEditingController headCircumferenceController;
  late TextEditingController catatanController;
  late TextEditingController keluhanController;

  final List<String> selectPosyandu = [
    'Posyandu',
    'Rumah',
  ];

  final List<String> selectPosition = [
    'Terlentang',
    'Berdiri',
  ];
  late int asiEksklusifValue;
  late int mpasiValue;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlatUkurAnakBloc>(context).add(GetAlatUkur());

    heightController =
        TextEditingController(text: widget.paket.data.data!.tinggiBadan);
    weightController =
        TextEditingController(text: widget.paket.data.data!.beratBadan);
    upperArmCircumferenceController =
        TextEditingController(text: widget.paket.data.data!.lingkarLenganAtas);
    headCircumferenceController =
        TextEditingController(text: widget.paket.data.data!.lingkarKepala);
    catatanController =
        TextEditingController(text: widget.paket.data.data!.catatan);
    keluhanController =
        TextEditingController(text: widget.paket.data.data!.keluhan);

    if (widget.paket.data.data!.tempatPengukuran == "Posyandu") {
      selectedPosyandu = "Posyandu";
    } else {
      selectedPosyandu = "Rumah";
    }

    if (widget.paket.data.data!.posisiBadan == "Terlentang") {
      selectedPosition = "Terlentang";
    } else {
      selectedPosition = "Berdiri";
    }

    if (widget.paket.data.data!.mpasi == "Iya") {
      mpasiValue = 1;
    } else {
      mpasiValue = 0;
    }

    if (widget.paket.data.data!.asiEksklusif == "Iya") {
      asiEksklusifValue = 1;
    } else {
      asiEksklusifValue = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final updatePengukuranAnakBloc = BlocProvider.of<UpdatePengukuranAnakBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Perbarui Pengukuran",
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       showDialog(
        //         context: context,
        //         builder: (context) => AlertChooseMeasuringTools(
        //           title: 'Pilih Alat Ukur',
        //           mainButton: () {
        //             Navigator.pop(context);
        //           },
        //           mainButtonMessage: 'Simpan',
        //           colorMainButton: bluePrimaryMain,
        //           selectedHeight: selectedHeight,
        //           selectedWeight: selectedWeight,
        //           selectedUpperArmCircumference: selectedUpperArmCircumference,
        //           selectedUterineFundalHeight: selectedUterineFundalHeight,
        //           onHeightChanged: (value) {
        //             setState(() {
        //               selectedHeight = value;
        //             });
        //           },
        //           onWeightChanged: (value) {
        //             setState(() {
        //               selectedWeight = value;
        //             });
        //           },
        //           onUpperArmCircumferenceChanged: (value) {
        //             setState(() {
        //               selectedUpperArmCircumference = value;
        //             });
        //           },
        //           onUterineFundalHeightChanged: (value) {
        //             setState(() {
        //               selectedUterineFundalHeight = value;
        //             });
        //           },
        //         ),
        //       );
        //     },
        //     child: Container(
        //       margin: const EdgeInsets.only(right: 24),
        //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //       decoration: BoxDecoration(
        //         color: bluePrimary30,
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: Row(
        //         spacing: 2,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           const Icon(
        //             FontAwesomeIcons.penToSquare,
        //             color: Colors.white,
        //             size: 14,
        //           ),
        //           Text(
        //             'Ubah Alat',
        //             style: AppTextStyles.primaryTextMedium.copyWith(
        //               fontSize: 12,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
          // ),
        // ],
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
                  InfoFieldWidget(text: widget.paket.data.data!.anak.namaAnak),
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
                  InfoFieldWidget(text: widget.paket.data.data!.anak.nik),
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
                              // tool: 'Microtoise',
                              controller: heightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Lengan Atas',
                              hintText: 'contoh: 3,5',
                              unit: 'cm',
                              // tool: 'Pita Lila',
                              controller: upperArmCircumferenceController,
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
                              // tool: 'Timbangan Digital',
                              controller: weightController,
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Kepala',
                              hintText: 'contoh: 6,5',
                              unit: 'cm',
                              // tool: 'Alat Ukur Lingkar Kepala',
                              controller: headCircumferenceController,
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
                                const SizedBox(width: 16),
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
                  BlocListener<AlatUkurAnakBloc, AlatUkurAnakState>(
                    listener: (context, state) {
                      debugPrint(state.toString());
                      if (state is AlatUkurAnakSuccessState) {
                        idAlatUkur = state.alatUkurResponseModel.data![0].id;
                      }
                    },
                    child: BlocConsumer<UpdatePengukuranAnakBloc, UpdatePengukuranAnakState>(
                      listener: (context, state) {
                        if(state is UpdatePengukuranAnakSuccesState) {
                          Navigator.pop(context,1);
                        }
                        if(state is UpdatePengukuranAnakFailedState) {
                          debugPrint(state.error); 
                        }
                      },
                      builder: (context, state) {
                        return ButtonPrimary(
                          color: bluePrimaryMain,
                          mainButtonMessage: 'Simpan',
                          mainButton: () {
                            updatePengukuranAnakBloc.add(SendUpdatePengukuranAnakEvent(
                              pengukuranId: widget.paket.pengukuranId,
                              pengukuranAnakModel: PengukuranAnakModel(
                                tempatPengukuran: selectedPosyandu,
                                posisiBadan: selectedPosition,
                                alatBeratBadanId: idAlatUkur,
                                alatLingkarKepalaId: idAlatUkur,
                                alatLingkarLenganId: idAlatUkur,
                                alatTinggiBadanId: idAlatUkur,
                                beratBadan: double.parse(weightController.text),
                                tinggiBadan: double.parse(heightController.text),
                                lingkarKepala: double.parse(headCircumferenceController.text),
                                lingkarLenganAtas: double.parse(upperArmCircumferenceController.text),
                                asiEksklusif: asiEksklusifValue == 1 ? 'Iya' : 'Tidak',
                                mpasi: mpasiValue == 1 ? 'Iya' : 'Tidak',
                                tanggalPengukuran: widget.paket.data.data!.tanggalPengukuran,
                                catatan: catatanController.text,
                                keluhan: keluhanController.text,
                                anakId: widget.paket.data.data!.anak.id
                              ),
                              )
                            );
                          },
                        );
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
}
