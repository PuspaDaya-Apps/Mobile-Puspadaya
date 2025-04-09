import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:puspadaya/app/feature/alamat/model/get_provinsi_response.dart'
//     as ProvinsiModel;
// import 'package:puspadaya/app/feature/alamat/model/get_kabupaten_response.dart'
//     as KabupatenModel;
// import 'package:puspadaya/app/feature/alamat/model/get_kecamatan_response.dart'
//     as KecamatanModel;
// import 'package:puspadaya/app/feature/alamat/model/get_desa_kelurahan_response.dart'
//     as DesaKelurahanModel;
// import 'package:puspadaya/app/feature/alamat/model/get_dusun_response.dart'
//     as DusunModel;

import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/data_wilayah_model.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import '../../alatUkur/detail/view/detail_alat_ukur.dart';
import '../../createRegisterAnak/cubit/generate_kk_cubit.dart';
import '../../createRegisterAnak/cubit/generate_nik_cubit.dart';
import '../bloc/create_register_orang_tua_bloc.dart';
import '../model/post_orang_tua_body.dart';

class CreateRegisterOrangTua extends StatelessWidget {
  const CreateRegisterOrangTua({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenerateKkCubit()),
        BlocProvider(create: (context) => GenerateNikCubit()),
        BlocProvider<AlamatSaveCubit>(
          create: (BuildContext context) => AlamatSaveCubit(),
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
  List<DataKabupatenKota> dataKabupatenKotaAyah = [];
  List<DataKecamatan> dataKecamatanAyah = [];
  List<DataDesaKelurahan> dataDesaKelurahanAyah = [];
  List<DataDusun> dataDusunAyah = [];

  DataKabupatenKota? selectedKabupatenAyah;
  DataKecamatan? selectedKecamatanAyah;
  DataDesaKelurahan? selectedDesaAyah;
  DataDusun? selectedDusunAyah;

  String selectedGolDarahAyah = '-';

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
  final TextEditingController jumlahAnakIbuController =
      TextEditingController(text: '0');

  //? selected
  List<DataKabupatenKota> dataKabupatenKotaIbu = [];
  List<DataKecamatan> dataKecamatanIbu = [];
  List<DataDesaKelurahan> dataDesaKelurahanIbu = [];
  List<DataDusun> dataDusunIbu = [];

  DataKabupatenKota? selectedKabupatenIbu;
  DataKecamatan? selectedKecamatanIbu;
  DataDesaKelurahan? selectedDesaIbu;
  DataDusun? selectedDusunIbu;

  String selectedJenisKBIbu = '-';
  String? selectedGolonnganDarahIbu;
  String selectedGolDarahIbu = '-';

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
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        tanggalKelahiranAnakSebelumnyaIbuController.text =
            "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
    // Jika pickedDate adalah null, tidak melakukan apa-apa
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
    context.read<AlamatSaveCubit>().getDataWilayah();
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

  bool validateAyah() {
    // Validasi semua field di bagian Ayah
    bool isValid = kkAyahController.text.isNotEmpty &&
        nikAyahController.text.isNotEmpty &&
        namaAyahController.text.isNotEmpty &&
        tempatLahirAyahController.text.isNotEmpty &&
        tanggalLahirAyahController.text.isNotEmpty &&
        alamatAyahController.text.isNotEmpty &&
        teleponAyahController.text.isNotEmpty &&
        rTAyahController.text.isNotEmpty &&
        rWAyahController.text.isNotEmpty &&
        selectedKabupatenAyah != null &&
        selectedKecamatanAyah != null &&
        selectedDesaAyah != null &&
        selectedDusunAyah != null &&
        selectedGolDarahAyah != null;
    logger.d(
        'Validasi Data Ayah: KK: ${kkAyahController.text}, NIK: ${nikAyahController.text}, Nama: ${namaAyahController.text}, Tempat Lahir: ${tempatLahirAyahController.text}, Tanggal Lahir: ${tanggalLahirAyahController.text}, Alamat: ${alamatAyahController.text}, Telepon: ${teleponAyahController.text}, RT: ${rTAyahController.text}, RW: ${rWAyahController.text}, Kabupaten: ${selectedKabupatenAyah?.namaKabupatenKota}, Kecamatan: ${selectedKecamatanAyah?.namaKecamatan}, Desa: ${selectedDesaAyah?.namaDesaKelurahan}, Dusun: ${selectedDusunAyah?.namaDusun}, Golongan Darah: ${selectedGolDarahAyah}');

    if (isValid) {
      logger.d('Validasi Data Ayah Berhasil'); // Pindah ke tab Data Ibu
      return true;
    } else {
      logger.d('Validasi Data Ayah Gagal, lengkapi data terlebih dahulu');

      return false;
    }
  }

  void _goToNextTab() {
    logger.d('Go To Data Ibu');

    // Validasi semua field di bagian Ayah
    bool isValid = kkAyahController.text.isNotEmpty &&
        nikAyahController.text.isNotEmpty &&
        namaAyahController.text.isNotEmpty &&
        tempatLahirAyahController.text.isNotEmpty &&
        tanggalLahirAyahController.text.isNotEmpty &&
        alamatAyahController.text.isNotEmpty &&
        teleponAyahController.text.isNotEmpty &&
        rTAyahController.text.isNotEmpty &&
        rWAyahController.text.isNotEmpty &&
        selectedKabupatenAyah != null &&
        selectedKecamatanAyah != null &&
        selectedDesaAyah != null &&
        selectedDusunAyah != null &&
        selectedGolDarahAyah != null;

    if (isValid) {
      logger.d('Validasi Data Ayah Berhasil, pindah ke Data Ibu');
      _tabController.animateTo(1); // Pindah ke tab Data Ibu
    } else {
      logger.d('Validasi Data Ayah Gagal, lengkapi data terlebih dahulu');
      showTopSnackBar(
          Overlay.of(context),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(milliseconds: 2200),
          reverseAnimationDuration: const Duration(milliseconds: 300),
          TopSnackbarWidget()
              .error('Terdapat data yang kosong, harap di cek kembali'));
    }
  }

  void _navigateBack() {
    _tabController.animateTo(0);
  }

  //! validate formKeyController
  // ? Ayah
  final GlobalKey<FormFieldState> kkAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> nikAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> namaAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tempatLahirAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tanggalLahirAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> alamatAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> teleponAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rtAyahKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rwAyahKey = GlobalKey<FormFieldState>();

// ? Ibu
  final GlobalKey<FormFieldState> kkIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> nikIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> namaIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tempatLahirIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tanggalLahirIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> alamatIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> teleponIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rtIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> rwIbuKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tanggalKelahiranAnakSebelumnyaIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> jumlahAnakIbuKey =
      GlobalKey<FormFieldState>();
//!selected
// ? Ayah
  final GlobalKey<FormFieldState> selectedKabupatenAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedKecamatanAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDesaAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDusunAyahKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedGolDarahAyahKey =
      GlobalKey<FormFieldState>();

// ? Ibu
  final GlobalKey<FormFieldState> selectedKabupatenIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedKecamatanIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDesaIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedDusunIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedJenisKBIbuKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> selectedGolDarahIbuKey =
      GlobalKey<FormFieldState>();

// String? selectedProvinsiAyah;
//   String? selectedKabupatenAyah;
//   String? selectedKecamatanAyah;
//   String? selectedDesaAyah;
//   String? selectedDusunAyahId;

  bool _isGenerateAyahValid() {
    return tempatLahirAyahController.text.isNotEmpty &&
        tanggalLahirAyahController.text.isNotEmpty &&
        selectedKabupatenAyah !=
            null && // Check if selectedKabupatenAyah is not null
        selectedKecamatanAyah !=
            null; // Check if selectedDusunAyahId is not null
  }

  bool _isGenerateIbuValid() {
    return tempatLahirIbuController.text.isNotEmpty &&
        tanggalLahirIbuController.text.isNotEmpty &&
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
                      unselectedLabelColor: textSecondary1,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(text: 'Data Ayah'),
                        Tab(text: 'Data Ibu'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
                    // buildWhen: (previous, current) => current is ShowAllSection,
                    builder: (context, state) {
                      logger.d('state is ${state.toString()}');
                      debugPrint(state.toString());
                      if (state is GetAlamatProccessState) {
                        return const Expanded(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: bluePrimaryMain,
                          )),
                        );
                      }
                      if (state is GetAlamatSuccessState) {
                        logger.d(
                            'length data wilayah ${state.dataWilayahModel.provinsi.kabupatenKota.length}');
                        if (dataKabupatenKotaAyah.isEmpty ||
                            dataKabupatenKotaIbu.isEmpty) {
                          dataKabupatenKotaAyah.addAll(
                              state.dataWilayahModel.provinsi.kabupatenKota);
                          dataKabupatenKotaIbu.addAll(
                              state.dataWilayahModel.provinsi.kabupatenKota);
                        }

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
                                        BlocConsumer<GenerateKkCubit,
                                            GenerateKkState>(
                                          listener: (context, stateKK) {
                                            if (stateKK is GenerateKKSuccess) {
                                              kkAyahController.text = stateKK
                                                  .data.data.nomorKartuKeluarga;
                                            }
                                          },
                                          builder: (context, stateKK) {
                                            if (stateKK is GenerateKKLoading) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            return Row(
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
                                                    key: kkAyahKey,
                                                    controller:
                                                        kkAyahController,
                                                    hintText:
                                                        'Masukan Nomor KK',
                                                    isPasswordField: false,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    obscureText: false,
                                                    validators: [
                                                      (value) =>
                                                          Validator.consistOf(
                                                              value,
                                                              16,
                                                              "KK harus terdiri atas 16 digit"),
                                                      (value) => Validator.required(
                                                          value,
                                                          "KK ayah tidak boleh kosong"),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
// Validasi sebelum mengizinkan generate
                                                    if (_isGenerateAyahValid()) {
                                                      logger.d(
                                                          'provinsi id ayah ${state.dataWilayahModel.provinsi.id}');
                                                      logger.d(
                                                          'kabupaten id ayah ${selectedKabupatenAyah?.id}');
                                                      logger.d(
                                                          'kecamatan id ayah ${selectedKecamatanAyah?.id}');
                                                      // Logika untuk generate
                                                      context
                                                          .read<
                                                              GenerateKkCubit>()
                                                          .getGenerateKK(
                                                              state
                                                                  .dataWilayahModel
                                                                  .provinsi
                                                                  .id,
                                                              selectedKabupatenAyah!
                                                                  .id,
                                                              selectedKecamatanAyah!
                                                                  .id,
                                                              tanggalLahirAyahController
                                                                  .text);
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
                                                  child: Image(
                                                    width: 38,
                                                    height: 38,
                                                    color: greenPrimaryMain,
                                                    image: AssetImage(
                                                      imageRestart,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
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
                                        BlocConsumer<GenerateNikCubit,
                                            GenerateNikState>(
                                          listener: (context, state) {
                                            if (state is GenerateNikSuccess) {
                                              nikAyahController.text = state
                                                  .data.data.nomorIndukKeluarga;
                                            }
                                            if (state is GenerateNikFailed) {
                                              showTopSnackBar(
                                                  Overlay.of(context),
                                                  animationDuration:
                                                      const Duration(
                                                          milliseconds: 600),
                                                  displayDuration:
                                                      const Duration(
                                                          milliseconds: 2200),
                                                  reverseAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  TopSnackbarWidget().error(
                                                      'Harap Isi KK terlebih Dahulu'));
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is GenerateNikLoading) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }

                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              spacing: 8,
                                              children: [
                                                Expanded(
                                                  child: TextFieldWidget(
                                                    key: nikAyahKey,
                                                    controller:
                                                        nikAyahController,
                                                    hintText: 'Masukan NIK',
                                                    isPasswordField: false,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    obscureText: false,
                                                    validators: [
                                                      (value) =>
                                                          Validator.consistOf(
                                                              value,
                                                              16,
                                                              "NIK ayah harus terdiri atas 16 digit"),
                                                      (value) => Validator.required(
                                                          value,
                                                          "NIK ayah tidak boleh kosong"),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (kkAyahController
                                                        .text.isEmpty) {
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
                                                              'KK Harus Diisi Terlebih Dahulu'));
                                                    } else {
                                                      // Validasi sebelum mengizinkan generate
                                                      if (_isGenerateAyahValid()) {
                                                        // Logika untuk generate
                                                        print(
                                                            "Generate button pressed");
                                                        context
                                                            .read<
                                                                GenerateNikCubit>()
                                                            .getGenerateNik(
                                                                kkAyahController
                                                                    .text,
                                                                tanggalLahirAyahController
                                                                    .text);
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
                                                            TopSnackbarWidget()
                                                                .error(
                                                                    'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate NIK'));
                                                      }
                                                    }
                                                  },
                                                  child: Image(
                                                    width: 38,
                                                    height: 38,
                                                    color: greenPrimaryMain,
                                                    image: AssetImage(
                                                      imageRestart,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
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
                                          key: namaAyahKey,
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
                                                    key: tempatLahirAyahKey,
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
                                                    key: tanggalLahirAyahKey,
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
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring: dataKabupatenKotaAyah
                                                        .isNotEmpty
                                                    ? false
                                                    : true,
                                                child: DropdownButtonFormField2<
                                                    DataKabupatenKota>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedKabupatenAyah, // Ini bisa null
                                                  hint: Text(
                                                    "Kabupaten",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  key: selectedKabupatenAyahKey,
                                                  items: dataKabupatenKotaAyah
                                                      .map((item) {
                                                    return DropdownMenuItem<
                                                        DataKabupatenKota>(
                                                      value: item,
                                                      child: Text(item
                                                          .namaKabupatenKota),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedKabupatenAyah =
                                                          value;
                                                      dataKecamatanAyah.clear();
                                                      dataKecamatanAyah.addAll(
                                                          value!.kecamatan);
                                                      //clear list
                                                      dataDesaKelurahanAyah
                                                          .clear();
                                                      dataDusunAyah.clear();

                                                      //clear data
                                                      selectedKecamatanAyah =
                                                          null;
                                                      selectedDesaAyah = null;
                                                      selectedDusunAyah = null;
                                                    });
                                                  },
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Kabupaten",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring:
                                                    dataKecamatanAyah.isNotEmpty
                                                        ? false
                                                        : true,
                                                child: DropdownButtonFormField2<
                                                    DataKecamatan>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedKecamatanAyah, // Ini bisa null
                                                  hint: Text(
                                                    "Kecamatan",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  items: dataKecamatanAyah
                                                      .map((item) {
                                                    return DropdownMenuItem<
                                                        DataKecamatan>(
                                                      value: item,
                                                      child: Text(
                                                          item.namaKecamatan),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedKecamatanAyah =
                                                          value;
                                                      dataDesaKelurahanAyah
                                                          .clear();
                                                      dataDesaKelurahanAyah
                                                          .addAll(value!
                                                              .desaKelurahan);

                                                      //clear list
                                                      dataDusunAyah.clear();

                                                      //clear data
                                                      selectedDesaAyah = null;
                                                      selectedDusunAyah = null;
                                                    });
                                                  },
                                                  key: selectedKecamatanAyahKey,
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Kecamatan",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
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
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring: dataDesaKelurahanAyah
                                                        .isNotEmpty
                                                    ? false
                                                    : true,
                                                child: DropdownButtonFormField2<
                                                    DataDesaKelurahan>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedDesaAyah, // Ini bisa null
                                                  hint: Text(
                                                    "Desa",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  items: dataDesaKelurahanAyah
                                                      .map((item) {
                                                    return DropdownMenuItem<
                                                        DataDesaKelurahan>(
                                                      value: item,
                                                      child: Text(item
                                                          .namaDesaKelurahan),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedDesaAyah = value;
                                                      dataDusunAyah.clear();
                                                      dataDusunAyah
                                                          .addAll(value!.dusun);

                                                      //clear data
                                                      selectedDusunAyah = null;
                                                    });
                                                  },
                                                  key: selectedDesaAyahKey,
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Desa",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring:
                                                    dataDusunAyah.isNotEmpty
                                                        ? false
                                                        : true,
                                                child: DropdownButtonFormField2<
                                                    DataDusun>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedDusunAyah, // Ini bisa null
                                                  hint: Text(
                                                    "Dusun",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  key: selectedDusunAyahKey,
                                                  items:
                                                      dataDusunAyah.map((item) {
                                                    return DropdownMenuItem<
                                                        DataDusun>(
                                                      value: item,
                                                      child:
                                                          Text(item.namaDusun),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedDusunAyah = value;
                                                    });
                                                  },
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Dusun",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
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
                                            Expanded(
                                              child: TextFieldWidget(
                                                key: rtAyahKey,
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
                                                key: rwAyahKey,
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
                                          key: alamatAyahKey,
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
                                          key: teleponAyahKey,
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
                                          key: selectedGolDarahAyahKey,
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
                                        BlocConsumer<GenerateKkCubit,
                                            GenerateKkState>(
                                          listener: (context, stateKK) {
                                            if (stateKK is GenerateKKSuccess) {
                                              kkIbuController.text = stateKK
                                                  .data.data.nomorKartuKeluarga;
                                            }
                                          },
                                          builder: (context, stateKK) {
                                            if (stateKK is GenerateKKLoading) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              spacing: 8,
                                              children: [
                                                Expanded(
                                                  child: TextFieldWidget(
                                                    controller: kkIbuController,
                                                    hintText:
                                                        'Masukan Nomor KK',
                                                    isPasswordField: false,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    obscureText: false,
                                                    validators: [
                                                      (value) =>
                                                          Validator.consistOf(
                                                              value,
                                                              16,
                                                              "KK harus terdiri atas 16 digit"),
                                                      (value) => Validator.required(
                                                          value,
                                                          "KK Ibu tidak boleh kosong"),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
// Validasi sebelum mengizinkan generate
                                                    if (_isGenerateIbuValid()) {
                                                      // Logika untuk generate
                                                      logger.d(
                                                          'provinsi id ibu ${state.dataWilayahModel.provinsi.id}');
                                                      logger.d(
                                                          'kabupaten id ibu ${selectedKabupatenIbu?.id}');
                                                      logger.d(
                                                          'kecataman id ibu ${selectedKecamatanIbu?.id}');
                                                      print(
                                                          "Generate button pressed");

                                                      context
                                                          .read<
                                                              GenerateKkCubit>()
                                                          .getGenerateKK(
                                                              state
                                                                  .dataWilayahModel
                                                                  .provinsi
                                                                  .id,
                                                              selectedKabupatenIbu!
                                                                  .id,
                                                              selectedKecamatanIbu!
                                                                  .id,
                                                              tanggalLahirIbuController
                                                                  .text);
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
                                                  child: Image(
                                                    width: 38,
                                                    height: 38,
                                                    color: greenPrimaryMain,
                                                    image: AssetImage(
                                                      imageRestart,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
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

                                        BlocConsumer<GenerateNikCubit,
                                            GenerateNikState>(
                                          listener: (context, state) {
                                            if (state is GenerateNikSuccess) {
                                              nikIbuController.text = state
                                                  .data.data.nomorIndukKeluarga;
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is GenerateNikLoading) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              spacing: 8,
                                              children: [
                                                Expanded(
                                                  child: TextFieldWidget(
                                                    controller:
                                                        nikIbuController,
                                                    hintText: 'Masukan NIK',
                                                    isPasswordField: false,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    obscureText: false,
                                                    validators: [
                                                      (value) =>
                                                          Validator.consistOf(
                                                              value,
                                                              16,
                                                              "NIk Ibu harus terdiri atas 16 digit"),
                                                      (value) => Validator.required(
                                                          value,
                                                          "NIK Ibu tidak boleh kosong"),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (kkIbuController
                                                        .text.isEmpty) {
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
                                                              'KK Harus Diisi Terlebih Dahulu'));
                                                    } else {
                                                      // Validasi sebelum mengizinkan generate
                                                      if (_isGenerateIbuValid()) {
                                                        // Logika untuk generate
                                                        print(
                                                            "Generate button pressed");
                                                        context
                                                            .read<
                                                                GenerateNikCubit>()
                                                            .getGenerateNik(
                                                                kkIbuController
                                                                    .text,
                                                                tanggalLahirIbuController
                                                                    .text);
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
                                                            TopSnackbarWidget()
                                                                .error(
                                                                    'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate NIK'));
                                                      }
                                                    }
                                                  },
                                                  child: Image(
                                                    width: 38,
                                                    height: 38,
                                                    color: greenPrimaryMain,
                                                    image: AssetImage(
                                                      imageRestart,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
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
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring: dataKabupatenKotaIbu
                                                        .isNotEmpty
                                                    ? false
                                                    : true,
                                                child: DropdownButtonFormField2<
                                                    DataKabupatenKota>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedKabupatenIbu, // Ini bisa null
                                                  hint: Text(
                                                    "Kabupaten",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  items: dataKabupatenKotaIbu
                                                      .map((item) {
                                                    return DropdownMenuItem<
                                                        DataKabupatenKota>(
                                                      value: item,
                                                      child: Text(item
                                                          .namaKabupatenKota),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedKabupatenIbu =
                                                          value;
                                                      dataKecamatanIbu.clear();
                                                      dataKecamatanIbu.addAll(
                                                          value!.kecamatan);
                                                      //clear list
                                                      dataDesaKelurahanIbu
                                                          .clear();
                                                      dataDusunIbu.clear();

                                                      //clear data
                                                      selectedKecamatanIbu =
                                                          null;
                                                      selectedDesaIbu = null;
                                                      selectedDusunIbu = null;
                                                    });
                                                  },
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Kabupaten",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring:
                                                    dataKecamatanIbu.isNotEmpty
                                                        ? false
                                                        : true,
                                                child: DropdownButtonFormField2<
                                                    DataKecamatan>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedKecamatanIbu, // Ini bisa null
                                                  hint: Text(
                                                    "Kecamatan",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  items: dataKecamatanIbu
                                                      .map((item) {
                                                    return DropdownMenuItem<
                                                        DataKecamatan>(
                                                      value: item,
                                                      child: Text(
                                                          item.namaKecamatan),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedKecamatanIbu =
                                                          value;
                                                      dataDesaKelurahanIbu
                                                          .clear();
                                                      dataDesaKelurahanIbu
                                                          .addAll(value!
                                                              .desaKelurahan);

                                                      //clear list
                                                      dataDusunIbu.clear();

                                                      //clear data
                                                      selectedDesaIbu = null;
                                                      selectedDusunIbu = null;
                                                    });
                                                  },
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Kecamatan",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
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
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring: dataDesaKelurahanIbu
                                                        .isNotEmpty
                                                    ? false
                                                    : true,
                                                child: DropdownButtonFormField2<
                                                    DataDesaKelurahan>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedDesaIbu, // Ini bisa null
                                                  hint: Text(
                                                    "Desa",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  items: dataDesaKelurahanIbu
                                                      .map((item) {
                                                    return DropdownMenuItem<
                                                        DataDesaKelurahan>(
                                                      value: item,
                                                      child: Text(item
                                                          .namaDesaKelurahan),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedDesaIbu = value;
                                                      dataDusunIbu.clear();
                                                      dataDusunIbu
                                                          .addAll(value!.dusun);

                                                      //clear data
                                                      selectedDusunIbu = null;
                                                    });
                                                  },
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Desa",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: IgnorePointer(
                                                ignoring:
                                                    dataDusunIbu.isNotEmpty
                                                        ? false
                                                        : true,
                                                child: DropdownButtonFormField2<
                                                    DataDusun>(
                                                  isExpanded: true,
                                                  style: AppTextStyles
                                                      .primaryTextNormal
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                  value:
                                                      selectedDusunIbu, // Ini bisa null
                                                  hint: Text(
                                                    "Dusun",
                                                    style: AppTextStyles
                                                        .secoundaryTextNormal
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  buttonStyleData:
                                                      const ButtonStyleData(
                                                    elevation: 0,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                      color: backgroundWhite10,
                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  items:
                                                      dataDusunIbu.map((item) {
                                                    return DropdownMenuItem<
                                                        DataDusun>(
                                                      value: item,
                                                      child:
                                                          Text(item.namaDusun),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedDusunIbu = value;
                                                    });
                                                  },
                                                  onSaved: (value) {},
                                                  validator: null,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 12),
                                                    hintText: "Dusun",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                    filled: true,
                                                    fillColor:
                                                        backgroundWhite10,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color:
                                                                  redPrimaryMain),
                                                    ),
                                                  ),
                                                ),
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
                                          // validator: (value) {
                                          //   if (value == null ||
                                          //       value.isEmpty) {
                                          //     return "Tanggal harus dipilih";
                                          //   }
                                          //   return null;
                                          // },
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
                                            // (value) => Validator.required(value,
                                            //     "Jumlah Anak tidak boleh kosong"),
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
                                          mainButton: () {
                                            bool isValidAllDataAyah =
                                                validateAyah();
                                            logger.d(isValidAllDataAyah);
                                            if (isValidAllDataAyah) {
                                              print('Form valid');
                                              // Validate the form
                                              if (formkey.currentState!
                                                  .validate()) {
                                                PostOrangTuaBody dataOrangTua =
                                                    PostOrangTuaBody(
                                                  ayah: Ayah(
                                                    alamat: alamatAyahController
                                                        .text,
                                                    nomorKartuKeluarga:
                                                        kkAyahController.text,
                                                    dusunId:
                                                        selectedDusunAyah!.id,
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
                                                                    .text !=
                                                                ""
                                                            ? tanggalKelahiranAnakSebelumnyaIbuController
                                                                .text
                                                            : null,
                                                    jumlahAnak:
                                                        jumlahAnakIbuController
                                                                    .text !=
                                                                ""
                                                            ? int.parse(
                                                                jumlahAnakIbuController
                                                                    .text)
                                                            : 0,
                                                    jenisKb:
                                                        selectedJenisKBIbu!,
                                                    alamat: alamatIbuController
                                                        .text,
                                                    nomorKartuKeluarga:
                                                        kkIbuController.text,
                                                    dusunId:
                                                        selectedDusunIbu!.id,
                                                    golDarah:
                                                        selectedGolDarahIbu!,
                                                    namaIbu:
                                                        namaIbuController.text,
                                                    nik: nikIbuController.text,
                                                    nomorTelepon:
                                                        teleponIbuController
                                                            .text,
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

                                                // showTopSnackBar(
                                                //     Overlay.of(context),
                                                //     animationDuration:
                                                //         const Duration(
                                                //             milliseconds: 600),
                                                //     displayDuration:
                                                //         const Duration(
                                                //             milliseconds: 2200),
                                                //     reverseAnimationDuration:
                                                //         const Duration(
                                                //             milliseconds: 300),
                                                //     TopSnackbarWidget().success(
                                                //         'Berhasil Membuat Data Register Orang Tua'));
                                              } else {
                                                print("Form tidak valid");
                                                showTopSnackBar(
                                                    Overlay.of(context),
                                                    animationDuration:
                                                        const Duration(
                                                            milliseconds: 600),
                                                    displayDuration:
                                                        const Duration(
                                                            milliseconds: 2200),
                                                    reverseAnimationDuration:
                                                        const Duration(
                                                            milliseconds: 300),
                                                    TopSnackbarWidget().error(
                                                        'Terdapat data yang kosong pada data Ibu, harap di cek kembali'));
                                              }
                                            } else {
                                              showTopSnackBar(
                                                  Overlay.of(context),
                                                  animationDuration:
                                                      const Duration(
                                                          milliseconds: 600),
                                                  displayDuration:
                                                      const Duration(
                                                          milliseconds: 2200),
                                                  reverseAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  TopSnackbarWidget().error(
                                                      'Terdapat data Ayah yang kosong, harap di cek kembali'));
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
