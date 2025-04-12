import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../detailRegisterAnak/model/get_detail_anak_response.dart';
import '../bloc/update_anak_bloc.dart';
import '../model/update_anak_model.dart';

class UpdateRegisterAnak extends StatelessWidget {
  const UpdateRegisterAnak({super.key, required this.getDetailAnakResponse});
  final GetDetailAnakResponse getDetailAnakResponse;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateAnakBloc(),
      child: UpdateRegisterAnakView(
        getDetailAnakResponse: getDetailAnakResponse,
      ),
    );
  }
}

class UpdateRegisterAnakView extends StatefulWidget {
  const UpdateRegisterAnakView(
      {super.key, required this.getDetailAnakResponse});
  final GetDetailAnakResponse getDetailAnakResponse;

  @override
  State<UpdateRegisterAnakView> createState() => _UpdateRegisterAnakViewState();
}

class _UpdateRegisterAnakViewState extends State<UpdateRegisterAnakView> {
  final _formKey = GlobalKey<FormState>();

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

  String? selectedGender;
  String? selectedCaraLahir;
  String? selectedStatusKelahiran;
  String? selectedStatusOrangTuaAnak;

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

  @override
  void initState() {
    super.initState();
    // Inisialisasi status checkbox dengan false
    selectedDisabilitiesAnak =
        List<bool>.from(List.filled(disabilities.length, false));

    //! textcontroller
    nomorKKController = TextEditingController(
        text: widget
            .getDetailAnakResponse.data!.kartuKeluarga!.nomorKartuKeluarga);
    nikController =
        TextEditingController(text: widget.getDetailAnakResponse.data!.nik);
    namaController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.namaAnak);
    anakKeController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.anakKe.toString());
    tempatLahirController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.tempatLahir);
    tanggalLahirController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.tanggalLahir);
    lingkarLenganController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.lingkarLenganAtasLahir);
    lingkarKepalaController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.lingkarKepalaLahir);
    heightController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.tinggiBadanLahir);
    weightController = TextEditingController(
        text: widget.getDetailAnakResponse.data!.beratBadanLahir);

    //! selected
    selectedGender = widget.getDetailAnakResponse.data!.jenisKelamin;
    selectedCaraLahir = widget.getDetailAnakResponse.data!.caraLahir;
    selectedStatusKelahiran =
        widget.getDetailAnakResponse.data!.statusKelahiran;
    selectedStatusOrangTuaAnak =
        widget.getDetailAnakResponse.data!.statusOrangTua;

    debugPrint('Init state');
    debugPrint(
        widget.getDetailAnakResponse.data!.disabilitasAnak!.length.toString());
    if (widget.getDetailAnakResponse.data!.disabilitasAnak!.isNotEmpty) {
      debugPrint('not empty');
      for (var value in widget.getDetailAnakResponse.data!.disabilitasAnak!) {
        debugPrint(disabilities.contains(value.namaDisabilitas!).toString());
        selectedDisabilityLabelsAnak.add(value.namaDisabilitas!);
        if (disabilities.contains(value.namaDisabilitas!)) {
          int index = disabilities.indexOf(value.namaDisabilitas!);
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
                  TextFieldWidget(
                    controller: nikController,
                    hintText: 'Masukan NIK',
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    validators: [
                      (value) => Validator.consistOf(
                          value, 16, "NIK Anak harus terdiri atas 16 digit"),
                      (value) => Validator.required(
                          value, ),
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
                  TextFieldWidget(
                    controller: namaController,
                    hintText: 'Nama',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    isPasswordField: false,
                    validators: [
                      (value) =>
                          Validator.required(value, ),
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
                  TextFieldWidget(
                    controller: anakKeController,
                    hintText: 'Anak Ke',
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    isPasswordField: false,
                    validators: [
                      (value) => Validator.required(
                          value, ),
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
                            TextFieldWidget(
                              controller: tempatLahirController,
                              hintText: 'Tempat Lahir',
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              isPasswordField: false,
                              validators: [
                                (value) => Validator.required(
                                    value, ),
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
                              controller: tanggalLahirController,
                              hintText: 'Tanggal Lahir',
                              selectDate: () {
                                _selectDate(context);
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
                            MeasurementWidget(
                              title: 'Tinggi Lahir',
                              hintText: 'contoh: 38.5',
                              unit: 'cm',
                              controller: heightController,
                              validator: [
                                (value) => Validator.required(
                                    value, ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Lengan',
                              hintText: 'contoh: 3.5',
                              unit: 'cm',
                              controller: lingkarLenganController,
                              validator: [
                                (value) => Validator.required(
                                    value, ),
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
                            MeasurementWidget(
                              title: 'Berat Lahir',
                              hintText: 'contoh: 9.5',
                              unit: 'kg',
                              controller: weightController,
                              validator: [
                                (value) => Validator.required(
                                    value, ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),
                            MeasurementWidget(
                              title: 'Lingkar Kepala',
                              hintText: 'contoh: 6.5',
                              unit: 'cm',
                              controller: lingkarKepalaController,
                              validator: [
                                (value) => Validator.required(
                                    value, ),
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
                  DropdownWidget(
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
                  DropdownWidget(
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
                    },
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
                  DropdownWidget(
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
                  DropdownWidget(
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
                      }
                    },
                    builder: (context, state) {
                      return ButtonPrimary(
                        color: bluePrimaryMain,
                        mainButtonMessage: 'Simpan',
                        mainButton: () {
                          if (_formKey.currentState!.validate()) {
                            updateAnakBloc.add(UpdateAnak(
                                id: widget.getDetailAnakResponse.data!.id!,
                                updateAnakModel: UpdateAnakModel(
                                    nik: nikController.text,
                                    namaAnak: namaController.text,
                                    anakKe: int.parse(anakKeController.text),
                                    tempatLahir: tempatLahirController.text,
                                    tanggalLahir: tanggalLahirController.text,
                                    jenisKelamin: selectedGender!,
                                    beratBadanLahir:
                                        double.parse(weightController.text),
                                    tinggiBadanLahir:
                                        double.parse(heightController.text),
                                    lingkarKepalaLahir: double.parse(
                                        lingkarKepalaController.text),
                                    lingkarLenganAtasLahir: double.parse(
                                        lingkarLenganController.text),
                                    caraLahir: selectedCaraLahir!,
                                    statusKelahiran: selectedStatusKelahiran!,
                                    statusOrangTua: selectedStatusOrangTuaAnak!,
                                    disabilitasAnak:
                                        selectedDisabilityLabelsAnak)));
                          } else {
                            logger.d('form tidak valid');
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
