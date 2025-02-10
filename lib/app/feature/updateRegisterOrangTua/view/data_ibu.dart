import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/validator/validator.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';

class DataIbu extends StatefulWidget {
  final TextEditingController kkIbuController;
  final TextEditingController nikIbuController;
  final TextEditingController namaIbuController;
  final TextEditingController tempatLahirIbuController;
  final TextEditingController tanggalLahirIbuController;
  final TextEditingController alamatIbuController;
  final TextEditingController teleponIbuController;
  final TextEditingController rTIbuController;
  final TextEditingController rWIbuController;
  final TextEditingController tanggalKelahiranAnakSebelumnyaIbuController;
  final TextEditingController jumlahAnakIbuController;
  String? selectedKabupatenIbu;
  String? selectedKecamatanIbu;
  String? selectedDesaIbu;
  String? selectedDusunIbu;
  String? selectedJenisKBIbu;
  String? selectedGolDarahIbu;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  final List<String> selectKabupaten;

  final List<String> selectKecamatan;

  final List<String> selectDesa;

  final List<String> selectDusun;

  final List<String> selectGolDarah;
  final List<String> disabilities;
  final VoidCallback onSubmit;
  final VoidCallback navigateBack;

  DataIbu({
    super.key,
    required this.onSubmit,
    required this.navigateBack,
    required this.kkIbuController,
    required this.nikIbuController,
    required this.namaIbuController,
    required this.tempatLahirIbuController,
    required this.tanggalLahirIbuController,
    required this.alamatIbuController,
    required this.teleponIbuController,
    required this.rTIbuController,
    required this.rWIbuController,
    required this.tanggalKelahiranAnakSebelumnyaIbuController,
    required this.jumlahAnakIbuController,
    required this.selectKabupaten,
    required this.selectKecamatan,
    required this.selectDesa,
    required this.selectDusun,
    required this.selectGolDarah,
    required this.disabilities,
  });

  @override
  State<DataIbu> createState() => _DataIbuState();
}

class _DataIbuState extends State<DataIbu> {
  final List<String> selectKabupaten = [
    'Banyuwangi',
    'Maluku',
  ];

  final List<String> selectKecamatan = [
    'Kecamatan 1',
    'Kecamatan 2',
  ];

  final List<String> selectDesa = [
    'Banyuwangi',
    'Maluku',
  ];

  final List<String> selectDusun = [
    'Kecamatan 1',
    'Kecamatan 2',
  ];

  final List<String> selectJenisKB = [
    'Pil',
    'IUD',
    'Suntik',
    'Implant',
    'Lainnya'
  ];

  List<String> selectGolDarah = [
    // A+, A-, B+, B-, AB+, AB-, O+, O-, Tidak Tahu, -
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
    'Tidak Tahu',
    '-',
  ];

  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedDesa;
  String? selectedDusun;
  String? selectedGolDarah;
  String? selectedJenisKB;

  final List<String> disabilities = [
    'Tunanetra',
    'Tunarungu',
    'Tunawicara',
    'Tunadaksa',
    'Tunagharita',
    "Autisme",
  ];

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilities = [];
  List<String> selectedDisabilityLabels = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi status checkbox dengan false
    selectedDisabilities =
        List<bool>.from(List.filled(disabilities.length, false));
  }

  void _toggleDisability(int index) {
    setState(() {
      selectedDisabilities[index] = !selectedDisabilities[index];
      if (selectedDisabilities[index]) {
        selectedDisabilityLabels.add(disabilities[index]);
      } else {
        selectedDisabilityLabels.remove(disabilities[index]);
      }
    });
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

    if (pickedDate != null) {
      setState(() {
        widget.tanggalLahirIbuController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectDateKelahiranSebelumnua(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = now; // Set initial date to the year 1945
    DateTime firstDate = DateTime(2000); // Set the first date to the year 1945
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

    if (pickedDate != null) {
      setState(() {
        widget.tanggalKelahiranAnakSebelumnyaIbuController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _removeDisability(String label) {
    setState(() {
      selectedDisabilityLabels.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilities[index] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Nomor Kartu Keluarga',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget(
              controller: widget.kkIbuController,
              hintText: 'Masukan Nomor Kartu Keluarga',
              isPasswordField: false,
              keyboardType: TextInputType.number,
              obscureText: false,
              validators: [
                (value) => Validator.required(
                    value, "Kartu Keluarga ayah tidak boleh kosong"),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'NIK',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget(
              controller: widget.nikIbuController,
              hintText: 'Masukan NIK',
              isPasswordField: false,
              keyboardType: TextInputType.number,
              obscureText: false,
              validators: [
                (value) =>
                    Validator.required(value, "NIK ayah tidak boleh kosong"),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Nama',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget(
              controller: widget.namaIbuController,
              hintText: 'Masukan Nama',
              isPasswordField: false,
              keyboardType: TextInputType.number,
              obscureText: false,
              validators: [
                (value) =>
                    Validator.required(value, "Nama ayah tidak boleh kosong"),
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
                        controller: widget.tempatLahirIbuController,
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
                        controller: widget.tanggalLahirIbuController,
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
                    items: widget.selectKabupaten,
                    hint: 'Kabupaten',
                    value: widget.selectedKabupatenIbu,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedKabupatenIbu = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownWidget(
                    items: widget.selectKecamatan,
                    hint: 'Kecamatan',
                    value: widget.selectedKecamatanIbu,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedKecamatanIbu = value;
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
                    items: widget.selectDesa,
                    hint: 'Desa',
                    value: widget.selectedDesaIbu,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedDesaIbu = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownWidget(
                    items: widget.selectDusun,
                    hint: 'Dusun',
                    value: widget.selectedDusunIbu,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedDusunIbu = value;
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
                    controller: widget.rTIbuController,
                    hintText: 'RT',
                    isPasswordField: false,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validators: [],
                  ),
                ),
                Expanded(
                  child: TextFieldWidget(
                    controller: widget.rWIbuController,
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
              controller: widget.alamatIbuController,
              hintText: 'Masukan alamat lengkap',
              keyboardType: TextInputType.text,
              obscureText: false,
              isPasswordField: false,
              validators: [
                (value) =>
                    Validator.required(value, "Alamat tidak boleh kosong"),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Nomor Telepon (WA aktif)',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget(
              controller: widget.teleponIbuController,
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
                        'Jenis KB',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DropdownWidget(
                        items: selectJenisKB,
                        hint: 'Jenis KB',
                        value: selectedJenisKB,
                        onChanged: (value) {
                          setState(() {
                            selectedJenisKB = value;
                          });
                        },
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
                        'Golongan Darah',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DropdownWidget(
                        items: selectGolDarah,
                        hint: 'Golongan Darah',
                        value: selectedGolDarah,
                        onChanged: (value) {
                          setState(() {
                            selectedGolDarah = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Tanggal lahiran Anak Sebelumnya',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            DateTimePickerWidget(
              isDate: true,
              controller: widget.tanggalKelahiranAnakSebelumnyaIbuController,
              selectDate: () {
                _selectDateKelahiranSebelumnua(context);
              },
              hintText: "Tanggal Lahiran Anak Sebelumnya",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Tanggal harus dipilih";
                }
                return null;
              },
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Jumlah Anak',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget(
              controller: widget.jumlahAnakIbuController,
              hintText: 'Jumlah Anak',
              keyboardType: TextInputType.number,
              obscureText: false,
              isPasswordField: false,
              validators: [
                (value) =>
                    Validator.required(value, "Jumlah Anak tidak boleh kosong"),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Disabilitas',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            // Tampilkan disabilitas yang dipilih
            Column(
              children: selectedDisabilityLabels.map((label) {
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
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            OutlineButton(
              color: Colors.grey,
              mainButtonMessage: 'Tambah Disabilitas',
              mainButton: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogDisabilitas(
                      disabilities: disabilities,
                      selectedDisabilities: selectedDisabilities,
                      onToggleDisability: _toggleDisability,
                      onAddCustomDisability: (String customDisability) {
                        setState(() {
                          disabilities.add(customDisability);
                          selectedDisabilities.add(true);
                          selectedDisabilityLabels.add(customDisability);
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
              mainButton:
                  widget.onSubmit, // Panggil callback saat tombol ditekan
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(20)),
            Center(
              child: GestureDetector(
                onTap: widget.navigateBack,
                child: Text(
                  'Kembali Ke data Ayah',
                  style: AppTextStyles.secoundaryTextMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
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

/**
 * 
 */
