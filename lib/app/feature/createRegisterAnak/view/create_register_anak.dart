import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/registerOrangTua/bloc/register_orang_tua_bloc.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../pengukuranIbuHamil/create/view/create_pengukuran_ibu_hamil.dart';
import '../../registerOrangTua/view/model/orang_tua_item_model.dart';
import '../cubit/search_kk_cubit.dart';
import 'create_register_wali.dart';
import 'search_kk.dart';

class CreateRegisterAnak extends StatelessWidget {
  const CreateRegisterAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchKKCubit()),
        BlocProvider(create: (context) => RegisterOrangTuaBloc()),
      ],
      child: CreateRegisterAnakView(),
    );
  }
}

class CreateRegisterAnakView extends StatefulWidget {
  const CreateRegisterAnakView({super.key});

  @override
  State<CreateRegisterAnakView> createState() => _CreateRegisterAnakViewState();
}

class _CreateRegisterAnakViewState extends State<CreateRegisterAnakView> {
  final _formKey = GlobalKey<FormState>();
  bool _isExpanded = false;

  final List<String> selectGender = [
    'Laki-Laki',
    'Perempuan',
  ];

  final List<String> selectCaraLahir = [
    'Normal',
    'Cesar',
  ];
  final List<String> selectStatusKelahiran = [
    'Status Kelahiran 1',
    'Status Kelahiran 2',
  ];
  final List<String> selectStatusOrangTuaAnak = [
    'Orang Tua',
    'Wali',
  ];

  final List<String> disabilities = [
    'Tunanetra',
    'Tunarungu',
    'Tunawicara',
    'Tunadaksa',
    'Tunagharita',
    "Autisme",
  ];

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAnak = [];
  List<String> selectedDisabilityLabelsAnak = [];

  TextEditingController _nomorKKController = TextEditingController();
  TextEditingController _namaAyahController = TextEditingController();
  TextEditingController _namaIbuController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _anakKeController = TextEditingController();
  TextEditingController _tempatLahirController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _lingkarLenganController = TextEditingController();
  TextEditingController _lingkarKepalaController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _upperArmCircumferenceController =
      TextEditingController();
  TextEditingController _headCircumferenceController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();
  TextEditingController _keluhanController = TextEditingController();

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
        _tanggalLahirController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9;

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Tambah Data Anak",
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                    duration:
                        const Duration(milliseconds: 300), // Durasi animasi
                    curve: Curves.easeInOut, // Kurva animasi
                    height: _isExpanded
                        ? sizeHeighofSingleForm * 3
                        : sizeHeighofSingleForm, // Tinggi menu saat diperluas/dikecilkan
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nomor Kartu keluarga',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          BlocListener<SearchKKCubit, SearchKKState>(
                            listener: (context, state) {
                              if (state is SearchKKSelected) {
                                _nomorKKController.text = state.nomorKK;
                                _namaAyahController.text = state.namaAyah;
                                _namaIbuController.text = state.namaIbu;
                              }
                            },
                            child: TextFormFieldSearch(
                              controller: _nomorKKController,
                            ),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                          Visibility(
                            visible: _isExpanded,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Nama Ayah',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                TextFieldWidget(
                                  controller: _namaAyahController,
                                  hintText: "Nama Ayah",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                                const Text(
                                  'Nama Ibu',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                TextFieldWidget(
                                  controller: _namaIbuController,
                                  hintText: "Nama Ibu",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  'Detail Anak',
                                  style:
                                      AppTextStyles.primaryTextMedium.copyWith(
                                    fontSize: 10,
                                  ),
                                ),
                                Icon(
                                  size: 20,
                                  _isExpanded
                                      ? FluentIcons.chevron_up_20_filled
                                      : FluentIcons.chevron_down_20_filled,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.black54,
                        ),
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
                            controller: _anakKeController,
                            hintText: 'Anak Ke',
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
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  TextFieldWidget(
                                    controller: _tempatLahirController,
                                    hintText: 'Tempat Lahir',
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    isPasswordField: false,
                                    validators: [
                                      (value) => Validator.required(value,
                                          "Nama ayah tidak boleh kosong"),
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
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
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
                                    hintText: 'contoh: 13,5',
                                    unit: 'cm',
                                    controller: _heightController,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  MeasurementWidget(
                                    title: 'Lingkar Lengan',
                                    hintText: 'contoh: 3,5',
                                    unit: 'cm',
                                    controller:
                                        _upperArmCircumferenceController,
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
                                    hintText: 'contoh: 6,5',
                                    unit: 'kg',
                                    controller: _weightController,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  MeasurementWidget(
                                    title: 'Lingkar Kepala',
                                    hintText: 'contoh: 6,5',
                                    unit: 'cm',
                                    controller: _headCircumferenceController,
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
                          onChanged: (value) {
                            setState(() {
                              selectedStatusOrangTuaAnak = value;
                            });
                            logger.d(
                                'status orang tua anak $selectedStatusOrangTuaAnak');
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
                                  selectedDisabilities:
                                      selectedDisabilitiesAnak,
                                  onToggleDisability: _toggleDisability,
                                  onAddCustomDisability:
                                      (String customDisability) {
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
                            if (selectedStatusOrangTuaAnak == 'Wali') {
                              logger.d('go to wali');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CreateRegisterWali();
                                  },
                                ),
                              );
                            }
                            logger.d('go to simpan');
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldSearch extends StatelessWidget {
  const TextFormFieldSearch({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      validator: null,
      onTap: () async {
        OrangTuaItemModel result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => RegisterOrangTuaBloc(),
              child: SearchKartuKeluarga(),
            ),
          ),
        );
        logger.d(result);
        if (result != null) {
          // result harus berisi objek Balita
          context
              .read<SearchKKCubit>()
              .selectKK(result.kk, result.husband, result.wife);
          // Kembalikan data ke halaman sebelumnya
          // Navigator.pop(context, result);
        }
      },
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: Icon(
          FluentIcons.search_24_regular,
        ),
        hintText: 'Nomor Kartu Keluarga',
        hintStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
        filled: true,
        fillColor: backgroundWhite10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: bluePrimaryMain),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.red),
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
