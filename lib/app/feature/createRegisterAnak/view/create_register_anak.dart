import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/model/create_anak_model.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/paketToScreen/paket_to_create_anak_model.dart';
import '../../../model/paketToScreen/paket_to_create_wali_model.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/generate_button_widget.dart';
import '../../../view/widget/measuring_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/createAnakBloc/create_anak_bloc.dart';
import '../cubit/generate_nik_cubit.dart';
import '../cubit/search_kk_cubit.dart';
import 'create_register_wali.dart';
import 'search_kk.dart';

class CreateRegisterAnak extends StatelessWidget {
  const CreateRegisterAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenerateNikCubit()),
        BlocProvider(create: (context) => SearchKKCubit()),
        BlocProvider(create: (context) => CreateAnakBloc()),
      ],
      child: const CreateRegisterAnakView(),
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

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAnak = [];
  List<String> selectedDisabilityLabelsAnak = [];

  TextEditingController nomorKKController = TextEditingController();
  TextEditingController namaAyahController = TextEditingController();
  TextEditingController namaIbuController = TextEditingController();
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
  TextEditingController upperArmCircumferenceController =
      TextEditingController();
  TextEditingController headCircumferenceController = TextEditingController();
  TextEditingController catatanController = TextEditingController();
  TextEditingController keluhanController = TextEditingController();

  String? selectedGender;
  String? selectedCaraLahir;
  String? selectedStatusKelahiran;
  String? selectedStatusOrangTuaAnak;
  String? selectedProvinsiIbu;
  String? selectedKabupatenIbu;
  String? selectedKecamatanIbu;

  late PaketToCreateAnakModel paketToCreateAnakModel;

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

    if (pickedDate != null) {
      setState(() {
        tanggalLahirController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  // void _generateNIK(String nomorKK,Date tanggalLahir) {
  //   context.read<GenerateNikCubit>().getGenerateNik(nomorKK, tanggalLahir);
  //   // Set the generated NIK to the controller
  //   nikController.text = nik;
  // }

  bool _isGenerateAnakValid() {
    return tempatLahirController.text.isNotEmpty &&
        tanggalLahirController.text.isNotEmpty &&
        selectedProvinsiIbu != null && // Check if selectedProvinsi is not null
        selectedKabupatenIbu !=
            null && // Check if selectedKabupaten is not null
        selectedKecamatanIbu != null; // Check if selectedKecamatan is not null
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9;

    final createAnakBloc = BlocProvider.of<CreateAnakBloc>(context);

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
                          TextFormField(
                            readOnly: true,
                            validator: null,
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SearchKartuKeluarga()),
                              ).then((value) {
                                if (value != null) {
                                  setState(() {
                                    paketToCreateAnakModel =
                                        value as PaketToCreateAnakModel;
                                    logger.d(
                                        'provinsi ${paketToCreateAnakModel.provinsi}');
                                    logger.d(
                                        'kabupaten ${paketToCreateAnakModel.kabupaten}');
                                    logger.d(
                                        'kecamatan ${paketToCreateAnakModel.kecamatan}');
                                    selectedProvinsiIbu =
                                        paketToCreateAnakModel.provinsi;
                                    selectedKabupatenIbu =
                                        paketToCreateAnakModel.kabupaten;
                                    selectedKecamatanIbu =
                                        paketToCreateAnakModel.kecamatan;
                                    nomorKKController = TextEditingController(
                                        text: paketToCreateAnakModel
                                            .nomorKartuKeluarga);
                                    namaAyahController = TextEditingController(
                                        text: paketToCreateAnakModel.namaAyah);
                                    namaIbuController = TextEditingController(
                                        text: paketToCreateAnakModel.namaIbu);
                                  });
                                }
                              });
                            },
                            controller: nomorKKController,
                            style: Theme.of(context).textTheme.bodySmall,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                FluentIcons.search_24_regular,
                              ),
                              hintText: 'Nomor Kartu Keluarga',
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
                                  isEnable: false,
                                  controller: namaAyahController,
                                  hintText: "Nama Ayah",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  validators: [
                                    (value) => Validator.required(
                                        value, "Nama Ayah tidak boleh kosong"),
                                  ],
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
                                  isEnable: false,
                                  controller: namaIbuController,
                                  hintText: "Nama Ibu",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  validators: [
                                    (value) => Validator.required(
                                        value, "Nama Ibu tidak boleh kosong"),
                                  ],
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
                        BlocConsumer<GenerateNikCubit, GenerateNikState>(
                          listener: (context, state) {
                            if (state is GenerateNikSuccess) {
                              nikController.text =
                                  state.data.data.nomorIndukKeluarga;
                            }
                          },
                          builder: (context, state) {
                            if (state is GenerateNikLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Row(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex:
                                      7, // Adjust this value to make the TextField larger
                                  child: TextFieldWidget(
                                    controller: nikController,
                                    hintText: 'NIK',
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    isPasswordField: false,
                                    validators: [
                                      (value) => Validator.consistOf(value, 16,
                                          "NIk Anak harus terdiri atas 16 digit"),
                                      (value) => Validator.required(
                                          value, "NIK Anak tidak boleh kosong"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width /
                                      3.4, // Atur lebar minimum untuk tombol
                                  child: GenerateButtonWidget(
                                    onPressed: () {
                                      logger.d(
                                          'isi provinsi ${selectedProvinsiIbu}');
                                      logger.d(
                                          'isi Kabupaten ${selectedKabupatenIbu}');
                                      logger.d(
                                          'isi Kecamatan ${selectedKecamatanIbu}');
                                      // Validasi sebelum mengizinkan generate
                                      if (_isGenerateAnakValid()) {
                                        logger.d(
                                            'tanggal lahir : ${tanggalLahirController.text}');
                                        logger.d(
                                            'KK : ${nomorKKController.text}');
                                        // Logika untuk generate
                                        context
                                            .read<GenerateNikCubit>()
                                            .getGenerateNik(
                                                nomorKKController.text,
                                                tanggalLahirController.text);
                                        print("Generate button pressed");
                                      } else {
                                        // Tampilkan snackbar atau dialog jika form tidak valid
                                        showTopSnackBar(
                                            Overlay.of(context),
                                            animationDuration: const Duration(
                                                milliseconds: 600),
                                            displayDuration: const Duration(
                                                milliseconds: 2200),
                                            reverseAnimationDuration:
                                                const Duration(
                                                    milliseconds: 300),
                                            TopSnackbarWidget().error(
                                                'Harap pilih data Orang tua dan isi Tempat Tanggal Lahir agar bisa generate NIK'));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
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
                            (value) => Validator.required(
                                value, "Nama Anak tidak boleh kosong"),
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
                                value, "Urutan Anak tidak boleh kosong"),
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
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  TextFieldWidget(
                                    controller: tempatLahirController,
                                    hintText: 'Tempat Lahir',
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    isPasswordField: false,
                                    validators: [
                                      (value) => Validator.required(value,
                                          "Tempat Lahir tidak boleh kosong"),
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
                                    hintText: 'contoh: 37.5',
                                    unit: 'cm',
                                    controller: heightController,
                                    validator: [
                                      (value) => Validator.required(value,
                                          "Tinggi Lahir tidak boleh kosong"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  MeasurementWidget(
                                    title: 'Lingkar Lengan',
                                    hintText: 'contoh: 3.5',
                                    unit: 'cm',
                                    controller: upperArmCircumferenceController,
                                    validator: [
                                      (value) => Validator.required(value,
                                          "Lingkar Lengan tidak boleh kosong"),
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
                                      (value) => Validator.required(value,
                                          "Berat Lahir tidak boleh kosong"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  MeasurementWidget(
                                    title: 'Lingkar Kepala',
                                    hintText: 'contoh: 6.5',
                                    unit: 'cm',
                                    controller: headCircumferenceController,
                                    validator: [
                                      (value) => Validator.required(value,
                                          "Lingkar Kepala tidak boleh kosong"),
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
                        BlocConsumer<CreateAnakBloc, CreateAnakState>(
                          listener: (context, state) {
                            debugPrint(state.toString());
                            if (state is CreateAnakFailedState) {
                              showTopSnackBar(
                                  Overlay.of(context),
                                  animationDuration:
                                      const Duration(milliseconds: 600),
                                  displayDuration:
                                      const Duration(milliseconds: 2200),
                                  reverseAnimationDuration:
                                      const Duration(milliseconds: 300),
                                  TopSnackbarWidget().error(state.error));
                            }
                            if (state is CreateAnakTokenExpiredState) {}
                            if (state is CreateAnakSuccessState) {
                              showTopSnackBar(
                                  Overlay.of(context),
                                  animationDuration:
                                      const Duration(milliseconds: 600),
                                  displayDuration:
                                      const Duration(milliseconds: 2200),
                                  reverseAnimationDuration:
                                      const Duration(milliseconds: 300),
                                  TopSnackbarWidget()
                                      .success("Tambah Anak Berhasil"));
                              Navigator.pop(context, 1);
                            }
                            if (state is CreateAnakNullErrorState) {
                              showTopSnackBar(
                                  Overlay.of(context),
                                  animationDuration:
                                      const Duration(milliseconds: 600),
                                  displayDuration:
                                      const Duration(milliseconds: 2200),
                                  reverseAnimationDuration:
                                      const Duration(milliseconds: 300),
                                  TopSnackbarWidget().warning(state.error));
                            }
                          },
                          builder: (context, state) {
                            return ButtonPrimary(
                              color: bluePrimaryMain,
                              mainButtonMessage: 'Simpan',
                              mainButton: () {
                                if (_formKey.currentState!.validate()) {
                                  if (selectedStatusOrangTuaAnak == 'Wali') {
                                    logger.d('go to wali');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return CreateRegisterWali(
                                            paket: PaketToCreateWaliModel(
                                                createAnakModel: CreateAnakModel(
                                                    kartuKeluargaId:
                                                        paketToCreateAnakModel
                                                            .idKartuKeluarga,
                                                    nik: nikController.text,
                                                    anakKe: int.parse(
                                                        anakKeController.text),
                                                    namaAnak:
                                                        namaController.text,
                                                    tempatLahir: tempatLahirController
                                                        .text,
                                                    tanggalLahir: tanggalLahirController
                                                        .text,
                                                    beratBadanLahir: double.parse(
                                                        weightController.text),
                                                    tinggiBadanLahir: double.parse(
                                                        heightController.text),
                                                    lingkarKepalaLahir: double.parse(
                                                        headCircumferenceController
                                                            .text),
                                                    lingkarLenganAtasLahir:
                                                        double.parse(upperArmCircumferenceController.text),
                                                    caraLahir: selectedCaraLahir!,
                                                    jenisKelamin: selectedGender!,
                                                    statusKelahiran: selectedStatusKelahiran!,
                                                    disabilitasAnak: selectedDisabilityLabelsAnak,
                                                    statusOrangTua: selectedStatusOrangTuaAnak!,
                                                    pengasuh: null),
                                                createAnakBloc: createAnakBloc),
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    createAnakBloc.add(CreateAnak(CreateAnakModel(
                                        kartuKeluargaId: paketToCreateAnakModel
                                            .idKartuKeluarga,
                                        nik: nikController.text,
                                        anakKe:
                                            int.parse(anakKeController.text),
                                        namaAnak: namaController.text,
                                        tempatLahir: tempatLahirController.text,
                                        tanggalLahir:
                                            tanggalLahirController.text,
                                        beratBadanLahir:
                                            double.parse(weightController.text),
                                        tinggiBadanLahir:
                                            double.parse(heightController.text),
                                        lingkarKepalaLahir: double.parse(
                                            headCircumferenceController.text),
                                        lingkarLenganAtasLahir: double.parse(
                                            upperArmCircumferenceController
                                                .text),
                                        caraLahir: selectedCaraLahir!,
                                        jenisKelamin: selectedGender!,
                                        statusKelahiran:
                                            selectedStatusKelahiran!,
                                        disabilitasAnak:
                                            selectedDisabilityLabelsAnak,
                                        statusOrangTua:
                                            selectedStatusOrangTuaAnak!,
                                        pengasuh: null)));
                                  }
                                  logger.d('go to simpan');
                                } else {
                                  logger.d("form tidak valid");
                                }
                              },
                            );
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
