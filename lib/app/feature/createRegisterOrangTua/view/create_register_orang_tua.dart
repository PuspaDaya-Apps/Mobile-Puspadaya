import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/alamat/bloc/alamat_bloc.dart';
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

import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/generate_button_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../alatUkur/detail/view/detail_alat_ukur.dart';
import '../bloc/create_register_orang_tua_bloc.dart';
import '../model/post_orang_tua_body.dart';

class CreateRegisterOrangTua extends StatelessWidget {
  const CreateRegisterOrangTua({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlamatBloc>(
          create: (BuildContext context) => AlamatBloc(),
        ),
        BlocProvider<CreateRegisterOrangTuaBloc>(
          create: (BuildContext context) => CreateRegisterOrangTuaBloc(),
        ),
      ],
      child: CreateRegisterOrangTuaView(),
    );
  }
}

class CreateRegisterOrangTuaView extends StatefulWidget {
  const CreateRegisterOrangTuaView({super.key});

  @override
  State<CreateRegisterOrangTuaView> createState() =>
      _CreateRegisterOrangTuaViewState();
}

class _CreateRegisterOrangTuaViewState extends State<CreateRegisterOrangTuaView>
    with SingleTickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  late TabController _tabController;

  // Controller untuk Data Ayah dan Data Ibu
  // ? ayah controller
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

  //? ayah selected
  String? selectedProvinsiAyah;
  String? selectedKabupatenAyah;
  String? selectedKecamatanAyah;
  String? selectedDesaAyah;
  String? selectedDusunAyahId;
  String? selectedGolDarahAyah;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  //? function handler controler ayah

  Future<void> _selectDateAyah(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(2000); // Set initial date to the year 1945
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
        tanggalLahirAyahController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _toggleDisabilityAyah(int index) {
    setState(() {
      selectedDisabilitiesAyah[index] = !selectedDisabilitiesAyah[index];
      if (selectedDisabilitiesAyah[index]) {
        selectedDisabilityLabelsAyah.add(disabilities[index]);
      } else {
        selectedDisabilityLabelsAyah.remove(disabilities[index]);
      }
    });
  }

  void _removeDisabilityAyah(String label) {
    setState(() {
      selectedDisabilityLabelsAyah.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilitiesAyah[index] = false;
      }
    });
  }

  // ? ibu
  //? ibu controller
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

  //? selected
  String? selectedProvinsiIbu;
  String? selectedKabupatenIbu;
  String? selectedJenisKBIbu;
  String? selectedGolonnganDarahIbu;
  String? selectedKecamatanIbu;
  String? selectedDesaIbu;
  String? selectedDusunIbuId;
  String? selectedGolDarahIbu;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  //? function handler controler Ibu

  Future<void> _selectDateIbu(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(2000); // Set initial date to the year 1945
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
        tanggalLahirIbuController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectDateKelahiranSebelumnyaIbu(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(2010); // Set initial date to the year 1945
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
        tanggalKelahiranAnakSebelumnyaIbuController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _removeDisabilityIbu(String label) {
    setState(() {
      selectedDisabilityLabelsIbu.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilitiesIbu[index] = false;
      }
    });
  }

  void _toggleDisabilityIbu(int index) {
    setState(() {
      selectedDisabilitiesIbu[index] = !selectedDisabilitiesIbu[index];
      if (selectedDisabilitiesIbu[index]) {
        selectedDisabilityLabelsIbu.add(disabilities[index]);
      } else {
        selectedDisabilityLabelsIbu.remove(disabilities[index]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    logger.d('trigger fetch');
    context.read<AlamatBloc>().add(ShowAllSectionEvent());
    // Inisialisasi selectedDisabilitiesIbu dengan panjang yang sama dengan disabilities
    selectedDisabilitiesAyah =
        List<bool>.from(List.filled(disabilities.length, false));
    selectedDisabilitiesIbu =
        List<bool>.from(List.filled(disabilities.length, false));
    // final List<ProvinsiModel.Datum> selectProvinsi = [];
  }

  @override
  void dispose() {
    // Dispose TabController
    _tabController.dispose();
    super.dispose();
  }

  void _goToNextTab() {
    _tabController.animateTo(1); // Pindah ke tab Data Ibu
  }

  void _navigateBack() {
    _tabController.animateTo(0);
  }

// String? selectedProvinsiAyah;
//   String? selectedKabupatenAyah;
//   String? selectedKecamatanAyah;
//   String? selectedDesaAyah;
//   String? selectedDusunAyahId;

  bool _isGenerateAyahValid() {
    return tempatLahirAyahController.text.isNotEmpty &&
        tanggalLahirAyahController.text.isNotEmpty &&
        selectedProvinsiAyah !=
            null && // Check if selectedProvinsiAyah is not null
        selectedKabupatenAyah !=
            null && // Check if selectedKabupatenAyah is not null
        selectedKecamatanAyah !=
            null; // Check if selectedDusunAyahId is not null
  }

  bool _isGenerateIbuValid() {
    return tempatLahirIbuController.text.isNotEmpty &&
        tanggalLahirIbuController.text.isNotEmpty &&
        selectedProvinsiIbu !=
            null && // Check if selectedProvinsiIbu is not null
        selectedKabupatenIbu !=
            null && // Check if selectedKabupatenIbu is not null
        selectedKecamatanIbu != null; // Check if selectedDusunIbuId is not null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Tambah Data Orang Tua',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body:
          BlocListener<CreateRegisterOrangTuaBloc, CreateRegisterOrangTuaState>(
        listener: (context, state) {
          if (state is CreateRegisterOrangTuaSuccesState) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 1.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: backgroundWhite20,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TabBar(
                      isScrollable: false,
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorAnimation: TabIndicatorAnimation.elastic,
                      dividerHeight: 0,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: bluePrimaryMain,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      unselectedLabelColor: textSecoundary,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(text: 'Data Ayah'),
                        Tab(text: 'Data Ibu'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<AlamatBloc, AlamatState>(
                    buildWhen: (previous, current) => current is ShowAllSection,
                    builder: (context, state) {
                      if (state is ShowAllSection) {
                        final List<ProvinsiModel.Datum> selectProvinsi =
                            state.provinsi;
                        final List<KabupatenModel.Datum> selectKabupaten =
                            state.kabupaten;
                        final List<KecamatanModel.Datum> selectKecamatan =
                            state.kecamatan;
                        final List<DesaKelurahanModel.Datum>
                            selectDesaKelurahan = state.desaKelurahan;
                        final List<DusunModel.Datum> selectDusun = state.dusun;

                        return Expanded(
                          child: Form(
                            key: formkey,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: [
                                // !AYAH
                                Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Nomor Kartu Keluarga',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.calHeightMultiplier(8),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Expanded(
                                              flex:
                                                  3, // Mengatur lebar TextField
                                              child: TextFieldWidget(
                                                controller: kkAyahController,
                                                hintText: 'Masukan Nomor KK',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.consistOf(
                                                      value,
                                                      16,
                                                      "KK harus terdiri atas 16 digit"),
                                                  (value) => Validator.required(
                                                      value,
                                                      "KK ayah tidak boleh kosong"),
                                                ],
                                              ),
                                            ),

                                            // Button Generate
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3.4, // Atur lebar minimum untuk tombol
                                              child: GenerateButtonWidget(
                                                onPressed: () {
                                                  // Validasi sebelum mengizinkan generate
                                                  if (_isGenerateAyahValid()) {
                                                    // Logika untuk generate
                                                    print(
                                                        "Generate button pressed");
                                                  } else {
                                                    // Tampilkan snackbar atau dialog jika form tidak valid
                                                    showTopSnackBar(
                                                        Overlay.of(context),
                                                        animationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    600),
                                                        displayDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    2200),
                                                        reverseAnimationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        TopSnackbarWidget().error(
                                                            'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate KK'));
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'NIK',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: nikAyahController,
                                                hintText: 'Masukan NIK',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.consistOf(
                                                      value,
                                                      16,
                                                      "NIK ayah harus terdiri atas 16 digit"),
                                                  (value) => Validator.required(
                                                      value,
                                                      "NIK ayah tidak boleh kosong"),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3.4, // Atur lebar minimum untuk tombol
                                              child: GenerateButtonWidget(
                                                onPressed: () {
                                                  // Validasi sebelum mengizinkan generate
                                                  if (_isGenerateAyahValid()) {
                                                    // Logika untuk generate
                                                    print(
                                                        "Generate button pressed");
                                                  } else {
                                                    // Tampilkan snackbar atau dialog jika form tidak valid
                                                    showTopSnackBar(
                                                        Overlay.of(context),
                                                        animationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    600),
                                                        displayDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    2200),
                                                        reverseAnimationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        TopSnackbarWidget().error(
                                                            'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate NIK'));
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Nama',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        TextFieldWidget(
                                          controller: namaAyahController,
                                          hintText: 'Masukan Nama',
                                          isPasswordField: false,
                                          keyboardType: TextInputType.text,
                                          obscureText: false,
                                          validators: [
                                            (value) => Validator.required(value,
                                                "Nama ayah tidak boleh kosong"),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Tempat Lahir',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                      height: SizeConfig
                                                          .calHeightMultiplier(
                                                              8)),
                                                  TextFieldWidget(
                                                    controller:
                                                        tempatLahirAyahController,
                                                    hintText: 'Tempat Lahir',
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    isPasswordField: false,
                                                    validators: [
                                                      (value) => Validator.required(
                                                          value,
                                                          "Tempat Lahir tidak boleh kosong"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Tanggal Lahir',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                      height: SizeConfig
                                                          .calHeightMultiplier(
                                                              8)),
                                                  DateTimePickerWidget(
                                                    controller:
                                                        tanggalLahirAyahController,
                                                    hintText: 'Tanggal Lahir',
                                                    selectDate: () {
                                                      _selectDateAyah(context);
                                                    },
                                                    isDate: true,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
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
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Alamat',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // provinsi
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Provinsi harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectProvinsi
                                                    .map((provinsi) =>
                                                        provinsi.namaProvinsi)
                                                    .toSet() // Menghilangkan duplikasi
                                                    .toList(),
                                                hint: 'Provinsi',
                                                value: selectedProvinsiAyah,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedProvinsiAyah =
                                                        value;
                                                  });
                                                },
                                              ),
                                            ),
                                            // kabupaten
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Kabupaten harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectKabupaten
                                                    .map((kabupaten) =>
                                                        kabupaten
                                                            .namaKabupatenKota)
                                                    .toList(),
                                                hint: 'Kabupaten',
                                                value: selectedKabupatenAyah,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedKabupatenAyah =
                                                        value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // kecamatan
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Kecamatan harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectKecamatan
                                                    .map((kecamatan) =>
                                                        kecamatan.namaKecamatan)
                                                    .toList(),
                                                hint: 'Kecamatan',
                                                value: selectedKecamatanAyah,
                                                onChanged: (value) {
                                                  setState(() {
                                                    logger.d(
                                                        'selected Kecamatan id ${value}');
                                                    // context
                                                    //     .read<AlamatBloc>()
                                                    //     .add(SelectKabupaten(selectedProvinsiId));
                                                    selectedKecamatanAyah =
                                                        value;
                                                  });
                                                },
                                              ),
                                            ),
                                            // desa
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Desa harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectDesaKelurahan
                                                    .map((desa) =>
                                                        desa.namaDesaKelurahan)
                                                    .toList(),
                                                hint: 'Desa',
                                                value: selectedDesaAyah,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedDesaAyah = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        DropdownWidget(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Dusun harus dipilih";
                                            }
                                            return null;
                                          },
                                          items: selectDusun
                                              .map((dusun) => dusun
                                                  .namaDusun) // Menampilkan Nama Dusun
                                              .toList(),
                                          hint: 'Dusun',
                                          value: selectedDusunAyahId != null
                                              ? selectDusun
                                                  .firstWhere(
                                                    (dusun) =>
                                                        dusun.id ==
                                                        selectedDusunAyahId,
                                                    orElse: () => selectDusun
                                                        .first, // Handle jika tidak ditemukan
                                                  )
                                                  .namaDusun
                                              : null, // Menampilkan nama sesuai ID yang dipilih
                                          onChanged: (value) {
                                            setState(() {
                                              final selectedDusun =
                                                  selectDusun.firstWhere(
                                                (dusun) =>
                                                    dusun.namaDusun == value,
                                                orElse: () => selectDusun
                                                    .first, // Default jika tidak ditemukan
                                              );

                                              selectedDusunAyahId = selectedDusun
                                                  .id; // Simpan ID, bukan nama
                                              logger.d(
                                                  'Selected Dusun ID: ${selectedDusunAyahId}');
                                            });
                                          },
                                        ),

                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: rTAyahController,
                                                hintText: 'RT',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.required(
                                                      value,
                                                      "RT Tidak Boleh Kosong"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: rWAyahController,
                                                hintText: 'RW',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.required(
                                                      value,
                                                      "RW Tidak Boleh Kosong"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        TextFieldWidget(
                                          controller: alamatAyahController,
                                          hintText: 'Masukan alamat lengkap',
                                          keyboardType: TextInputType.text,
                                          obscureText: false,
                                          isPasswordField: false,
                                          validators: [
                                            (value) => Validator.required(value,
                                                "Alamat tidak boleh kosong"),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Nomor Telepon (WA aktif)',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        TextFieldWidget(
                                          controller: teleponAyahController,
                                          hintText: 'Masukan nomor telepon',
                                          keyboardType: TextInputType.phone,
                                          obscureText: false,
                                          isPasswordField: false,
                                          validators: [
                                            (value) => Validator.required(value,
                                                "Nomor Telepon tidak boleh kosong"),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Golongan Darah',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        DropdownWidget(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Golongan harus dipilih";
                                            }
                                            return null;
                                          },
                                          items: selectGolDarah,
                                          hint: 'Golongan Darah',
                                          value: selectedGolDarahAyah,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedGolDarahAyah = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Disabilitas',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        // Tampilkan disabilitas yang dipilih
                                        Column(
                                          children: selectedDisabilityLabelsAyah
                                              .map((label) {
                                            return ListTile(
                                              title: Text(
                                                label,
                                                style: AppTextStyles
                                                    .primaryTextNormal
                                                    .copyWith(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              trailing: IconButton(
                                                icon: Icon(Icons.delete,
                                                    color: Colors.red),
                                                onPressed: () {
                                                  _removeDisabilityAyah(label);
                                                },
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        OutlineButton(
                                          color: Colors.grey,
                                          mainButtonMessage:
                                              'Tambah Disabilitas',
                                          mainButton: () {
                                            logger.d("tambah disabilitas");
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DialogDisabilitas(
                                                  disabilities: disabilities,
                                                  selectedDisabilities:
                                                      selectedDisabilitiesAyah,
                                                  onToggleDisability:
                                                      _toggleDisabilityAyah,
                                                  onAddCustomDisability: (String
                                                      customDisability) {
                                                    setState(() {
                                                      disabilities.add(
                                                          customDisability);
                                                      selectedDisabilitiesAyah
                                                          .add(true);
                                                      selectedDisabilityLabelsAyah
                                                          .add(
                                                              customDisability);
                                                    });
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        ButtonPrimary(
                                          color: bluePrimaryMain,
                                          mainButtonMessage: 'Selanjutnya',
                                          mainButton: () {
                                            _goToNextTab();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //!IBU
                                // Container(),
                                Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Nomor Kartu Keluarga',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: kkIbuController,
                                                hintText: 'Masukan Nomor KK',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.consistOf(
                                                      value,
                                                      16,
                                                      "KK harus terdiri atas 16 digit"),
                                                  (value) => Validator.required(
                                                      value,
                                                      "KK Ibu tidak boleh kosong"),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3.4, // Atur lebar minimum untuk tombol
                                              child: GenerateButtonWidget(
                                                onPressed: () {
                                                  // Validasi sebelum mengizinkan generate
                                                  if (_isGenerateIbuValid()) {
                                                    // Logika untuk generate
                                                    print(
                                                        "Generate button pressed");
                                                  } else {
                                                    // Tampilkan snackbar atau dialog jika form tidak valid
                                                    showTopSnackBar(
                                                        Overlay.of(context),
                                                        animationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    600),
                                                        displayDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    2200),
                                                        reverseAnimationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        TopSnackbarWidget().error(
                                                            'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate KK'));
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'NIK',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),

                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: nikIbuController,
                                                hintText: 'Masukan NIK',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.consistOf(
                                                      value,
                                                      16,
                                                      "NIk Ibu harus terdiri atas 16 digit"),
                                                  (value) => Validator.required(
                                                      value,
                                                      "NIK Ibu tidak boleh kosong"),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3.4, // Atur lebar minimum untuk tombol
                                              child: GenerateButtonWidget(
                                                onPressed: () {
                                                  // Validasi sebelum mengizinkan generate
                                                  if (_isGenerateIbuValid()) {
                                                    // Logika untuk generate
                                                    print(
                                                        "Generate button pressed");
                                                  } else {
                                                    // Tampilkan snackbar atau dialog jika form tidak valid
                                                    showTopSnackBar(
                                                        Overlay.of(context),
                                                        animationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    600),
                                                        displayDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    2200),
                                                        reverseAnimationDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        TopSnackbarWidget().error(
                                                            'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate NIK'));
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Nama',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        TextFieldWidget(
                                          controller: namaIbuController,
                                          hintText: 'Masukan Nama',
                                          isPasswordField: false,
                                          keyboardType: TextInputType.text,
                                          obscureText: false,
                                          validators: [
                                            (value) => Validator.required(value,
                                                "Nama Ibu tidak boleh kosong"),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Tempat Lahir',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                      height: SizeConfig
                                                          .calHeightMultiplier(
                                                              8)),
                                                  TextFieldWidget(
                                                    controller:
                                                        tempatLahirIbuController,
                                                    hintText: 'Tempat Lahir',
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText: false,
                                                    isPasswordField: false,
                                                    validators: [
                                                      (value) => Validator.required(
                                                          value,
                                                          "Nama Ibu tidak boleh kosong"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Tanggal Lahir',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                      height: SizeConfig
                                                          .calHeightMultiplier(
                                                              8)),
                                                  DateTimePickerWidget(
                                                    controller:
                                                        tanggalLahirIbuController,
                                                    hintText: 'Tanggal Lahir',
                                                    selectDate: () {
                                                      _selectDateIbu(context);
                                                    },
                                                    isDate: true,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
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
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Alamat',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // provinsi
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Provinsi harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectProvinsi
                                                    .map((provinsi) =>
                                                        provinsi.namaProvinsi)
                                                    .toList(),
                                                hint: 'Provinsi',
                                                value: selectedProvinsiIbu,
                                                onChanged: (value) {
                                                  setState(() {
                                                    // final selectedProvinsiId = selectProvinsi
                                                    //     .firstWhere(
                                                    //         (provinsi) => provinsi.namaProvinsi == value)
                                                    //     .id;
                                                    logger.d(
                                                        'selected provinsi id ${value}');
                                                    // context
                                                    //     .read<AlamatBloc>()
                                                    //     .add(SelectKabupaten(selectedProvinsiId));
                                                    selectedProvinsiIbu = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            // kabupaten
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Kabupaten harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectKabupaten
                                                    .map((kabupaten) =>
                                                        kabupaten
                                                            .namaKabupatenKota)
                                                    .toList(),
                                                hint: 'Kabupaten',
                                                value: selectedKabupatenIbu,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedKabupatenIbu =
                                                        value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // kecamatan
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Kecamatan harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectKecamatan
                                                    .map((kecamatan) =>
                                                        kecamatan.namaKecamatan)
                                                    .toList(),
                                                hint: 'Kecamatan',
                                                value: selectedKecamatanIbu,
                                                onChanged: (value) {
                                                  setState(() {
                                                    logger.d(
                                                        'selected Kecamatan id ${value}');
                                                    // context
                                                    //     .read<AlamatBloc>()
                                                    //     .add(SelectKabupaten(selectedProvinsiId));
                                                    selectedKecamatanIbu =
                                                        value;
                                                  });
                                                },
                                              ),
                                            ),
                                            // desa
                                            Expanded(
                                              child: DropdownWidget(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Desa harus dipilih";
                                                  }
                                                  return null;
                                                },
                                                items: selectDesaKelurahan
                                                    .map((desa) =>
                                                        desa.namaDesaKelurahan)
                                                    .toList(),
                                                hint: 'Desa',
                                                value: selectedDesaIbu,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedDesaIbu = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        DropdownWidget(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Dusun harus dipilih";
                                            }
                                            return null;
                                          },
                                          items: selectDusun
                                              .map((dusun) => dusun
                                                  .namaDusun) // Menampilkan Nama Dusun
                                              .toList(),
                                          hint: 'Dusun',
                                          value: selectedDusunIbuId != null
                                              ? selectDusun
                                                  .firstWhere(
                                                    (dusun) =>
                                                        dusun.id ==
                                                        selectedDusunIbuId,
                                                    orElse: () => selectDusun
                                                        .first, // Handle jika tidak ditemukan
                                                  )
                                                  .namaDusun
                                              : null, // Menampilkan nama sesuai ID yang dipilih
                                          onChanged: (value) {
                                            setState(() {
                                              final selectedDusun =
                                                  selectDusun.firstWhere(
                                                (dusun) =>
                                                    dusun.namaDusun == value,
                                                orElse: () => selectDusun
                                                    .first, // Default jika tidak ditemukan
                                              );

                                              selectedDusunIbuId = selectedDusun
                                                  .id; // Simpan ID, bukan nama
                                              logger.d(
                                                  'Selected Dusun ID: ${selectedDusunIbuId}');
                                            });
                                          },
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        Row(
                                          spacing: 8,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: rTIbuController,
                                                hintText: 'RT',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.required(
                                                      value,
                                                      "RT tidak boleh kosong"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: rWIbuController,
                                                hintText: 'RW',
                                                isPasswordField: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                obscureText: false,
                                                validators: [
                                                  (value) => Validator.required(
                                                      value,
                                                      "RW tidak boleh kosong"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        TextFieldWidget(
                                          controller: alamatIbuController,
                                          hintText: 'Masukan alamat lengkap',
                                          keyboardType: TextInputType.text,
                                          obscureText: false,
                                          isPasswordField: false,
                                          validators: [
                                            (value) => Validator.required(value,
                                                "Alamat tidak boleh kosong"),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Nomor Telepon (WA aktif)',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        TextFieldWidget(
                                          controller: teleponIbuController,
                                          hintText: 'Masukan nomor telepon',
                                          keyboardType: TextInputType.phone,
                                          obscureText: false,
                                          isPasswordField: false,
                                          validators: [
                                            (value) => Validator.required(value,
                                                "Nomor Telepon tidak boleh kosong"),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 8,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Jenis KB',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                      height: SizeConfig
                                                          .calHeightMultiplier(
                                                              8)),
                                                  DropdownWidget(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "Jenis KB harus dipilih";
                                                      }
                                                      return null;
                                                    },
                                                    items: selectJenisKB,
                                                    hint: 'Jenis KB',
                                                    value: selectedJenisKBIbu,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedJenisKBIbu =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Golongan Darah',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                      height: SizeConfig
                                                          .calHeightMultiplier(
                                                              8)),
                                                  DropdownWidget(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "Golongan Darah harus dipilih";
                                                      }
                                                      return null;
                                                    },
                                                    items: selectGolDarah,
                                                    hint: 'Golongan Darah',
                                                    value: selectedGolDarahIbu,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedGolDarahIbu =
                                                            value; // Update the selected value
                                                        logger.d(
                                                            'Selected Golongan Darah: ${selectedGolDarahIbu}');
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Tanggal lahiran Anak Sebelumnya',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        DateTimePickerWidget(
                                          isDate: true,
                                          controller:
                                              tanggalKelahiranAnakSebelumnyaIbuController,
                                          selectDate: () {
                                            _selectDateKelahiranSebelumnyaIbu(
                                                context);
                                          },
                                          hintText:
                                              "Tanggal Lahiran Anak Sebelumnya",
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Tanggal harus dipilih";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Jumlah Anak',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        TextFieldWidget(
                                          controller: jumlahAnakIbuController,
                                          hintText: 'Jumlah Anak',
                                          keyboardType: TextInputType.number,
                                          obscureText: false,
                                          isPasswordField: false,
                                          validators: [
                                            (value) => Validator.required(value,
                                                "Jumlah Anak tidak boleh kosong"),
                                          ],
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        const Text(
                                          'Disabilitas',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        // Tampilkan disabilitas yang dipilih
                                        Column(
                                          children: selectedDisabilityLabelsIbu
                                              .map((label) {
                                            return ListTile(
                                              title: Text(
                                                label,
                                                style: AppTextStyles
                                                    .primaryTextNormal
                                                    .copyWith(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              trailing: IconButton(
                                                icon: Icon(Icons.delete,
                                                    color: Colors.red),
                                                onPressed: () {
                                                  _removeDisabilityIbu(label);
                                                },
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    8)),
                                        OutlineButton(
                                          color: Colors.grey,
                                          mainButtonMessage:
                                              'Tambah Disabilitas',
                                          mainButton: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DialogDisabilitas(
                                                  disabilities: disabilities,
                                                  selectedDisabilities:
                                                      selectedDisabilitiesIbu,
                                                  onToggleDisability:
                                                      _toggleDisabilityIbu,
                                                  onAddCustomDisability: (String
                                                      customDisability) {
                                                    setState(() {
                                                      disabilities.add(
                                                          customDisability);
                                                      selectedDisabilitiesIbu
                                                          .add(true);
                                                      selectedDisabilityLabelsIbu
                                                          .add(
                                                              customDisability);
                                                    });
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    16)),
                                        ButtonPrimary(
                                          color: bluePrimaryMain,
                                          mainButtonMessage: 'Simpan',
                                          mainButton: () async {
                                            // Validate the form
                                            if (formkey.currentState!
                                                .validate()) {
                                              PostOrangTuaBody dataOrangTua =
                                                  PostOrangTuaBody(
                                                ayah: Ayah(
                                                  alamat:
                                                      alamatAyahController.text,
                                                  nomorKartuKeluarga:
                                                      kkAyahController.text,
                                                  dusunId: selectedDusunAyahId!,
                                                  golDarah:
                                                      selectedGolDarahAyah!,
                                                  namaAyah:
                                                      namaAyahController.text,
                                                  nik: nikAyahController.text,
                                                  nomorTelepon:
                                                      teleponAyahController
                                                          .text,
                                                  rt: rTAyahController.text,
                                                  rw: rWAyahController.text,
                                                  tempatLahir:
                                                      tempatLahirAyahController
                                                          .text,
                                                  tanggalLahir:
                                                      tanggalLahirAyahController
                                                          .text,
                                                  jenisDisabilitas:
                                                      selectedDisabilityLabelsAyah
                                                          .map((e) {
                                                    return JenisDisabilitas(
                                                        namaDisabilitas: e);
                                                  }).toList(),
                                                ),
                                                ibu: Ibu(
                                                  tanggalMelahirkanSebelumnya:
                                                      tanggalKelahiranAnakSebelumnyaIbuController
                                                          .text,
                                                  jumlahAnak: int.parse(
                                                      jumlahAnakIbuController
                                                          .text),
                                                  jenisKb: selectedJenisKBIbu!,
                                                  alamat:
                                                      alamatIbuController.text,
                                                  nomorKartuKeluarga:
                                                      kkIbuController.text,
                                                  dusunId: selectedDusunIbuId!,
                                                  golDarah:
                                                      selectedGolDarahIbu!,
                                                  namaIbu:
                                                      namaIbuController.text,
                                                  nik: nikIbuController.text,
                                                  nomorTelepon:
                                                      teleponIbuController.text,
                                                  rt: rTIbuController.text,
                                                  rw: rWIbuController.text,
                                                  tempatLahir:
                                                      tempatLahirIbuController
                                                          .text,
                                                  tanggalLahir:
                                                      tanggalLahirIbuController
                                                          .text,
                                                  jenisDisabilitas:
                                                      selectedDisabilityLabelsIbu
                                                          .map((e) {
                                                    return JenisDisabilitas(
                                                        namaDisabilitas: e);
                                                  }).toList(),
                                                ),
                                              );

                                              context
                                                  .read<
                                                      CreateRegisterOrangTuaBloc>()
                                                  .add(SendRegisterOrangTua(
                                                      postOrangTuaBody:
                                                          dataOrangTua));
                                            } else {
                                              print("Form tidak valid");
                                            }
                                          },
                                        ),
                                        SizedBox(
                                            height:
                                                SizeConfig.calHeightMultiplier(
                                                    20)),
                                        Center(
                                          child: GestureDetector(
                                            onTap: _navigateBack,
                                            child: Text(
                                              'Kembali Ke data Ayah',
                                              style: AppTextStyles
                                                  .secoundaryTextMedium
                                                  .copyWith(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      // Handle other states...
                      return Container(); // Ganti dengan widget yang sesuai
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
