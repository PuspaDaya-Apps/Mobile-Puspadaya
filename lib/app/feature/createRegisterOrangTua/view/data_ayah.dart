import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/model/post_orang_tua_body.dart'
    as PostOrangTuaBody;
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/outline_button_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/app/feature/alamat/model/get_provinsi_response.dart'
    as ProvinsiModel;
import 'package:puspadaya/app/feature/alamat/model/get_kabupaten_response.dart'
    as KabupatenModel;
import 'package:puspadaya/app/feature/alamat/model/get_kecamatan_response.dart'
    as KecamatanModel;
import 'package:puspadaya/app/feature/alamat/model/get_desa_kelurahan_response.dart'
    as DesaKelurahanModel;
import 'package:puspadaya/app/feature/alamat/model/get_dusun_response.dart'
    as DusunModel;
import 'package:puspadaya/utils/shared_preferences_utils/shared_preferences_utils.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../alamat/bloc/alamat_bloc.dart';

class DataAyah extends StatefulWidget {
  String? selectedProvinsiAyah;
  String? selectedKabupatenAyah;
  String? selectedKecamatanAyah;
  String? selectedDesaAyah;
  String? selectedDusunAyahId;
  String? selectedGolDarahAyah;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  final List<ProvinsiModel.Datum> selectProvinsi;
  final List<KabupatenModel.Datum> selectKabupaten;
  final List<KecamatanModel.Datum> selectKecamatan;
  final List<DesaKelurahanModel.Datum> selectDesaKelurahan;
  final List<DusunModel.Datum> selectDusun;

  final List<String> selectGolDarah;
  final List<String> disabilities;
  final VoidCallback onNext;

  DataAyah({
    super.key,
    required this.onNext,
    required this.selectGolDarah,
    required this.disabilities,
    required this.selectProvinsi,
    required this.selectKabupaten,
    required this.selectKecamatan,
    required this.selectDesaKelurahan,
    required this.selectDusun,
  });

  @override
  State<DataAyah> createState() => _DataAyahState();
}

class _DataAyahState extends State<DataAyah> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController kkAyahController = TextEditingController();
  final TextEditingController nikAyahController = TextEditingController();
  final TextEditingController namaAyahController = TextEditingController();
  final TextEditingController tempatLahirAyahController =
      TextEditingController();
  final TextEditingController tanggalLahirAyahController =
      TextEditingController();
  final TextEditingController alamatAyahController = TextEditingController();
  final TextEditingController teleponAyahController = TextEditingController();
  final TextEditingController rTAyahController = TextEditingController();
  final TextEditingController rWAyahController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //! ketika memilih kabupaten pastikan ada provinsi,
    logger.d(
        'Provinsi data in DataAyah: ${widget.selectProvinsi.map((provinsi) => provinsi.namaProvinsi).toSet() // Menghilangkan duplikasi
            .toList()}');
    widget.selectedDisabilitiesAyah =
        List<bool>.from(List.filled(widget.disabilities.length, false));

    _loadDataFromSharedPreferences();
  }

  Future<void> _loadDataFromSharedPreferences() async {
    String? jsonData = await SharedPrefUtils().getRegisterOrangTuaAyah();
    if (jsonData != null) {
      // Parse the JSON data into a DataAyahModel instance
      PostOrangTuaBody.Ayah dataAyah =
          PostOrangTuaBody.Ayah.fromJson(jsonDecode(jsonData));

      // Set the values of the TextEditingControllers
      kkAyahController.text = dataAyah.nomorKartuKeluarga;
      nikAyahController.text = dataAyah.nik;
      namaAyahController.text = dataAyah.namaAyah;
      tempatLahirAyahController.text = dataAyah.tempatLahir;
      tanggalLahirAyahController.text =
          dataAyah.tanggalLahir; // Format to YYYY-MM-DD
      alamatAyahController.text = dataAyah.alamat;
      teleponAyahController.text = dataAyah.nomorTelepon;
      rTAyahController.text = dataAyah.rt;
      rWAyahController.text = dataAyah.rw;

      // Set selected values based on the parsed data
      widget.selectedDusunAyahId = dataAyah.dusunId;
      widget.selectedGolDarahAyah = dataAyah.golDarah;
      widget.selectedDisabilityLabelsAyah = dataAyah.jenisDisabilitas
          .map((disabilitas) => disabilitas.namaDisabilitas)
          .toList();
    }
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

    if (pickedDate != null) {
      setState(() {
        tanggalLahirAyahController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formkey,
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
                controller: kkAyahController,
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
                controller: nikAyahController,
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
                controller: namaAyahController,
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
                          controller: tempatLahirAyahController,
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
                          controller: tanggalLahirAyahController,
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
                  // provinsi
                  Expanded(
                    child: DropdownWidget(
                      items: widget.selectProvinsi
                          .map((provinsi) => provinsi.namaProvinsi)
                          .toSet() // Menghilangkan duplikasi
                          .toList(),
                      hint: 'Provinsi',
                      value: widget.selectedProvinsiAyah,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedProvinsiAyah = value;
                        });
                      },
                    ),
                  ),
                  // kabupaten
                  Expanded(
                    child: DropdownWidget(
                      items: widget.selectKabupaten
                          .map((kabupaten) => kabupaten.namaKabupatenKota)
                          .toList(),
                      hint: 'Kabupaten',
                      value: widget.selectedKabupatenAyah,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedKabupatenAyah = value;
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
                  // kecamatan
                  Expanded(
                    child: DropdownWidget(
                      items: widget.selectKecamatan
                          .map((kecamatan) => kecamatan.namaKecamatan)
                          .toList(),
                      hint: 'Kecamatan',
                      value: widget.selectedKecamatanAyah,
                      onChanged: (value) {
                        setState(() {
                          logger.d('selected Kecamatan id ${value}');
                          // context
                          //     .read<AlamatBloc>()
                          //     .add(SelectKabupaten(selectedProvinsiId));
                          widget.selectedKecamatanAyah = value;
                        });
                      },
                    ),
                  ),
                  // desa
                  Expanded(
                    child: DropdownWidget(
                      items: widget.selectDesaKelurahan
                          .map((desa) => desa.namaDesaKelurahan)
                          .toList(),
                      hint: 'Desa',
                      value: widget.selectedDesaAyah,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedDesaAyah = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              DropdownWidget(
                items: widget.selectDusun
                    .map((dusun) => dusun.namaDusun) // Menampilkan Nama Dusun
                    .toList(),
                hint: 'Dusun',
                value: widget.selectedDusunAyahId != null
                    ? widget.selectDusun
                        .firstWhere(
                          (dusun) => dusun.id == widget.selectedDusunAyahId,
                          orElse: () => widget
                              .selectDusun.first, // Handle jika tidak ditemukan
                        )
                        .namaDusun
                    : null, // Menampilkan nama sesuai ID yang dipilih
                onChanged: (value) {
                  setState(() {
                    final selectedDusun = widget.selectDusun.firstWhere(
                      (dusun) => dusun.namaDusun == value,
                      orElse: () => widget
                          .selectDusun.first, // Default jika tidak ditemukan
                    );

                    widget.selectedDusunAyahId =
                        selectedDusun.id; // Simpan ID, bukan nama
                    logger
                        .d('Selected Dusun ID: ${widget.selectedDusunAyahId}');
                  });
                },
              ),

              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: rTAyahController,
                      hintText: 'RT',
                      isPasswordField: false,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      validators: [],
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      controller: rWAyahController,
                      hintText: 'RW',
                      isPasswordField: false,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      validators: [],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              TextFieldWidget(
                controller: alamatAyahController,
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
                controller: teleponAyahController,
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
                mainButton: () async {
                  if (formkey.currentState!.validate()) {
                    print('kk ${kkAyahController.text}');
                    print('nik ${nikAyahController.text}');
                    print('nama ${namaAyahController.text}');
                    print('tempat ${tempatLahirAyahController.text}');
                    print('tanggal ${tanggalLahirAyahController.text}');
                    print('telepon ${teleponAyahController.text}');
                    print('rt ${rTAyahController.text}');
                    print('rw ${rWAyahController.text}');
                    print('dusun ${widget.selectedDusunAyahId}');
                    print('alamat ${alamatAyahController.text}');
                    print('gol ${widget.selectedGolDarahAyah}');
                    print('disabilitas ${widget.selectedDisabilityLabelsAyah}');

                    // Create an instance of DataAyahModel
                    PostOrangTuaBody.Ayah dataAyah = PostOrangTuaBody.Ayah(
                      nomorKartuKeluarga: kkAyahController.text,
                      nik: nikAyahController.text,
                      namaAyah: namaAyahController.text,
                      tempatLahir: tempatLahirAyahController.text,
                      tanggalLahir: tanggalLahirAyahController
                          .text, // Ensure this is a DateTime
                      nomorTelepon: teleponAyahController.text,
                      rt: rTAyahController.text,
                      rw: rWAyahController.text,
                      dusunId: widget
                          .selectedDusunAyahId!, // Assuming this holds the selected dusun ID
                      alamat: alamatAyahController.text,
                      golDarah: widget.selectedGolDarahAyah!,
                      jenisDisabilitas: widget.selectedDisabilityLabelsAyah
                          .map((label) => PostOrangTuaBody.JenisDisabilitas(
                              namaDisabilitas: label))
                          .toList(),
                      // jenisDisabilitas: widget.selectedDisabilityLabelsAyah
                      //     .map((label) =>
                      //         JenisDisabilitas(namaDisabilitas: label))
                      //     .toList(),
                    );

                    // Check if data already exists in SharedPreferences
                    String? existingData =
                        await SharedPrefUtils().getRegisterOrangTuaAyah();
                    if (existingData != null) {
                      // If data exists, remove it
                      await SharedPrefUtils().removeRegisterOrangTuaAyah();
                      logger.d('Existing data removed: $existingData');
                    }

                    // Store the new data in SharedPreferences
                    String jsonData =
                        jsonEncode(dataAyah.toJson()); // Convert to JSON string
                    await SharedPrefUtils().storedRegisterOrangTuaAyah(
                        jsonData); // Save to SharedPreferences

                    // Optionally retrieve the data to verify it was saved correctly
                    String? retrievedData =
                        await SharedPrefUtils().getRegisterOrangTuaAyah();
                    logger.d(
                        'Retrieved Data: $retrievedData'); // Log the retrieved data
                    widget.onNext();
                  } else {
                    print("Form tidak valid");
                  }
                },
              ),
            ],
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
