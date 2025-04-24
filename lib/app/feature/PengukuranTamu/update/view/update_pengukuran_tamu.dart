import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/validator/validator.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../model/alat_ukur_response_model.dart';
import '../../../../model/alat_ukur_save_model.dart';
import '../../../../model/paketToScreen/paket_to_update_pengukuran_tamu_model.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/alert_choose_measuring_tools_anak_widget copy.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
// import '../../alatUkur/bloc/alat_ukur_anak_bloc.dart';
import '../../../alatUkurSave/bloc/alatUkurSaveBloc/alat_ukur_save_bloc.dart';
import '../../../alatUkurSave/bloc/getAlatUkurBloc/get_alat_ukur_bloc.dart';
import '../../../alatUkurSave/bloc/saveAlatUkurBloc/save_alat_ukur_bloc.dart';
import '../bloc/update_pengukuran_tamu_bloc.dart';
import '../model/update_pengukuran_tamu_model.dart';

class UpdatePengukuranTamu extends StatelessWidget {
  const UpdatePengukuranTamu({super.key, required this.paket});
  final PaketToUpdatePengukuranTamuModel paket;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdatePengukuranTamuBloc(),
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
      child: UpdatePengukuranTamuView(
        paket: paket,
      ),
    );
  }
}

class UpdatePengukuranTamuView extends StatefulWidget {
  const UpdatePengukuranTamuView({super.key, required this.paket});
  final PaketToUpdatePengukuranTamuModel paket;

  @override
  State<UpdatePengukuranTamuView> createState() => _UpdatePengukuranTamuViewState();
}

class _UpdatePengukuranTamuViewState extends State<UpdatePengukuranTamuView> {
  final _formKey = GlobalKey<FormState>();

  late String selectedPosition;

  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController upperArmCircumferenceController;
  late TextEditingController headCircumferenceController;
  late TextEditingController catatanController;
  late TextEditingController keluhanController;

  final List<String> selectPosition = [
    'Terlentang',
    'Berdiri',
  ];
  
  late int asiEksklusifValue;
  late int mpasiValue;

  AlatUkurSaveModel alatUkurAnak = AlatUkurSaveModel();
  AlatUkurSaveModel? alatUkurAnakSend;
  AlatUkurResponseModel? listAlatUkur;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlatUkurSaveBloc>(context).add(GetAlatUkur());

    if(widget.paket.data.data!.tinggiBadan != "-") {
      heightController = TextEditingController(text: widget.paket.data.data!.tinggiBadan);
    }

    if(widget.paket.data.data!.beratBadan != "-") {
      weightController = TextEditingController(text: widget.paket.data.data!.beratBadan);
    }

    if(widget.paket.data.data!.lingkarLenganAtas != "-") {
      upperArmCircumferenceController = TextEditingController(text: widget.paket.data.data!.lingkarLenganAtas);
    }

    if(widget.paket.data.data!.lingkarKepala != "-") {
      headCircumferenceController = TextEditingController(text: widget.paket.data.data!.lingkarKepala);
    }

    catatanController = TextEditingController(text: widget.paket.data.data!.catatan);
    keluhanController = TextEditingController(text: widget.paket.data.data!.keluhan);

    if (widget.paket.data.data!.posisiBadan == "Terlentang") {
      selectedPosition = "Terlentang";
    } else {
      selectedPosition = "Berdiri";
    }

    if (widget.paket.data.data!.mpasi == "Iya") {
      mpasiValue = 1;
    } else if (widget.paket.data.data!.mpasi == "Tidak") {
      mpasiValue = 0;
    } else {
      mpasiValue = 3;
    }

    if (widget.paket.data.data!.asiEksklusif == "Iya") {
      asiEksklusifValue = 1;
    } else if (widget.paket.data.data!.asiEksklusif == "Tidak") {
      asiEksklusifValue = 0;
    } else {
      asiEksklusifValue = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final updatePengukuranTamuBloc = BlocProvider.of<UpdatePengukuranTamuBloc>(context);
    final saveAlatUkurBloc = BlocProvider.of<SaveAlatUkurBloc>(context);

    return BlocListener<GetAlatUkurBloc, GetAlatUkurState>(
      listener: (context, state) {
        if (state is GetAlatUkurAnakSuccessState) {
          logger.i("Berhasil");
          setState(() {
            alatUkurAnak = state.alatUkurAnak;
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
                alatUkurAnak = value as AlatUkurSaveModel;
                alatUkurAnakSend = value as AlatUkurSaveModel;
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
          if(stateListAlatUkur is AlatUkurSaveSuccessState) {
            return Scaffold(
              backgroundColor: backgroundWhite10,
              appBar: PrimaryAppBar(
                title: "Perbarui Pengukuran",
                actions: [
                  __buildChangeMeasuringToolsButton(
                    context,
                    saveAlatUkurBloc)
                ],
                onBackPressed: () => Navigator.pop(context),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding:
                        const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                          InfoFieldWidget(
                              text: widget.paket.data.data!.anak.namaAnak),
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
                          const Text(
                            'Posyandu Asal',
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
                                      validator: [
                                          // (value) => Validator.required(value,),
                                          (value) => Validator.minNumber(
                                              value, 45, "min 45 max 110"),
                                          (value) => Validator.maxNumber(
                                              value, 110, "min 45 max 110"),
                                        ],
                                      unit: 'cm',
                                      tool: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatTinggiBadan.jenisAlat 
                                      : alatUkurAnak.alatUkurTinggi!.alatPengukuranAdmin.merekAlat,
                                      controller: heightController,
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Lengan Atas',
                                      hintText: 'contoh: 3.5',
                                      unit: 'cm',
                                      tool: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatLingkarLengan.jenisAlat 
                                      : alatUkurAnak.alatUkurLingkarLengan!.alatPengukuranAdmin.merekAlat,
                                      controller: upperArmCircumferenceController,
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
                                          groupValue: asiEksklusifValue,
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
                                          groupValue: asiEksklusifValue,
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
                                      hintText: 'contoh: 6.5',
                                      unit: 'kg',
                                      tool: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatBeratBadan.jenisAlat 
                                      : alatUkurAnak.alatUkurBerat!.alatPengukuranAdmin.merekAlat,
                                      controller: weightController,
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Kepala',
                                      hintText: 'contoh: 6.5',
                                      unit: 'cm',
                                      tool: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatLingkarKepala.jenisAlat 
                                      : alatUkurAnak.alatUkurLingkarKepala!.alatPengukuranAdmin.merekAlat,
                                      controller: headCircumferenceController,
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
                                          groupValue: mpasiValue,
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
                                          groupValue: mpasiValue,
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
                          BlocConsumer<UpdatePengukuranTamuBloc,UpdatePengukuranTamuState>(
                            listener: (context, state) {
                              if (state is UpdatePengukuranTamuSuccesState) {
                                Navigator.pop(context, 1);
                              }
                              if (state is UpdatePengukuranTamuFailedState) {
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
                            },
                            builder: (context, state) {
                              return ButtonPrimary(
                                color: bluePrimaryMain,
                                mainButtonMessage: 'Simpan',
                                mainButton: () {
                                  updatePengukuranTamuBloc
                                      .add(SendUpdatePengukuranTamuEvent(
                                    pengukuranId: widget.paket.pengukuranId,
                                    pengukuranTamuModel: UpdatePengukuranTamuModel(
                                        posisiBadan: selectedPosition,
                                        alatBeratBadanId: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatBeratBadan.id 
                                      : alatUkurAnak.alatUkurBerat!.id,
                                        alatLingkarKepalaId: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatLingkarKepala.id 
                                      : alatUkurAnak.alatUkurLingkarKepala!.id,
                                        alatLingkarLenganId: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatLingkarLengan.id 
                                      : alatUkurAnak.alatUkurLingkarLengan!.id,
                                        alatTinggiBadanId: alatUkurAnakSend == null 
                                      ? widget.paket.data.data!.alatTinggiBadan.id 
                                      : alatUkurAnak.alatUkurTinggi!.id,
                                        
                                        beratBadan: weightController.text.isNotEmpty
                                        ? double.parse(weightController.text)
                                        : null,
                                        tinggiBadan: heightController.text.isNotEmpty
                                        ? double.parse(heightController.text)
                                        : null,
                                        lingkarKepala: headCircumferenceController.text.isNotEmpty
                                        ? double.parse(headCircumferenceController.text)
                                        : null,
                                        lingkarLenganAtas: upperArmCircumferenceController.text.isNotEmpty
                                        ? double.parse(upperArmCircumferenceController.text)
                                        : null,
                                        
                                        asiEksklusif: asiEksklusifValue == 3 ? "-" : asiEksklusifValue == 1 ? 'Iya' : 'Tidak',
                                        mpasi: mpasiValue == 3 ? "-" : mpasiValue == 1 ? 'Iya' : 'Tidak',
                                        
                                        tanggalPengukuran:
                                            widget.paket.data.data!.tanggalPengukuran,
                                        catatan: catatanController.text,
                                        keluhan: keluhanController.text,
                                        ),
                                  ));
                                },
                              );
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
          return const ErrorServerScreen();
        },
      ),
    );
  }

  Widget __buildChangeMeasuringToolsButton(context, SaveAlatUkurBloc saveAlatUkurBloc) {
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
            alatUkurAnakSave: alatUkurAnak,
          ),
        ).then((value) {
          if (value != null) {
            setState(() {
              alatUkurAnak = value as AlatUkurSaveModel;
              alatUkurAnakSend = value as AlatUkurSaveModel;
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

  

