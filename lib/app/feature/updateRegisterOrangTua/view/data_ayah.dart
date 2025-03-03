import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/outline_button_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/validator/validator.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/textField_widget.dart';

class DataAyah extends StatefulWidget {
  final TextEditingController kkAyahController;
  final TextEditingController nikAyahController;
  final TextEditingController namaAyahController;
  final TextEditingController tempatLahirAyahController;
  final TextEditingController tanggalLahirAyahController;
  final TextEditingController alamatAyahController;
  final TextEditingController teleponAyahController;
  final TextEditingController rTAyahController;
  final TextEditingController rWAyahController;
  String? selectedKabupatenAyah;
  String? selectedKecamatanAyah;
  String? selectedDesaAyah;
  String? selectedDusunAyah;
  String? selectedGolDarahAyah;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  final List<String> selectKabupaten;

  final List<String> selectKecamatan;

  final List<String> selectDesa;

  final List<String> selectDusun;

  final List<String> selectGolDarah;
  final List<String> disabilities;
  final VoidCallback onNext;

  DataAyah({
    super.key,
    required this.onNext,
    required this.kkAyahController,
    required this.nikAyahController,
    required this.namaAyahController,
    required this.tempatLahirAyahController,
    required this.tanggalLahirAyahController,
    required this.selectKabupaten,
    required this.selectKecamatan,
    required this.selectDesa,
    required this.selectDusun,
    required this.selectGolDarah,
    required this.disabilities,
    required this.alamatAyahController,
    required this.teleponAyahController,
    required this.rTAyahController,
    required this.rWAyahController,
  });

  @override
  State<DataAyah> createState() => _DataAyahState();
}

class _DataAyahState extends State<DataAyah> {
  @override
  void initState() {
    super.initState();
    // Inisialisasi status checkbox dengan false
    widget.selectedDisabilitiesAyah =
        List<bool>.from(List.filled(widget.disabilities.length, false));
  }

  void _toggleDisability(int index) {
    setState(() {
      widget.selectedDisabilitiesAyah[index] =
          !widget.selectedDisabilitiesAyah[index];
      if (widget.selectedDisabilitiesAyah[index]) {
        widget.selectedDisabilityLabelsAyah.add(widget.disabilities[index]);
      } else {
        widget.selectedDisabilityLabelsAyah.remove(widget.disabilities[index]);
      }
    });
  }

  void _removeDisability(String label) {
    setState(() {
      widget.selectedDisabilityLabelsAyah.remove(label);
      int index = widget.disabilities.indexOf(label);
      if (index != -1) {
        widget.selectedDisabilitiesAyah[index] = false;
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

    setState(() {
      widget.tanggalLahirAyahController.text =
          "${pickedDate?.toLocal()}".split(' ')[0];
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
              controller: widget.kkAyahController,
              hintText: 'Masukan Nomor Kartu Keluarga',
              isPasswordField: false,
              keyboardType: TextInputType.number,
              obscureText: false,
              validators: [
                (value) => Validator.consistOf(
                    value, 16, "Kartu keluarga harus terdiri atas 16 digit"),
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
              controller: widget.nikAyahController,
              hintText: 'Masukan NIK',
              isPasswordField: false,
              keyboardType: TextInputType.number,
              obscureText: false,
              validators: [
                (value) => Validator.consistOf(
                    value, 16, "Nik harus terdiri atas 16 digit"),
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
              controller: widget.namaAyahController,
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
                        controller: widget.tempatLahirAyahController,
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
                        controller: widget.tanggalLahirAyahController,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DropdownWidget(
                    items: widget.selectKabupaten,
                    hint: 'Kabupaten',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kabupaten harus dipilih";
                      }
                      return null;
                    },
                    value: widget.selectedKabupatenAyah,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedKabupatenAyah = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownWidget(
                    items: widget.selectKecamatan,
                    hint: 'Kecamatan',
                    value: widget.selectedKecamatanAyah,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedKecamatanAyah = value;
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
                    value: widget.selectedDesaAyah,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedDesaAyah = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DropdownWidget(
                    items: widget.selectDusun,
                    hint: 'Dusun',
                    value: widget.selectedDusunAyah,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedDusunAyah = value;
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
                    controller: widget.rTAyahController,
                    hintText: 'RT',
                    isPasswordField: false,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    validators: [],
                  ),
                ),
                Expanded(
                  child: TextFieldWidget(
                    controller: widget.rWAyahController,
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
              controller: widget.alamatAyahController,
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
              controller: widget.teleponAyahController,
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
              items: widget.selectGolDarah,
              hint: 'Golongan Darah',
              value: widget.selectedGolDarahAyah,
              onChanged: (value) {
                setState(() {
                  widget.selectedGolDarahAyah = value;
                });
              },
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Disabilitas',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            // Tampilkan disabilitas yang dipilih
            Column(
              children: widget.selectedDisabilityLabelsAyah.map((label) {
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
                      disabilities: widget.disabilities,
                      selectedDisabilities: widget.selectedDisabilitiesAyah,
                      onToggleDisability: _toggleDisability,
                      onAddCustomDisability: (String customDisability) {
                        setState(() {
                          widget.disabilities.add(customDisability);
                          widget.selectedDisabilitiesAyah.add(true);
                          widget.selectedDisabilityLabelsAyah
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
              mainButtonMessage: 'Selanjutnya',
              mainButton: widget.onNext, // Panggil callback saat tombol ditekan
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
