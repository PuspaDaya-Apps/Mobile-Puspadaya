import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/Bloc/searchIbuHamilCubit/search_ibu_hamil_cubit.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/Bloc/searchIbuHamilCubit/search_ibu_hamil_state.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/create/view/search_ibu_hamil.dart';
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
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../utils/constant/constanst.dart';
import '../../../../model/alat_ukur_response_model.dart';
import '../../../../model/alat_ukur_save_model.dart';
import '../../../../model/paketToScreen/paket_to_create_pengukuran_ibu_hamil_model.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/alert_choose_measuring_tools_ibu_hamil_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../../alatUkurSave/bloc/alatUkurSaveBloc/alat_ukur_save_bloc.dart';
import '../../../alatUkurSave/bloc/getAlatUkurBloc/get_alat_ukur_bloc.dart';
import '../../../alatUkurSave/bloc/saveAlatUkurBloc/save_alat_ukur_bloc.dart';
import '../Bloc/createPengukuranIbuHamilBloc/create_pengukuran_ibu_hamil_bloc.dart';
import '../model/post_pengukuran_ibu_hamil_model.dart';

class CreatePengukuranIbuHamil extends StatelessWidget {
  const CreatePengukuranIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchIbuHamilCubit(),
        ),
        BlocProvider(
          create: (context) => CreatePengukuranIbuHamilBloc(),
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

class _CreatePengukuranIbuHamilViewState extends State<CreatePengukuranIbuHamilView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageMotherController = TextEditingController();
  TextEditingController _gestationalAgeController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _upperArmCircumferenceController = TextEditingController();
  TextEditingController _tinggiFundusUteriController = TextEditingController();
  TextEditingController _hemogoblinController = TextEditingController();
  int? exposedCigaretteSmoke = 0;
  TextEditingController _tabletFeController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();

  String selectedPosyandu = 'Posyandu';

  late PaketToCreatePengukuranIbuHamilModel paket;

  AlatUkurSaveModel alatUkurIbuHamil = AlatUkurSaveModel();
  AlatUkurResponseModel? listAlatUkur;

  @override
  void initState() {
    BlocProvider.of<AlatUkurSaveBloc>(context).add(GetAlatUkur());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final createPengukuranIbuHamilBloc =
        BlocProvider.of<CreatePengukuranIbuHamilBloc>(context);
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
            BlocProvider.of<GetAlatUkurBloc>(context).add(GetAlatUkurIbuHamil());
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
                title: "Pengukuran Ibu Hamil",
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
                                  _nameController.text = state.name;
                                }
                              },
                              //! name
                              child: TextFormField(
                                readOnly: true,
                                validator: null,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchIbuHamil(),
                                    ),
                                  ).then((paketValue) {
                                    setState(() {
                                      if (paketValue != null) {
                                        paket = paketValue;

                                        _nameController = TextEditingController(
                                            text: paket.namaIbu);
                                        _ageMotherController =
                                            TextEditingController(
                                                text: paket.usiaIbuHamil);
                                        _gestationalAgeController =
                                            TextEditingController(
                                                text: paket.usiaKandungan);
                                      }
                                    });
                                  });
                                },
                                controller: _nameController,
                                style: Theme.of(context).textTheme.bodySmall,
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    FluentIcons.search_24_regular,
                                  ),
                                  hintText: 'Pilih Ibu Hamil',
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
                              )),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Text(
                            'Usia Ibu Hamil',
                            style: AppTextStyles.primaryTextNormal
                                .copyWith(fontSize: 12),
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
                            style: AppTextStyles.primaryTextNormal
                                .copyWith(fontSize: 12),
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
                                      hintText: 'contoh: 13,5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamil.alatUkurTinggi
                                          ?.alatPengukuranAdmin.jenisAlat,
                                      controller: _heightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Lengan Atas',
                                      hintText: 'contoh: 3,5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamil
                                          .alatUkurLingkarLengan
                                          ?.alatPengukuranAdmin
                                          .jenisAlat,
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
                                      hintText: 'contoh: 6,5',
                                      unit: 'kg',
                                      tool: alatUkurIbuHamil.alatUkurBerat
                                          ?.alatPengukuranAdmin.jenisAlat,
                                      controller: _weightController,
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Tinggi Fundus',
                                      hintText: 'contoh: 6,5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamil
                                          .alatUkurTinggiFundus
                                          ?.alatPengukuranAdmin
                                          .jenisAlat,
                                      controller: _tinggiFundusUteriController,
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
                          BlocConsumer<CreatePengukuranIbuHamilBloc, CreatePengukuranIbuHamilState>(
                            listener: (context, state) {
                              debugPrint(state.toString());
                              if(state is CreatePengukuranIbuHamilSuccesState) {
                                Navigator.pop(context,1);
                                Navigator.pop(context,1);
                              }
                              if(state is CreatePengukuranIbuHamilFailedState) {
                                showTopSnackBar(
                                  Overlay.of(context),
                                  animationDuration: const Duration(milliseconds: 600),
                                  displayDuration: const Duration(milliseconds: 2200),
                                  reverseAnimationDuration: const Duration(milliseconds: 300),
                                  TopSnackbarWidget().error(state.error)
                                );
                              }
                            },
                            builder: (context, state) {
                              return ButtonPrimary(
                                color: bluePrimaryMain,
                                mainButtonMessage: 'Simpan',
                                mainButton: () {
                                  if(_formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialogSave(
                                          cancelButton: () {
                                            Navigator.pop(context);
                                          },
                                          mainButton: () {
                                            createPengukuranIbuHamilBloc.add(SendPengukuranIbuHamilEvent(
                                              PostPengukuranIbuHamilModel(
                                                ibuHamilId: paket.id, 
                                                tempatPengukuran: selectedPosyandu, 
                                                tanggalPengukuran: DateFormat("y-MM-dd", "ID_id").format(DateTime.now()), 
                                                beratBadan: double.parse(_weightController.text), 
                                                tinggiBadan: double.parse(_heightController.text), 
                                                tinggiFundusUteri: double.parse(_tinggiFundusUteriController.text), 
                                                lingkarLenganAtas: double.parse(_upperArmCircumferenceController.text), 
                                                hemoglobin: double.parse(_hemogoblinController.text),
                                                terpaparAsapRokok: exposedCigaretteSmoke! == 1 ? "Iya" : "Tidak", 
                                                jumlahTabletFe: int.parse(_tabletFeController.text),

                                                alatBeratBadanId: alatUkurIbuHamil.alatUkurBerat!.id, 
                                                alatTinggiBadanId: alatUkurIbuHamil.alatUkurTinggi!.id, 
                                                alatTinggiFundusUteriId: alatUkurIbuHamil.alatUkurTinggiFundus!.id, 
                                                alatLingkarLenganAtasId: alatUkurIbuHamil.alatUkurLingkarLengan!.id
                                              )
                                            ));
                                          },
                                          cancelButtonMessage: 'Tidak',
                                          mainButtonMessage: 'Iya Simpan Data',
                                          colorMainButton: bluePrimaryMain,
                                          heighValue: _heightController.text,
                                          weightValue: _weightController.text,
                                          upperArmCircumference: _upperArmCircumferenceController.text,
                                          uterineFundalHeightValue: _tinggiFundusUteriController.text,
                                        );
                                      },
                                    );
                                  } else {
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      animationDuration: const Duration(milliseconds: 600),
                                      displayDuration: const Duration(milliseconds: 2200),
                                      reverseAnimationDuration: const Duration(milliseconds: 300),
                                      TopSnackbarWidget().error("Form tidak boleh kosong")
                                    );
                                  }
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
