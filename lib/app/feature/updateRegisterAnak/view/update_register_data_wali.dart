import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';

class UpdateRegisterDataWali extends StatelessWidget {
  const UpdateRegisterDataWali({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdateRegisterDataWaliView();
  }
}

class UpdateRegisterDataWaliView extends StatefulWidget {
  const UpdateRegisterDataWaliView({super.key});

  @override
  State<UpdateRegisterDataWaliView> createState() =>
      _UpdateRegisterDataWaliViewState();
}

class _UpdateRegisterDataWaliViewState
    extends State<UpdateRegisterDataWaliView> {
  final _formKey = GlobalKey<FormState>();
  final List<String> selectKabupaten = [
    'Banyuwangi',
    'Maluku',
  ];

  final List<String> selectKecamatan = [
    'Kecamatan 1',
    'Kecamatan 2',
  ];

  final List<String> selectDesa = [
    'Desa 1',
    'Desa 2',
  ];

  final List<String> selectDusun = [
    'Dusun 1',
    'Dusun 2',
  ];
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAnak = [];
  List<String> selectedDisabilityLabelsAnak = [];

  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _tempatLahirController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _rTWaliController = TextEditingController();
  TextEditingController _rWWaliController = TextEditingController();
  TextEditingController _teleponWaliController = TextEditingController();
  TextEditingController _alamatWaliController = TextEditingController();

  String? selectedGender;
  String? selectedStatusHubunganDenganAnak;
  String? selectedKabupatenDataWali;
  String? selectedKecamatanDataWali;
  String? selectedDesaDataWali;
  String? selectedDusunDataWali;
  String? selectedGolDarahWali;

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
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(2000); // Set initial date to the year 1945
    DateTime firstDate = DateTime(1975); // Set the first date to the year 1945
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
      _tanggalLahirController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Perbarui Data Wali',
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
                    'Status Hubungan Dengan Anak',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget(
                    items: selectStatusHubunganDenganAnak,
                    hint: 'Status Hubungan Dengan Anak',
                    value: selectedStatusHubunganDenganAnak,
                    onChanged: (value) {
                      setState(() {
                        selectedStatusHubunganDenganAnak = value;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Nomor Kartu keluarga',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  TextFieldWidget(
                      controller: _nikController,
                      hintText: 'Nomor Kartu keluarga',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      isPasswordField: false),
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
                  TextFieldWidget(
                      controller: _nikController,
                      hintText: 'NIK',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      isPasswordField: false),
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
                      controller: _namaController,
                      hintText: 'Nama',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      isPasswordField: false),
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
                              controller: _tempatLahirController,
                              hintText: 'Tempat Lahir',
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              isPasswordField: false,
                              validators: [
                                (value) => Validator.required(
                                    value, "Nama ayah tidak boleh kosong"),
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
                              controller: _tanggalLahirController,
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
                  const Text(
                    'Alamat',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownWidget(
                          items: selectKabupaten,
                          hint: 'Kabupaten',
                          value: selectedKabupatenDataWali,
                          onChanged: (value) {
                            setState(() {
                              selectedKabupatenDataWali = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: DropdownWidget(
                          items: selectKecamatan,
                          hint: 'Kecamatan',
                          value: selectedKecamatanDataWali,
                          onChanged: (value) {
                            setState(() {
                              selectedKecamatanDataWali = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DropdownWidget(
                          items: selectDesa,
                          hint: 'Desa',
                          value: selectedDesaDataWali,
                          onChanged: (value) {
                            setState(() {
                              selectedDesaDataWali = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: DropdownWidget(
                          items: selectDusun,
                          hint: 'Dusun',
                          value: selectedDusunDataWali,
                          onChanged: (value) {
                            setState(() {
                              selectedDusunDataWali = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: _rTWaliController,
                          hintText: 'RT',
                          isPasswordField: false,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          validators: [],
                        ),
                      ),
                      Expanded(
                        child: TextFieldWidget(
                          controller: _rWWaliController,
                          hintText: 'RW',
                          isPasswordField: false,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          validators: [],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _alamatWaliController,
                    hintText: 'Masukan alamat lengkap',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    isPasswordField: false,
                    validators: [
                      (value) => Validator.required(
                          value, "Alamat tidak boleh kosong"),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Nomor Telepon (WA aktif)',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _teleponWaliController,
                    hintText: 'Masukan nomor telepon',
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    isPasswordField: false,
                    validators: [
                      (value) => Validator.required(
                          value, "Nomor Telepon tidak boleh kosong"),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Golongan Darah',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  DropdownWidget(
                    items: selectGolDarah,
                    hint: 'Golongan Darah',
                    value: selectedGolDarahWali,
                    onChanged: (value) {
                      setState(() {
                        selectedGolDarahWali = value;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Disabilitas',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
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
                          icon: Icon(Icons.delete, color: Colors.red),
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
                  ButtonPrimary(
                    color: bluePrimaryMain,
                    mainButtonMessage: 'Simpan',
                    mainButton: () {
                      // if (_formKey.currentState!.validate()) {
                      //   print('Nama: ${_nameController.text}');
                      //   print('NIK: ${_nikController.text}');
                      //   print('Usia: ${_ageController.text}');
                      //   print('Tempat Pengukuran: $selectedPosyandu');
                      //   print('Posisi Pengukuran: $selectedPosition');
                      //   print(
                      //       'Tinggi Badan: ${_heightController.text} cm');
                      //   print(
                      //       'Lingkar Lengan Atas: ${_upperArmCircumferenceController.text} cm');
                      //   print(
                      //       'Berat Badan: ${_weightController.text} kg');
                      //   print(
                      //       'Lingkar Kepala: ${_headCircumferenceController.text} cm');
                      //   print(
                      //       'Asi Eksklusif: ${asiEksklusifValue == 1 ? 'Ya' : 'Tidak'}');
                      //   print(
                      //       'MPASI: ${mpasiValue == 1 ? 'Ya' : 'Tidak'}');
                      //   print('Catatan: ${_catatanController.text}');
                      //   print('Keluhan: ${_keluhanController.text}');
                      // }
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
