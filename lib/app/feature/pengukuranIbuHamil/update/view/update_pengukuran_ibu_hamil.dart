import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field_widget.dart';
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../utils/constant/constanst.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../model/alat_ukur_response_model.dart';
import '../../../../model/alat_ukur_save_model.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/alert_choose_measuring_tools_ibu_hamil_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../../alatUkurSave/bloc/alatUkurSaveBloc/alat_ukur_save_bloc.dart';
import '../../../alatUkurSave/bloc/getAlatUkurBloc/get_alat_ukur_bloc.dart';
import '../../../alatUkurSave/bloc/saveAlatUkurBloc/save_alat_ukur_bloc.dart';
import '../../detail/model/detail_pengukuran_ibu_hamil_response_model.dart';
import '../bloc/update_pengukuran_ibu_hamil_bloc.dart';
import '../model/update_pengukuran_ibu_hamil_model.dart';

class UpdatePengukuranIbuHamil extends StatelessWidget {
  const UpdatePengukuranIbuHamil({super.key, required this.detailPengukuran});

  final DetailPengukuranIbuHamilResponseModel detailPengukuran;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdatePengukuranIbuHamilBloc(),
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
      child: UpdatePengukuranIbuHamilView(
        detailPengukuran: detailPengukuran,
      ),
    );
  }
}

class UpdatePengukuranIbuHamilView extends StatefulWidget {
  const UpdatePengukuranIbuHamilView(
      {super.key, required this.detailPengukuran});

  final DetailPengukuranIbuHamilResponseModel detailPengukuran;

  @override
  State<UpdatePengukuranIbuHamilView> createState() =>
      _UpdatePengukuranIbuHamilViewState();
}

class _UpdatePengukuranIbuHamilViewState
    extends State<UpdatePengukuranIbuHamilView> {
  final _formKey = GlobalKey<FormState>();

  String selectedPosyandu = 'Posyandu';

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _upperArmCircumferenceController =
      TextEditingController();
  TextEditingController _tinggiFundusController = TextEditingController();
  TextEditingController _hemogoblinController = TextEditingController();
  int? exposedCigaretteSmoke = 0;
  TextEditingController _tabletFeController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();

  AlatUkurSaveModel alatUkurIbuHamil = AlatUkurSaveModel();
  AlatUkurSaveModel? alatUkurIbuHamilSend;
  AlatUkurResponseModel? listAlatUkur;

  @override
  void initState() {
    BlocProvider.of<AlatUkurSaveBloc>(context).add(GetAlatUkur());

    _heightController =
        TextEditingController(text: widget.detailPengukuran.data!.tinggiBadan);
    _weightController =
        TextEditingController(text: widget.detailPengukuran.data!.beratBadan);
    _upperArmCircumferenceController = TextEditingController(
        text: widget.detailPengukuran.data!.lingkarLenganAtas);
    _tinggiFundusController = widget.detailPengukuran.data!.tinggiFundusUteri == null 
      ? TextEditingController() 
      : TextEditingController(text: widget.detailPengukuran.data!.tinggiFundusUteri);
    _hemogoblinController = widget.detailPengukuran.data!.hemoglobin == null 
      ? TextEditingController()
      : TextEditingController(text: widget.detailPengukuran.data!.hemoglobin);
    _tabletFeController = TextEditingController(
        text: widget.detailPengukuran.data!.jumlahTabletFe.toString());
    _catatanController =
        TextEditingController(text: widget.detailPengukuran.data!.catatan);

    if (widget.detailPengukuran.data!.terpaparAsapRokok == "Iya") {
      exposedCigaretteSmoke = 1;
    } else {
      exposedCigaretteSmoke = 0;
    }

    if (widget.detailPengukuran.data!.tempatPengukuran == "Posyandu") {
      selectedPosyandu = "Posyandu";
    } else {
      selectedPosyandu = "Rumah";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final updatePengukuranIbuHamilBloc =
        BlocProvider.of<UpdatePengukuranIbuHamilBloc>(context);
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
                alatUkurIbuHamilSend = value as AlatUkurSaveModel;
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
        builder: (context, stateAlatUkur) {
          if (stateAlatUkur is AlatUkurSaveProccessState) {
            return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Center(
                  child: SpinKitThreeBounce(
                    color: bluePrimaryMain,
                    size: 50.0,
                  ),
                ),
              );
          }
          if (stateAlatUkur is AlatUkurSaveSuccessState) {
            return Scaffold(
              backgroundColor: backgroundWhite10,
              appBar: PrimaryAppBar(
                title: "Perbarui Pengukuran",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Nama Ibu Hamil',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(
                              text:
                                  widget.detailPengukuran.data!.ibuHamil.nama),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          const Text(
                            'Usia Ibu Hamil',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(
                              text: widget.detailPengukuran.data!.usiaIbuHamil),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          const Text(
                            'Usia Kehamilan',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(
                              text:
                                  widget.detailPengukuran.data!.usiaKehamilan),
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
                                      hintText: 'contoh: 13.5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.detailPengukuran.data!
                                              .alatTinggiBadan.jenisAlat
                                          : alatUkurIbuHamilSend!
                                              .alatUkurTinggi!
                                              .alatPengukuranAdmin
                                              .merekAlat,
                                      controller: _heightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Lengan Atas',
                                      hintText: 'contoh: 3.5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.detailPengukuran.data!
                                              .alatLingkarLengan.jenisAlat
                                          : alatUkurIbuHamilSend!
                                              .alatUkurLingkarLengan!
                                              .alatPengukuranAdmin
                                              .merekAlat,
                                      controller:
                                          _upperArmCircumferenceController,
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
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.detailPengukuran.data!
                                              .alatBeratBadan.jenisAlat
                                          : alatUkurIbuHamilSend!.alatUkurBerat!
                                              .alatPengukuranAdmin.merekAlat,
                                      controller: _weightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Tinggi Fundus',
                                      hintText: 'contoh: 6.5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.detailPengukuran.data!.alatTinggiFundus.jenisAlat
                                          : alatUkurIbuHamilSend!.alatUkurTinggiFundus!.alatPengukuranAdmin.merekAlat,
                                      controller: _tinggiFundusController,
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
                          BlocConsumer<UpdatePengukuranIbuHamilBloc, UpdatePengukuranIbuHamilState>(
                            listener: (context, state) {
                              debugPrint(state.toString());
                              if(state is UpdatePengukuranIbuHamilFailedState) {
                                showTopSnackBar(
                                  Overlay.of(context),
                                  animationDuration: const Duration(milliseconds: 600),
                                  displayDuration: const Duration(milliseconds: 2200),
                                  reverseAnimationDuration: const Duration(milliseconds: 300),
                                  TopSnackbarWidget().error(state.error)
                                );
                              }
                              if(state is UpdatePengukuranIbuHamilSuccesState) {
                                Navigator.pop(context,1);
                              }
                            },
                            builder: (context, state) {
                              return ButtonPrimary(
                                color: bluePrimaryMain,
                                mainButtonMessage: 'Simpan',
                                isLoading: state is UpdatePengukuranIbuHamilProcessState ? true : null,
                                mainButton: () {
                                  updatePengukuranIbuHamilBloc.add(SendUpdatePengukuranIbuHamilEvent(
                                    pengukuranId: widget.detailPengukuran.data!.id,
                                    pengukuranIbuHamilModel: UpdatePengukuranIbuHamilModel(
                                      tempatPengukuran: selectedPosyandu, 
                                      beratBadan: double.parse(_weightController.text), 
                                      tinggiBadan: double.parse(_heightController.text), 
                                      tinggiFundusUteri: _tinggiFundusController.text == "" 
                                      ? null 
                                      : double.parse(_tinggiFundusController.text), 
                                      lingkarLenganAtas: double.parse(_upperArmCircumferenceController.text), 
                                      hemoglobin: _hemogoblinController.text == "" 
                                      ? null 
                                      : double.parse(_hemogoblinController.text), 
                                      terpaparAsapRokok: exposedCigaretteSmoke == 1? "Iya" : "Tidak", 
                                      jumlahTabletFe: int.parse(_tabletFeController.text), 
                                      alatBeratBadanId: alatUkurIbuHamilSend == null
                                        ? widget.detailPengukuran.data!.alatBeratBadan.id
                                        : alatUkurIbuHamilSend!.alatUkurBerat!.id,
                                      alatTinggiBadanId: alatUkurIbuHamilSend == null
                                        ? widget.detailPengukuran.data!.alatTinggiBadan.id
                                        : alatUkurIbuHamilSend!.alatUkurTinggi!.id, 
                                      alatTinggiFundusUteriId: alatUkurIbuHamilSend == null
                                        ? widget.detailPengukuran.data!.alatTinggiFundus.id
                                        : alatUkurIbuHamilSend!.alatUkurTinggiFundus!.id, 
                                      alatLingkarLenganAtasId: alatUkurIbuHamilSend == null
                                        ? widget.detailPengukuran.data!.alatLingkarLengan.id
                                        : alatUkurIbuHamilSend!.alatUkurLingkarLengan!.id
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
              alatUkurIbuHamilSend = value as AlatUkurSaveModel;
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
