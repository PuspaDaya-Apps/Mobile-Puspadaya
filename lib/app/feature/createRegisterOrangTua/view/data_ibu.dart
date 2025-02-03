import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/registerOrangTua/bloc/register_orang_tua_bloc.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/logger/logger.dart';
import '../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
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
import 'package:puspadaya/app/feature/createRegisterOrangTua/model/post_orang_tua_body.dart'
    as PostOrangTuaBody;

import '../bloc/create_register_orang_tua_bloc.dart';

class DataIbu extends StatelessWidget {
  String? selectedProvinsiIbu;
  String? selectedKabupatenIbu;
  String? selectedKecamatanIbu;
  String? selectedDesaIbu;
  String? selectedDusunIdIbu;
  String? selectedJenisKBIbu;
  String? selectedGolDarahIbu;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  final List<ProvinsiModel.Datum> selectProvinsi;
  final List<KabupatenModel.Datum> selectKabupaten;
  final List<KecamatanModel.Datum> selectKecamatan;
  final List<DesaKelurahanModel.Datum> selectDesaKelurahan;
  final List<DusunModel.Datum> selectDusun;

  final List<String> selectGolDarah;
  final List<String> disabilities;
  final VoidCallback navigateBack;
  DataIbu(
      {super.key,
      required this.selectProvinsi,
      required this.selectKabupaten,
      required this.selectKecamatan,
      required this.selectDesaKelurahan,
      required this.selectDusun,
      required this.selectGolDarah,
      required this.disabilities,
      required this.navigateBack});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CreateRegisterOrangTuaBloc();
      },
      child: DataIbuView(
        navigateBack: navigateBack,
        selectGolDarah: selectGolDarah,
        disabilities: disabilities,
        selectProvinsi: selectProvinsi,
        selectKabupaten: selectKabupaten,
        selectKecamatan: selectKecamatan,
        selectDesaKelurahan: selectDesaKelurahan,
        selectDusun: selectDusun,
      ),
    );
  }
}

class DataIbuView extends StatefulWidget {
  String? selectedProvinsiIbu;
  String? selectedKabupatenIbu;
  String? selectedKecamatanIbu;
  String? selectedDesaIbu;
  String? selectedDusunIdIbu;
  String? selectedJenisKBIbu;
  String? selectedGolDarahIbu;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  final List<ProvinsiModel.Datum> selectProvinsi;
  final List<KabupatenModel.Datum> selectKabupaten;
  final List<KecamatanModel.Datum> selectKecamatan;
  final List<DesaKelurahanModel.Datum> selectDesaKelurahan;
  final List<DusunModel.Datum> selectDusun;

  final List<String> selectGolDarah;
  final List<String> disabilities;
  final VoidCallback navigateBack;

  DataIbuView({
    super.key,
    required this.navigateBack,
    required this.selectGolDarah,
    required this.disabilities,
    required this.selectProvinsi,
    required this.selectKabupaten,
    required this.selectKecamatan,
    required this.selectDesaKelurahan,
    required this.selectDusun,
  });

  @override
  State<DataIbuView> createState() => _DataIbuViewState();
}

class _DataIbuViewState extends State<DataIbuView> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController kkIbuController = TextEditingController();
  final TextEditingController nikIbuController = TextEditingController();
  final TextEditingController namaIbuController = TextEditingController();
  final TextEditingController tempatLahirIbuController =
      TextEditingController();
  final TextEditingController tanggalLahirIbuController =
      TextEditingController();
  final TextEditingController alamatIbuController = TextEditingController();
  final TextEditingController teleponIbuController = TextEditingController();
  final TextEditingController rTIbuController = TextEditingController();
  final TextEditingController rWIbuController = TextEditingController();
  final TextEditingController tanggalKelahiranAnakSebelumnyaIbuController =
      TextEditingController();
  final TextEditingController jumlahAnakIbuController = TextEditingController();
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

  final List<String> selectGolDarah = [
    'A',
    'B',
    'AB',
    'O',
    '-',
  ];

  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedDesa;
  String? selectedDusun;
  String? selectedGolDarahIbu;
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
    _loadDataFromSharedPreferences();
  }

  Future<void> _loadDataFromSharedPreferences() async {
    String? existingData = await SharedPrefUtils().getRegisterOrangTuaIbu();
    if (existingData != null) {
      Map<String, dynamic> dataMap = jsonDecode(existingData);
      kkIbuController.text = dataMap['nomorKartuKeluarga'] ?? '';
      nikIbuController.text = dataMap['nik'] ?? '';
      namaIbuController.text = dataMap['namaIbu'] ?? '';
      tempatLahirIbuController.text = dataMap['tempatLahir'] ?? '';
      tanggalLahirIbuController.text = dataMap['tanggalLahir'] ?? '';
      alamatIbuController.text = dataMap['alamat'] ?? '';
      teleponIbuController.text = dataMap['nomorTelepon'] ?? '';
      rTIbuController.text = dataMap['rt'] ?? '';
      rWIbuController.text = dataMap['rw'] ?? '';
      tanggalKelahiranAnakSebelumnyaIbuController.text =
          dataMap['tanggalMelahirkanSebelumnya'] ?? '';
      jumlahAnakIbuController.text = dataMap['jumlahAnak']?.toString() ?? '';
      // Load other fields as necessary
    }
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
        tanggalLahirIbuController.text =
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
        tanggalKelahiranAnakSebelumnyaIbuController.text =
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
    return BlocListener<CreateRegisterOrangTuaBloc,
        CreateRegisterOrangTuaState>(
      listener: (context, state) {
        if (state is CreateRegisterOrangTuaSuccesState) {
          Navigator.pop(context);
        }
      },
      child: Container(
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
                  controller: kkIbuController,
                  hintText: 'Masukan Nomor Kartu Keluarga',
                  isPasswordField: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  validators: [
                    (value) => Validator.required(
                        value, "Kartu Keluarga Ibu tidak boleh kosong"),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'NIK',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: nikIbuController,
                  hintText: 'Masukan NIK',
                  isPasswordField: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  validators: [
                    (value) =>
                        Validator.required(value, "NIK Ibu tidak boleh kosong"),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Nama',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: namaIbuController,
                  hintText: 'Masukan Nama',
                  isPasswordField: false,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  validators: [
                    (value) => Validator.required(
                        value, "Nama Ibu tidak boleh kosong"),
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
                            controller: tempatLahirIbuController,
                            hintText: 'Tempat Lahir',
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            isPasswordField: false,
                            validators: [
                              (value) => Validator.required(
                                  value, "Nama Ibu tidak boleh kosong"),
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
                            controller: tanggalLahirIbuController,
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
                            .toList(),
                        hint: 'Provinsi',
                        value: widget.selectedProvinsiIbu,
                        onChanged: (value) {
                          setState(() {
                            // final selectedProvinsiId = widget.selectProvinsi
                            //     .firstWhere(
                            //         (provinsi) => provinsi.namaProvinsi == value)
                            //     .id;
                            logger.d('selected provinsi id ${value}');
                            // context
                            //     .read<AlamatBloc>()
                            //     .add(SelectKabupaten(selectedProvinsiId));
                            widget.selectedProvinsiIbu = value;
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
                        value: widget.selectedKabupatenIbu,
                        onChanged: (value) {
                          setState(() {
                            widget.selectedKabupatenIbu = value;
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
                        value: widget.selectedKecamatanIbu,
                        onChanged: (value) {
                          setState(() {
                            logger.d('selected Kecamatan id ${value}');
                            // context
                            //     .read<AlamatBloc>()
                            //     .add(SelectKabupaten(selectedProvinsiId));
                            widget.selectedKecamatanIbu = value;
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
                        value: widget.selectedDesaIbu,
                        onChanged: (value) {
                          setState(() {
                            widget.selectedDesaIbu = value;
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
                  value: widget.selectedDusunIdIbu != null
                      ? widget.selectDusun
                          .firstWhere(
                            (dusun) => dusun.id == widget.selectedDusunIdIbu,
                            orElse: () => widget.selectDusun
                                .first, // Handle jika tidak ditemukan
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

                      widget.selectedDusunIdIbu =
                          selectedDusun.id; // Simpan ID, bukan nama
                      logger
                          .d('Selected Dusun ID: ${widget.selectedDusunIdIbu}');
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
                        controller: rTIbuController,
                        hintText: 'RT',
                        isPasswordField: false,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        validators: [],
                      ),
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        controller: rWIbuController,
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
                  controller: alamatIbuController,
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
                  controller: teleponIbuController,
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
                            items: widget.selectGolDarah,
                            hint: 'Golongan Darah',
                            value: selectedGolDarahIbu,
                            onChanged: (value) {
                              setState(() {
                                widget.selectedGolDarahIbu =
                                    value; // Update the selected value
                                logger.d(
                                    'Selected Golongan Darah: ${widget.selectedGolDarahIbu}');
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
                  controller: tanggalKelahiranAnakSebelumnyaIbuController,
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
                  controller: jumlahAnakIbuController,
                  hintText: 'Jumlah Anak',
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  isPasswordField: false,
                  validators: [
                    (value) => Validator.required(
                        value, "Jumlah Anak tidak boleh kosong"),
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
                  mainButton: () async {
                    // Validate the form
                    if (formkey.currentState!.validate()) {
                      // Print values for debugging
                      print('kk ibu ${kkIbuController.text}');
                      print('nik ibu ${nikIbuController.text}');
                      print('nama ibu ${namaIbuController.text}');
                      print('tempat ibu ${tempatLahirIbuController.text}');
                      print('tanggal ibu ${tanggalLahirIbuController.text}');
                      print('telepon ibu ${teleponIbuController.text}');
                      print('rt ibu ${rTIbuController.text}');
                      print('rw ibu ${rWIbuController.text}');
                      print('dusun ibu ${widget.selectedDusunIdIbu}');
                      print('alamat ibu ${alamatIbuController.text}');
                      print('gol ibu ${widget.selectedGolDarahIbu}');
                      print(
                          'disabilitas ${widget.selectedDisabilityLabelsIbu}');

                      // Create an instance of PostOrangTuaBody.Ibu
                      PostOrangTuaBody.Ibu dataIbu = PostOrangTuaBody.Ibu(
                        alamat: alamatIbuController.text,
                        dusunId: widget
                            .selectedDusunIdIbu!, // Ensure this is not null
                        golDarah: widget
                            .selectedGolDarahIbu!, // Ensure this is not null
                        jenisDisabilitas: widget.selectedDisabilityLabelsIbu
                            .map((label) => PostOrangTuaBody.JenisDisabilitas(
                                namaDisabilitas: label))
                            .toList(),
                        jenisKb: selectedJenisKB!, // Ensure this is not null
                        jumlahAnak: int.parse(jumlahAnakIbuController.text),
                        namaIbu: namaIbuController.text,
                        nik: nikIbuController.text,
                        nomorTelepon: teleponIbuController.text,
                        nomorKartuKeluarga: kkIbuController.text,
                        rt: rTIbuController.text,
                        rw: rWIbuController.text,
                        tanggalLahir: tanggalLahirIbuController
                            .text, // Ensure this is a DateTime
                        tanggalMelahirkanSebelumnya:
                            tanggalKelahiranAnakSebelumnyaIbuController
                                .text, // Ensure this is a DateTime
                        tempatLahir: tempatLahirIbuController.text,
                      );

                      // Check if data already exists in SharedPreferences
                      String? existingData =
                          await SharedPrefUtils().getRegisterOrangTuaIbu();
                      if (existingData != null) {
                        // If data exists, remove it
                        await SharedPrefUtils().removeRegisterOrangTuaIbu();
                        logger.d('Existing data removed: $existingData');
                      }

                      // Store the new data in SharedPreferences
                      String jsonData = jsonEncode(
                          dataIbu.toJson()); // Convert to JSON string
                      await SharedPrefUtils().storedRegisterOrangTuaIbu(
                          jsonData); // Save to SharedPreferences

                      // Optionally retrieve the data to verify it was saved correctly
                      String? retrievedData =
                          await SharedPrefUtils().getRegisterOrangTuaIbu();
                      logger.d(
                          'Retrieved Data: $retrievedData'); // Log the retrieved data
                      context
                          .read<CreateRegisterOrangTuaBloc>()
                          .add(SendRegisterOrangTua());
                    } else {
                      print("Form tidak valid");
                    }
                  },
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
                  widget.onAddCustomDisability(
                    otherDisabilityController.text,
                  );
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
