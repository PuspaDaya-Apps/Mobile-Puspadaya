import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget2.dart';
import 'package:puspadaya/app/view/widget/measure_widget2.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/app/view/widget/text_field_widget2.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/paketToScreen/paketToUpdateRegisterAnak.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../detailRegisterAnak/model/get_detail_anak_response.dart';
import '../bloc/update_anak_bloc.dart';
import '../model/update_anak_model.dart';

class UpdateRegisterAnak extends StatelessWidget {
  const UpdateRegisterAnak({super.key, required this.paketDataUpdateAnak});
  final PaketToUpdateRegisterAnak paketDataUpdateAnak;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateAnakBloc(),
      child: UpdateRegisterAnakView(
        paketDataUpdateAnak: paketDataUpdateAnak,
      ),
    );
  }
}

class UpdateRegisterAnakView extends StatefulWidget {
  const UpdateRegisterAnakView(
    {super.key, required this.paketDataUpdateAnak}
  );
  final PaketToUpdateRegisterAnak paketDataUpdateAnak;

  @override
  State<UpdateRegisterAnakView> createState() => _UpdateRegisterAnakViewState();
}

class _UpdateRegisterAnakViewState extends State<UpdateRegisterAnakView> {
  final _formKey = GlobalKey<FormState>();
  final scrollController = ScrollController();

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAnak = [];
  List<String> selectedDisabilityLabelsAnak = [];

  TextEditingController nomorKKController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController anakKeController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController lingkarLenganController = TextEditingController();
  TextEditingController lingkarKepalaController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController jarakPosyanduController = TextEditingController();

  String? selectedGender;
  String? selectedCaraLahir;
  String? selectedStatusKelahiran;
  String? selectedStatusOrangTuaAnak;
  String? selectedStatusAnak;

  // ! focus node
  final FocusNode nikFocusNode = FocusNode();
  final FocusNode namaFocusNode = FocusNode();
  final FocusNode anakKeFocusNode = FocusNode();
  final FocusNode tempatLahirFocusNode = FocusNode();
  final FocusNode tanggalLahirFocusNode = FocusNode();
  final FocusNode lingkarLenganFocusNode = FocusNode();
  final FocusNode lingkarKepalaFocusNode = FocusNode();
  final FocusNode heightFocusNode = FocusNode();
  final FocusNode weightFocusNode = FocusNode();
  final FocusNode jarakPosyanduFocusNode = FocusNode();
  final FocusNode genderFocusNode = FocusNode();
  final FocusNode caraLahirFocusNode = FocusNode();
  final FocusNode statusKelahiranFocusNode = FocusNode();
  final FocusNode statusOrangTuaFocusNode = FocusNode();
  FocusNode selectedStatusAnakFocusNode = FocusNode();


  // ! formfield key
  final GlobalKey<FormFieldState<String>> nikFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> namaFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> anakKeFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> tempatLahirFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> tanggalLahirFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> lingkarLenganFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> lingkarKepalaFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> heightFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> weightFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> jarakPosyanduFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> genderFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> caraLahirFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> statusKelahiranFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> statusOrangTuaFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState> selectedStatusAnakKey = GlobalKey<FormFieldState>();

  void _toggleDisability(int index) {
    setState(() {
      selectedDisabilitiesAnak[index] = !selectedDisabilitiesAnak[index];
      if (selectedDisabilitiesAnak[index]) {
        selectedDisabilityLabelsAnak.add(disabilities[index]);
      } else {
        selectedDisabilityLabelsAnak.remove(disabilities[index]);
      }
    });
  }

  void _removeDisability(String label) {
    setState(() {
      selectedDisabilityLabelsAnak.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilitiesAnak[index] = false;
      }
    });
  }

  void submitForm(UpdateAnakBloc updateAnakBloc) {
    logger.d("jarak posyandu update ${jarakPosyanduController.text}");
    if (_formKey.currentState!.validate()) {
      updateAnakBloc.add(UpdateAnak(
          id: widget.paketDataUpdateAnak.data.id,
          updateAnakModel: UpdateAnakModel(
              jarakPosyandu: double.tryParse(jarakPosyanduController.text) ?? 0,
              nik: nikController.text,
              namaAnak: namaController.text,
              anakKe: int.parse(anakKeController.text),
              tempatLahir: tempatLahirController.text,
              tanggalLahir: tanggalLahirController.text,
              jenisKelamin: selectedGender!,
              beratBadanLahir: double.parse(weightController.text),
              tinggiBadanLahir: double.parse(heightController.text),
              lingkarKepalaLahir: double.parse(lingkarKepalaController.text),
              lingkarLenganAtasLahir:
                  double.parse(lingkarLenganController.text),
              caraLahir: selectedCaraLahir!,
              statusKelahiran: selectedStatusKelahiran!,
              statusOrangTua: selectedStatusOrangTuaAnak!,
              disabilitasAnak: selectedDisabilityLabelsAnak,
              anakPindah: selectedStatusAnak == 'anak pindah'
                ? true : false,
              anakMeninggal: selectedStatusAnak == 'anak meninggal'
                ? true : false)));
    } else {
      logger.d("form tidak valid");
      final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
        
        nikFormFieldKey: nikFocusNode,
        namaFormFieldKey: namaFocusNode,
        anakKeFormFieldKey: anakKeFocusNode,
        tempatLahirFormFieldKey: tempatLahirFocusNode,
        tanggalLahirFormFieldKey: tanggalLahirFocusNode,
        weightFormFieldKey: weightFocusNode,
        heightFormFieldKey: heightFocusNode,
        lingkarLenganFormFieldKey: lingkarLenganFocusNode,
        jarakPosyanduFormFieldKey: jarakPosyanduFocusNode,
        lingkarKepalaFormFieldKey: lingkarKepalaFocusNode,
        genderFormFieldKey: genderFocusNode,
        caraLahirFormFieldKey: caraLahirFocusNode,
        statusKelahiranFormFieldKey: statusKelahiranFocusNode,
        jarakPosyanduFormFieldKey: jarakPosyanduFocusNode,
        statusOrangTuaFormFieldKey: statusOrangTuaFocusNode
      };
      // logger.d(fieldMap);

      // Cari field pertama yang memiliki error
      for (var entry in fieldMap.entries) {
        final key = entry.key;
        final focusNode = entry.value;

        logger.d(
            'key is ${key}, context current is ${key.currentContext}, has error ${key.currentState?.hasError}');
        // Cek apakah field ini punya error
        if (key.currentState?.hasError ?? false) {
          // Jika ya, scroll ke field ini

          print('Field ${entry.key} has error: ${key.currentState?.hasError}');
          print('Current context: ${key.currentContext}');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scrollable.ensureVisible(
              key.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: 0.3,
            );
            focusNode.requestFocus();
          });

          // Hentikan loop karena kita hanya butuh fokus ke error pertama
          break;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Inisialisasi status checkbox dengan false
    selectedDisabilitiesAnak =
        List<bool>.from(List.filled(disabilities.length, false));

    //! textcontroller
    nomorKKController = TextEditingController(
        text:
            widget.paketDataUpdateAnak.data.kartuKeluarga.nomorKartuKeluarga);
    nikController =
        TextEditingController(text: widget.paketDataUpdateAnak.data.nik);
    namaController =
        TextEditingController(text: widget.paketDataUpdateAnak.data.namaAnak);
    anakKeController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.anakKe.toString());
    tempatLahirController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.tempatLahir);
    tanggalLahirController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.tanggalLahir
            .toString()
            .split(' ')[0]);
    lingkarLenganController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.lingkarLenganAtasLahir);
    lingkarKepalaController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.lingkarKepalaLahir);
    heightController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.tinggiBadanLahir);
    weightController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.beratBadanLahir);
    jarakPosyanduController = TextEditingController(
        text: widget.paketDataUpdateAnak.data.jarakPosyandu);

    //! selected
    selectedGender = widget.paketDataUpdateAnak.data.jenisKelamin;
    selectedCaraLahir = widget.paketDataUpdateAnak.data.caraLahir;
    selectedStatusKelahiran = widget.paketDataUpdateAnak.data.statusKelahiran;
    selectedStatusOrangTuaAnak =
        widget.paketDataUpdateAnak.data.statusOrangTua;

    if(widget.paketDataUpdateAnak.statusAnak != null) {
      selectedStatusAnak = selectStatusAnak[widget.paketDataUpdateAnak.statusAnak!];
    }

    debugPrint('Init state');
    debugPrint(
        widget.paketDataUpdateAnak.data.disabilitasAnak!.length.toString());
    if (widget.paketDataUpdateAnak.data.disabilitasAnak!.isNotEmpty) {
      debugPrint('not empty');
      for (var value in widget.paketDataUpdateAnak.data.disabilitasAnak!) {
        debugPrint(disabilities.contains(value.namaDisabilitas).toString());
        selectedDisabilityLabelsAnak.add(value.namaDisabilitas);
        if (disabilities.contains(value.namaDisabilitas)) {
          int index = disabilities.indexOf(value.namaDisabilitas);
          debugPrint(index.toString());
          selectedDisabilitiesAnak[index] = true;
        }
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(2023); // Set initial date to the year 1945
    DateTime firstDate = DateTime(1950); // Set the first date to the year 1945
    DateTime lastDate = now; // Set the last date to the current date

    DateTime? pickedDate = await showDatePicker(
      cancelText: "Batalkan",
      confirmText: "OK",
      currentDate: now,
      helpText: "Pilih Tanggal",
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      tanggalLahirController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    final updateAnakBloc = BlocProvider.of<UpdateAnakBloc>(context);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Perbarui Data Anak',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 1.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'NIK',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  TextFieldWidget2(
                    fieldName: 'nik_anak',
                    focusNode: nikFocusNode,
                    onTap: () {},
                    formFieldKey: nikFormFieldKey,
                    controller: nikController,
                    hintText: 'Masukan NIK',
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    clientValidators: [
                      FormBuilderValidators.required(
                          errorText: "Isi terlebih dahulu!"),
                      FormBuilderValidators.numeric(
                          errorText: "KK harus berupa angka!"),
                      FormBuilderValidators.equalLength(16,
                          errorText: "KK harus terdiri dari 16 angka!"),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Nama',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  TextFieldWidget2(
                    fieldName: 'nama_anak',
                    focusNode: namaFocusNode,
                    formFieldKey: namaFormFieldKey,
                    onTap: () {},
                    controller: namaController,
                    hintText: 'Nama',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    isPasswordField: false,
                    clientValidators: [
                      FormBuilderValidators.required(
                          errorText: "Isi terlebih dahulu!"),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Anak Ke',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  TextFieldWidget2(
                    fieldName: 'anak_ke',
                    focusNode: anakKeFocusNode,
                    onTap: () {},
                    formFieldKey: anakKeFormFieldKey,
                    controller: anakKeController,
                    hintText: 'Anak Ke',
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    isPasswordField: false,
                    clientValidators: [
                      FormBuilderValidators.required(
                          errorText: "Isi terlebih dahulu!"),
                      FormBuilderValidators.numeric(
                          errorText: "Anak ke harus berupa angka!"),
                      FormBuilderValidators.min(1,
                          errorText: "Anak ke minimal 1!"),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Tempat Lahir',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            TextFieldWidget2(
                              fieldName: 'tempat_lahir_anak',
                              focusNode: tempatLahirFocusNode,
                              formFieldKey: tempatLahirFormFieldKey,
                              onTap: () {},
                              controller: tempatLahirController,
                              hintText: 'Tempat Lahir',
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              isPasswordField: false,
                              clientValidators: [
                                FormBuilderValidators.required(
                                    errorText: "Isi terlebih dahulu!"),
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
                            const Text(
                              'Tanggal Lahir',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            DateTimePickerWidget(
                              focusNode: tanggalLahirFocusNode,
                              key: tanggalLahirFormFieldKey,
                              controller: tanggalLahirController,
                              hintText: 'Tanggal Lahir',
                              selectDate: () {
                                _selectDate(context);
                                tanggalLahirFormFieldKey.currentState!
                                    .validate();
                              },
                              isDate: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Tanggal harus dipilih";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
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
                            MeasurementWidget2(
                              onTap: () {},
                              formFieldKey: heightFormFieldKey,
                              fieldName: 'tinggi_lahir_anak',
                              focusNode: heightFocusNode,
                              title: 'Tinggi Lahir',
                              hintText: 'contoh: 38.5',
                              unit: 'cm',
                              controller: heightController,
                              clientValidators: [
                                FormBuilderValidators.required(
                                    errorText: "Isi terlebih dahulu!"),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget2(
                              fieldName: 'lingkar_lengan_anak',
                              focusNode: lingkarLenganFocusNode,
                              onTap: () {},
                              formFieldKey: lingkarLenganFormFieldKey,
                              title: 'Lingkar Lengan',
                              hintText: 'contoh: 3.5',
                              unit: 'cm',
                              controller: lingkarLenganController,
                              clientValidators: [
                                FormBuilderValidators.required(
                                    errorText: "Isi terlebih dahulu!"),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MeasurementWidget2(
                              fieldName: 'berat_lahir_anak',
                              focusNode: weightFocusNode,
                              onTap: () {},
                              formFieldKey: weightFormFieldKey,
                              title: 'Berat Lahir',
                              hintText: 'contoh: 9.5',
                              unit: 'kg',
                              controller: weightController,
                              clientValidators: [
                                FormBuilderValidators.required(
                                    errorText: "Isi terlebih dahulu!"),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget2(
                              fieldName: 'lingkar_kepala_anak',
                              focusNode: lingkarKepalaFocusNode,
                              onTap: () {},
                              formFieldKey: lingkarKepalaFormFieldKey,
                              title: 'Lingkar Kepala',
                              hintText: 'contoh: 6.5',
                              unit: 'cm',
                              controller: lingkarKepalaController,
                              clientValidators: [
                                FormBuilderValidators.required(
                                    errorText: "Isi terlebih dahulu!"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Jenis Kelamin',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget2(
                    focusNode: genderFocusNode,
                    formFieldKey: genderFormFieldKey,
                    items: selectGender,
                    hint: 'Jenis Kelamin',
                    value: selectedGender,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Jenis Kelamin harus dipilih";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Cara Lahir',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget2(
                    focusNode: caraLahirFocusNode,
                    formFieldKey: caraLahirFormFieldKey,
                    items: selectCaraLahir,
                    hint: 'Cara Lahir',
                    value: selectedCaraLahir,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Cara Lahir harus dipilih";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedCaraLahir = value;
                      });
                      caraLahirFormFieldKey.currentState!.validate();
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Jarak Posyandu (Meter)',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget2(
                    fieldName: 'jarak_posyandu_anak',
                    focusNode: jarakPosyanduFocusNode,
                    onTap: () {},
                    formFieldKey: jarakPosyanduFormFieldKey,
                    controller: jarakPosyanduController,
                    hintText: 'Jarak Posyandu',
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    isPasswordField: false,
                    clientValidators: [],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Status Kelahiran',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget2(
                    focusNode: statusKelahiranFocusNode,
                    formFieldKey: statusKelahiranFormFieldKey,
                    items: selectStatusKelahiran,
                    hint: 'Status Kelahiran',
                    value: selectedStatusKelahiran,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Status Kelahiran harus dipilih";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedStatusKelahiran = value;
                      });
                      statusKelahiranFormFieldKey.currentState!.validate();
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Status Orang Tua Anak',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget2(
                    focusNode: statusOrangTuaFocusNode,
                    formFieldKey: statusOrangTuaFormFieldKey,
                    items: selectStatusOrangTuaAnak,
                    hint: 'Status Orang Tua Anak',
                    value: selectedStatusOrangTuaAnak,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Status Orang Tua Anak harus dipilih";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedStatusOrangTuaAnak = value;
                      });
                      statusOrangTuaFormFieldKey.currentState!.validate();
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Status Anak',
                    style: AppTextStyles.primaryTextNormal.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  DropdownWidget2(
                    formFieldKey: selectedStatusAnakKey,
                    focusNode: selectedStatusAnakFocusNode,
                    hint: 'Pilih Status Anak',
                    items: selectStatusAnak,
                    value: selectedStatusAnak,
                    onChanged: (value) {
                      setState(() {
                        selectedStatusAnak = value;
                      });
                      selectedStatusAnakKey.currentState!.validate();
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Column(
                    children: selectedDisabilityLabelsAnak.map((label) {
                      return ListTile(
                        title: Text(
                          label,
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _removeDisability(label);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  OutlineButton(
                    color: Colors.grey,
                    mainButtonMessage: 'Tambah Disabilitas',
                    mainButton: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogDisabilitas(
                            disabilities: disabilities,
                            selectedDisabilities: selectedDisabilitiesAnak,
                            onToggleDisability: _toggleDisability,
                            onAddCustomDisability: (String customDisability) {
                              setState(() {
                                disabilities.add(customDisability);
                                selectedDisabilitiesAnak.add(true);
                                selectedDisabilityLabelsAnak
                                    .add(customDisability);
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  BlocConsumer<UpdateAnakBloc, UpdateAnakState>(
                    listener: (context, state) {
                      if (state is UpdateAnakSuccessState) {
                        Navigator.pop(context, 1);
                      } else if (state is UpdateAnakFailedState) {
                        showTopSnackBar(
                            Overlay.of(context),
                            animationDuration:
                                const Duration(milliseconds: 600),
                            displayDuration: const Duration(milliseconds: 2200),
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
                          submitForm(updateAnakBloc);
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
}

class DialogDisabilitas extends StatefulWidget {
  final List<String> disabilities;
  final List<bool> selectedDisabilities;
  final Function(int) onToggleDisability;
  final Function(String) onAddCustomDisability;

  const DialogDisabilitas({
    Key? key,
    required this.disabilities,
    required this.selectedDisabilities,
    required this.onToggleDisability,
    required this.onAddCustomDisability,
  }) : super(key: key);

  @override
  State<DialogDisabilitas> createState() => _DialogDisabilitasState();
}

class _DialogDisabilitasState extends State<DialogDisabilitas> {
  bool isOtherChecked = false;
  TextEditingController otherDisabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pilih Disabilitas',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.calHeightMultiplier(16),
              ),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(6)),

            // Checklist untuk disabilitas yang tersedia
            ...List.generate(widget.disabilities.length, (index) {
              return CheckboxListWidget(
                isChecked: widget.selectedDisabilities[index],
                label: widget.disabilities[index],
                onChanged: (bool? value) {
                  setState(() {
                    widget.onToggleDisability(index);
                  });
                },
              );
            }),

            // Checkbox untuk opsi "Lainnya"
            // Checkbox untuk opsi "Lainnya"
            CheckboxListWidget(
              isChecked: isOtherChecked,
              label: "Lainnya",
              onChanged: (bool? value) {
                setState(() {
                  isOtherChecked = value ?? false;
                  if (!isOtherChecked) {
                    otherDisabilityController.clear();
                  }
                });
              },
            ),

            // TextField muncul jika "Lainnya" dipilih
            if (isOtherChecked)
              TextField(
                controller: otherDisabilityController,
                decoration: InputDecoration(
                  hintText: "Masukkan jenis disabilitas lainnya",
                  border: OutlineInputBorder(),
                ),
              ),

            SizedBox(height: SizeConfig.calHeightMultiplier(16)),

            ButtonPrimary(
              mainButtonMessage: 'Simpan',
              mainButton: () {
                if (isOtherChecked &&
                    otherDisabilityController.text.isNotEmpty) {
                  widget.onAddCustomDisability(otherDisabilityController.text);
                }
                Navigator.pop(context);
              },
              color: bluePrimaryMain,
            ),
          ],
        ),
      ),
    );
  }
}
