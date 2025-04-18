import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/alat_ukur_response_model.dart';
import '../../../model/alat_ukur_save_model.dart';
import '../../../model/paketToScreen/paketToUpdateRegisterIbuHamil.dart';
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
import '../../alatUkurSave/bloc/alatUkurSaveBloc/alat_ukur_save_bloc.dart';
import '../../alatUkurSave/bloc/getAlatUkurBloc/get_alat_ukur_bloc.dart';
import '../../alatUkurSave/bloc/saveAlatUkurBloc/save_alat_ukur_bloc.dart';
import '../../createRegisterIbuHamil/model/post_ibu_hamil_model.dart';
// import '../../pengukuranAnak/alatUkur/bloc/alat_ukur_anak_bloc.dart';
import '../bloc/update_register_ibu_hamil_bloc.dart';
import '../model/update_ibu_hamil_model.dart';

class UpdateRegisterIbuHamil extends StatelessWidget {
  final PaketToUpdateRegisterIbuHamil data;
  const UpdateRegisterIbuHamil({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateRegisterIbuHamilBloc(),
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
  TextEditingController _upperArmCircumferenceController =
      TextEditingController();
  TextEditingController _uterineFundusHeightController =
      TextEditingController();
  TextEditingController _hemoglobinController = TextEditingController();
  TextEditingController _firstDateHaidController = TextEditingController();
  TextEditingController _lastDateHaidController = TextEditingController();
  int? exposedCigaretteSmoke = 0;
  TextEditingController _tabletFeController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  TextEditingController _namaBPJSController = TextEditingController();
  TextEditingController _jarakController = TextEditingController();

  String selectedPosyandu = 'Posyandu';

  bool boolNamaBPJS = false;
  String? selectedMemilikiBPJS;
  String? selectedNamaBPJS;
  int? selectedRadioBPJS;

  AlatUkurSaveModel alatUkurIbuHamil = AlatUkurSaveModel();
  AlatUkurSaveModel? alatUkurIbuHamilSend;
  AlatUkurResponseModel? listAlatUkur;

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
    BlocProvider.of<AlatUkurSaveBloc>(context).add(GetAlatUkur());

    _firstDateHaidController.text =
        convertDateToYYMMDD(widget.data.data.tanggalPertamaHaid);
    _lastDateHaidController.text =
        convertDateToYYMMDD(widget.data.data.tanggalTerakhirHaid);
    _heightController.text = widget.data.data.tinggiBadan;
    _weightController.text = widget.data.data.beratBadan;
    _catatanController.text = widget.data.data.catatan;
    _tabletFeController.text = widget.data.data.jumlahTabletFe.toString();
    _upperArmCircumferenceController.text = widget.data.data.lingkarLenganAtas;
    _jarakController.text = widget.data.data.jarak % 1 == 0
        ? widget.data.data.jarak.toInt().toString()
        : widget.data.data.jarak.toString();

    _hemoglobinController.text = widget.data.data.hemoglobin == null
        ? ""
        : widget.data.data.hemoglobin!.replaceAll('.00', '');
    _uterineFundusHeightController.text =
        widget.data.data.tinggiFundusUteri ?? "";

    switch (widget.data.data.namaBPJS) {
      case null:
        selectedNamaBPJS = null;

        boolNamaBPJS = false;
        selectedMemilikiBPJS = "Tidak";

      case "BPJS PBI (bantuan)":
        selectedRadioBPJS = 0;
        selectedNamaBPJS = widget.data.data.namaBPJS;

        boolNamaBPJS = true;
        selectedMemilikiBPJS = "Iya";

      case "BPJS Mandiri":
        selectedRadioBPJS = 1;
        selectedNamaBPJS = widget.data.data.namaBPJS;

        boolNamaBPJS = true;
        selectedMemilikiBPJS = "Iya";

      default:
        selectedRadioBPJS = 2;
        _namaBPJSController =
            TextEditingController(text: widget.data.data.namaBPJS);

        boolNamaBPJS = true;
        selectedMemilikiBPJS = "Iya";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 10;

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
          if (stateListAlatUkur is AlatUkurSaveSuccessState) {
            return Scaffold(
              backgroundColor: backgroundWhite10,
              appBar: PrimaryAppBar(
                title: "Perbarui Ibu Hamil",
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
                                  InfoFieldWidget(
                                      text: widget.data.data.ibuAnak.namaIbu),
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
                                  InfoFieldWidget(
                                      text: widget.data.data.ibuAnak.usia),
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
                                  InfoFieldWidget(
                                      text: widget.data.data.ibuAnak.nik),
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
                                  InfoFieldWidget(
                                      text: widget
                                          .data.data.ibuAnak.ayah.namaAyah),
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
                                      hintText: 'contoh: 150.5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.data.data.alatTinggiBadan
                                              .jenisAlat
                                          : alatUkurIbuHamil.alatUkurTinggi!
                                              .alatPengukuranAdmin.merekAlat,
                                      controller: _heightController,
                                      validator: [
                                        (value) => Validator.required(value),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Lingkar Lengan Atas',
                                      hintText: 'contoh: 12.5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.data.data.alatLingkarLengan
                                              .jenisAlat
                                          : alatUkurIbuHamil
                                              .alatUkurLingkarLengan!
                                              .alatPengukuranAdmin
                                              .merekAlat,
                                      controller:
                                          _upperArmCircumferenceController,
                                      validator: [
                                        (value) => Validator.required(
                                              value,
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
                                      hintText: 'contoh: 60.5',
                                      unit: 'kg',
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.data.data.alatBeratBadan
                                              .jenisAlat
                                          : alatUkurIbuHamil.alatUkurBerat!
                                              .alatPengukuranAdmin.merekAlat,
                                      controller: _weightController,
                                      validator: [
                                        (value) => Validator.required(
                                              value,
                                            ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(16),
                                    ),
                                    MeasurementWidget(
                                      title: 'Tinggi Fundus Uteri',
                                      hintText: 'contoh: 15.5',
                                      unit: 'cm',
                                      tool: alatUkurIbuHamilSend == null
                                          ? widget.data.data.alatTinggiFundus
                                              .jenisAlat
                                          : alatUkurIbuHamil
                                              .alatUkurTinggiFundus!
                                              .alatPengukuranAdmin
                                              .merekAlat,
                                      // validator: [
                                      //   (value) => Validator.required(value,
                                      //       'Tinggi Fundus Uteri Wajib Diisi'),
                                      // ],
                                      // tool: 'Alat Ukur Lingkar Kepala',
                                      controller:
                                          _uterineFundusHeightController,
                                    ),
                                    // radio button
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Text(
                            'Hemoglobin',
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
                                  controller: _hemoglobinController,
                                  hintText: "Hemoglobin",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  // validators: [
                                  //   (value) => Validator.required(
                                  //       value, 'Hemoglobin Wajib Diisi'),
                                  // ],
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
                            controller: _jarakController,
                            hintText: 'Jarak Posyandu',
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            isPasswordField: false,
                            validators: [],
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
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
                                  spacing: 16,
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
                                      validators: [
                                        (value) => Validator.required(
                                              value,
                                            )
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
                                              (value) =>
                                                  Validator.required(value),
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
                                    TopSnackbarWidget().success(
                                        'Berhasil Perbarui Data Ibu Hamil'));
                                Navigator.pop(context, 1);
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
                                    TopSnackbarWidget()
                                        .error(state.error.message));
                              }
                            },
                            child: ButtonPrimary(
                              color: bluePrimaryMain,
                              mainButtonMessage: 'Simpan',
                              mainButton: () {
                                if (_formKey.currentState!.validate()) {
                                  UpdateIbuHamilModel postData = UpdateIbuHamilModel(
                                      jarak: double.tryParse(_jarakController.text) ??
                                          0,
                                      alatBeratBadanId: alatUkurIbuHamilSend == null
                                          ? widget.data.data.alatBeratBadan.id
                                          : alatUkurIbuHamil.alatUkurBerat!.id,
                                      alatLingkarLenganId:
                                          alatUkurIbuHamilSend == null
                                              ? widget.data.data
                                                  .alatLingkarLengan.id
                                              : alatUkurIbuHamil
                                                  .alatUkurLingkarLengan!.id,
                                      alatTinggiBadanId: alatUkurIbuHamilSend == null
                                          ? widget.data.data.alatTinggiBadan.id
                                          : alatUkurIbuHamil.alatUkurTinggi!.id,
                                      alatTinggiFundusId: alatUkurIbuHamilSend == null
                                          ? widget.data.data.alatTinggiFundus.id
                                          : alatUkurIbuHamil
                                              .alatUkurTinggiFundus!.id,
                                      beratBadan:
                                          _parseDouble(_weightController.text),
                                      catatan: _catatanController.text,
                                      hemoglobin: _hemoglobinController.text == ""
                                          ? null
                                          : _parseDouble(
                                              _hemoglobinController.text),
                                      jumlahTabletFe:
                                          _parseInt(_tabletFeController.text),
                                      lingkarLenganAtas:
                                          _parseDouble(_upperArmCircumferenceController.text),
                                      terpaparAsapRokok: exposedCigaretteSmoke == 1 ? "Iya" : "Tidak",
                                      tinggiBadan: _parseDouble(_heightController.text),
                                      tinggiFundusUteri: _uterineFundusHeightController.text == "" ? null : _parseDouble(_uterineFundusHeightController.text),
                                      tanggalPertamaHaid: _formatDate(_firstDateHaidController.text),
                                      tanggalTerakhirHaid: _formatDate(_lastDateHaidController.text),
                                      memilkiBPJS: selectedMemilikiBPJS!,
                                      namaBPJS: selectedRadioBPJS == 2 ? _namaBPJSController.text : selectedNamaBPJS);

                                  context
                                      .read<UpdateRegisterIbuHamilBloc>()
                                      .add(PatchUpdateRegisterIbuHamil(
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
