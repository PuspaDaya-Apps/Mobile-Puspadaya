import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../model/data_wilayah_model.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import '../../detailRegisterOrangTua/model/get_orangtua_detail_response.dart';
import 'package:puspadaya/app/feature/updateRegisterOrangTua/bloc/update_register_orang_tua_bloc.dart';

import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../alatUkur/detail/view/detail_alat_ukur.dart';
import '../../detailRegisterOrangTua/bloc/detail_register_orang_tua_bloc.dart';
import '../model/patch_orang_tua_body.dart' as PatchOrangTua;

class UpdateRegisterOrangTua extends StatelessWidget {
  final String ayahId;
  const UpdateRegisterOrangTua({super.key, required this.ayahId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlamatSaveCubit>(
          create: (BuildContext context) => AlamatSaveCubit(),
        ),
        BlocProvider<UpdateRegisterOrangTuaBloc>(
          create: (BuildContext context) => UpdateRegisterOrangTuaBloc(),
        ),
        BlocProvider<DetailRegisterOrangTuaBloc>(
          create: (BuildContext context) => DetailRegisterOrangTuaBloc(),
        ),
      ],
      child: UpdateRegisterOrangTuaView(
        ayahId: ayahId,
      ),
    );
  }
}

class UpdateRegisterOrangTuaView extends StatefulWidget {
  final String ayahId;
  const UpdateRegisterOrangTuaView({super.key, required this.ayahId});

  @override
  State<UpdateRegisterOrangTuaView> createState() =>
      _UpdateRegisterOrangTuaViewState();
}

class _UpdateRegisterOrangTuaViewState extends State<UpdateRegisterOrangTuaView>
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

  String? selectedGolDarahAyah;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  //? function handler controler ayah

  Future<void> _selectDateAyah(BuildContext context) async {
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
  List<DataKabupatenKota> dataKabupatenKotaIbu = [];
  List<DataKecamatan> dataKecamatanIbu = [];
  List<DataDesaKelurahan> dataDesaKelurahanIbu = [];
  List<DataDusun> dataDusunIbu = [];

  DataKabupatenKota? selectedKabupatenIbu;
  DataKecamatan? selectedKecamatanIbu;
  DataDesaKelurahan? selectedDesaIbu;
  DataDusun? selectedDusunIbu;

  String? selectedJenisKBIbu;
  String? selectedGolonnganDarahIbu;
  String? selectedGolDarahIbu;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  //? function handler controler Ibu

  Future<void> _selectDateIbu(BuildContext context) async {
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

  Future<void> _selectDateKelahiranSebelumnyaIbu(BuildContext context) async {
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
    context
        .read<DetailRegisterOrangTuaBloc>()
        .add(FeathingDetailRegisterOrangTua(ayahId: widget.ayahId));

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Perbarui Data Orang Tua',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
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
            child: BlocSelector<DetailRegisterOrangTuaBloc,
                DetailRegisterOrangTuaState, GetOrangtuaDetailResponseModel?>(
              selector: (state) {
                if (state is DetailRegisterOrangTuaSuccess) {
                  return state.getOrangTuaDetailResponse;
                }
                return null;
              },
              builder: (context, detailData) {
                if (detailData == null) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: Center(
                      child: SpinKitThreeBounce(
                        color: bluePrimaryMain,
                        size: 50.0,
                      ),
                    ),
                  ); // Jika data masih loading
                }
                //? Set Data Ayah
                if (kkAyahController.text.isEmpty) {
                  kkAyahController.text =
                      detailData.data.ayah.kartuKeluarga.nomorKartuKeluarga;
                  nikAyahController.text = detailData.data.ayah.nik;
                  namaAyahController.text = detailData.data.ayah.namaAyah;
                  tempatLahirAyahController.text =
                      detailData.data.ayah.tempatLahir;
                  tanggalLahirAyahController.text = DateFormat('yyyy-MM-dd')
                      .format(detailData.data.ayah.tanggalLahir);
                  alamatAyahController.text = detailData.data.ayah.alamat;

                  if (detailData.data.ayah.nomorTelepon != "0") {
                    teleponAyahController.text =
                        detailData.data.ayah.nomorTelepon;
                  }

                  rTAyahController.text = detailData.data.ayah.rt;
                  rWAyahController.text = detailData.data.ayah.rw;
                  selectedGolDarahAyah = detailData.data.ayah.golDarah;
                  selectedDisabilityLabelsAyah = detailData
                      .data.ayah.jenisDisabilitas!
                      .map((e) => e.namaDisabilitas)
                      .toList();
                }

                //? Set Data Ibu
                if (kkIbuController.text.isEmpty) {
                  kkIbuController.text =
                      detailData.data.ibu.kartuKeluarga.nomorKartuKeluarga;
                  nikIbuController.text = detailData.data.ibu.nik;
                  namaIbuController.text = detailData.data.ibu.nama;
                  tempatLahirIbuController.text =
                      detailData.data.ibu.tempatLahir;
                  tanggalLahirIbuController.text = DateFormat('yyyy-MM-dd')
                      .format(detailData.data.ibu.tanggalLahir);
                  alamatIbuController.text = detailData.data.ibu.alamat;
                  tanggalKelahiranAnakSebelumnyaIbuController.text =
                      detailData.data.ibu.tanggalMelahirkanSebelumnya != null
                          ? detailData.data.ibu.tanggalMelahirkanSebelumnya!
                          : "";
                  if (detailData.data.ibu.nomorTelepon != "0") {
                    teleponIbuController.text =
                        detailData.data.ibu.nomorTelepon;
                  }

                  rTIbuController.text = detailData.data.ibu.rt;
                  rWIbuController.text = detailData.data.ibu.rw;
                  jumlahAnakIbuController.text =
                      detailData.data.ibu.jumlahAnak.toString();
                  selectedGolDarahIbu = detailData.data.ibu.golDarah;
                  selectedJenisKBIbu = detailData.data.ibu.jenisKB;
                  selectedDisabilityLabelsIbu = detailData
                      .data.ibu.jenisDisabilitas!
                      .map((e) => e.namaDisabilitas)
                      .toList();
                }
                return Column(
                  children: [
                    BlocListener<UpdateRegisterOrangTuaBloc,
                        UpdateRegisterOrangTuaState>(
                      listener: (context, state) {
                        if (state is UpdateRegisterOrangTuaFailedState) {
                          showTopSnackBar(
                            Overlay.of(context),
                            animationDuration:
                                const Duration(milliseconds: 600),
                            displayDuration: const Duration(milliseconds: 2200),
                            reverseAnimationDuration:
                                const Duration(milliseconds: 300),
                            TopSnackbarWidget().error(state.error),
                          );
                        }
                        if (state is UpdateRegisterOrangTuaSuccesState) {
                          Navigator.pop(context, 1);
                        }
                      },
                      child: Container(
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
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
                      builder: (context, state) {
                        if (state is GetAlamatSuccessState) {
                          if (dataKabupatenKotaAyah.isEmpty ||
                              dataKabupatenKotaIbu.isEmpty) {
                            //ayah
                            dataKabupatenKotaAyah.addAll(
                                state.dataWilayahModel.provinsi.kabupatenKota);
                            selectedKabupatenAyah =
                                dataKabupatenKotaAyah.firstWhere((element) =>
                                    element.id ==
                                    detailData.data.ayah.dusun.desaKelurahan
                                        .kecamatan.kabupaten.id);

                            dataKecamatanAyah
                                .addAll(selectedKabupatenAyah!.kecamatan);
                            selectedKecamatanAyah =
                                dataKecamatanAyah.firstWhere((element) =>
                                    element.id ==
                                    detailData.data.ayah.dusun.desaKelurahan
                                        .kecamatan.id);
                            dataDesaKelurahanAyah
                                .addAll(selectedKecamatanAyah!.desaKelurahan);
                            selectedDesaAyah = dataDesaKelurahanAyah.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData
                                        .data.ayah.dusun.desaKelurahan.id);
                            dataDusunAyah.addAll(selectedDesaAyah!.dusun);
                            selectedDusunAyah = dataDusunAyah.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData.data.ayah.dusun.id);

                            //ibu
                            dataKabupatenKotaIbu.addAll(
                                state.dataWilayahModel.provinsi.kabupatenKota);
                            selectedKabupatenIbu =
                                dataKabupatenKotaIbu.firstWhere((element) =>
                                    element.id ==
                                    detailData.data.ibu.dusun.desaKelurahan
                                        .kecamatan.kabupaten.id);

                            dataKecamatanIbu
                                .addAll(selectedKabupatenIbu!.kecamatan);
                            selectedKecamatanIbu = dataKecamatanIbu.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData.data.ibu.dusun.desaKelurahan
                                        .kecamatan.id);
                            dataDesaKelurahanIbu
                                .addAll(selectedKecamatanIbu!.desaKelurahan);
                            selectedDesaIbu = dataDesaKelurahanIbu.firstWhere(
                                (element) =>
                                    element.id ==
                                    detailData.data.ibu.dusun.desaKelurahan.id);
                            dataDusunIbu.addAll(selectedDesaIbu!.dusun);
                            selectedDusunIbu = dataDusunIbu.firstWhere(
                                (element) =>
                                    element.id == detailData.data.ibu.dusun.id);
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: kkAyahController,
                                            hintText:
                                                'Masukan Nomor Kartu Keluarga',
                                            isPasswordField: false,
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            validators: [
                                              (value) => Validator.consistOf(
                                                  value,
                                                  16,
                                                  "Masukkan 16 digit angka!"),
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'NIK',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: nikAyahController,
                                            hintText: 'Masukan NIK',
                                            isPasswordField: false,
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            validators: [
                                              (value) => Validator.consistOf(
                                                  value,
                                                  16,
                                                  "Masukkan 16 digit angka!"),
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Nama',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: namaAyahController,
                                            hintText: 'Masukan Nama',
                                            isPasswordField: false,
                                            keyboardType: TextInputType.text,
                                            obscureText: false,
                                            validators: [
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                                        (value) =>
                                                            Validator.required(
                                                                value),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                                        _selectDateAyah(
                                                            context);
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Alamat',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          Row(
                                            spacing: 8,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: IgnorePointer(
                                                  ignoring:
                                                      dataKabupatenKotaAyah
                                                              .isNotEmpty
                                                          ? false
                                                          : true,
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
                                                      ),
                                                      elevation: 0,
                                                    ),
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
                                                        dataKecamatanAyah
                                                            .clear();
                                                        dataKecamatanAyah
                                                            .addAll(value!
                                                                .kecamatan);
                                                        //clear list
                                                        dataDesaKelurahanAyah
                                                            .clear();
                                                        dataDusunAyah.clear();

                                                        //clear data
                                                        selectedKecamatanAyah =
                                                            null;
                                                        selectedDesaAyah = null;
                                                        selectedDusunAyah =
                                                            null;
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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                  ignoring: dataKecamatanAyah
                                                          .isNotEmpty
                                                      ? false
                                                      : true,
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
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
                                                        selectedDusunAyah =
                                                            null;
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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          Row(
                                            spacing: 8,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: IgnorePointer(
                                                  ignoring:
                                                      dataDesaKelurahanAyah
                                                              .isNotEmpty
                                                          ? false
                                                          : true,
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
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
                                                        selectedDesaAyah =
                                                            value;
                                                        dataDusunAyah.clear();
                                                        dataDusunAyah.addAll(
                                                            value!.dusun);

                                                        //clear data
                                                        selectedDusunAyah =
                                                            null;
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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
                                                      ),
                                                      elevation: 0,
                                                    ),
                                                    items: dataDusunAyah
                                                        .map((item) {
                                                      return DropdownMenuItem<
                                                          DataDusun>(
                                                        value: item,
                                                        child: Text(
                                                            item.namaDusun),
                                                      );
                                                    }).toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedDusunAyah =
                                                            value;
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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                                    (value) =>
                                                        Validator.required(
                                                            value),
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
                                                    (value) =>
                                                        Validator.required(
                                                            value),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: alamatAyahController,
                                            hintText: 'Masukan alamat lengkap',
                                            keyboardType: TextInputType.text,
                                            obscureText: false,
                                            isPasswordField: false,
                                            validators: [
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Nomor Telepon (WA aktif)',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: teleponAyahController,
                                            hintText: 'Masukan nomor telepon',
                                            keyboardType: TextInputType.phone,
                                            obscureText: false,
                                            isPasswordField: false,
                                            validators: [
                                              (value) => Validator.minLength(
                                                  value,
                                                  nullable: true,
                                                  10,
                                                  "Masukkan nomor yang benar!"),
                                              (value) => Validator.maxLength(
                                                  value,
                                                  nullable: true,
                                                  13,
                                                  "Masukkan nomor yang benar!"),
                                              // (value) =>
                                              //     Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Golongan Darah',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Disabilitas',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          // Tampilkan disabilitas yang dipilih
                                          Column(
                                            children:
                                                selectedDisabilityLabelsAyah
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
                                                    _removeDisabilityAyah(
                                                        label);
                                                  },
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                                        selectedDisabilitiesAyah,
                                                    onToggleDisability:
                                                        _toggleDisabilityAyah,
                                                    onAddCustomDisability:
                                                        (String
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: kkIbuController,
                                            hintText:
                                                'Masukan Nomor Kartu Keluarga',
                                            isPasswordField: false,
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            validators: [
                                              (value) => Validator.consistOf(
                                                  value,
                                                  16,
                                                  "Masukkan 16 digit angka!"),
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'NIK',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: nikIbuController,
                                            hintText: 'Masukan NIK',
                                            isPasswordField: false,
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            validators: [
                                              (value) => Validator.consistOf(
                                                  value,
                                                  16,
                                                  "Masukkan 16 digit angka!"),
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Nama',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: namaIbuController,
                                            hintText: 'Masukan Nama',
                                            isPasswordField: false,
                                            keyboardType: TextInputType.text,
                                            obscureText: false,
                                            validators: [
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                                        (value) =>
                                                            Validator.required(
                                                                value),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Alamat',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
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
                                                        dataKecamatanIbu
                                                            .clear();
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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                  ignoring: dataKecamatanIbu
                                                          .isNotEmpty
                                                      ? false
                                                      : true,
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
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
                                                        dataDusunIbu.addAll(
                                                            value!.dusun);

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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                  child:
                                                      DropdownButtonFormField2<
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
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        color:
                                                            backgroundWhite10,
                                                      ),
                                                      elevation: 0,
                                                    ),
                                                    items: dataDusunIbu
                                                        .map((item) {
                                                      return DropdownMenuItem<
                                                          DataDusun>(
                                                        value: item,
                                                        child: Text(
                                                            item.namaDusun),
                                                      );
                                                    }).toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedDusunIbu =
                                                            value;
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
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .copyWith(
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                      filled: true,
                                                      fillColor:
                                                          backgroundWhite10,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                                    (value) =>
                                                        Validator.required(
                                                            value),
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
                                                    (value) =>
                                                        Validator.required(
                                                            value),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: alamatIbuController,
                                            hintText: 'Masukan alamat lengkap',
                                            keyboardType: TextInputType.text,
                                            obscureText: false,
                                            isPasswordField: false,
                                            validators: [
                                              (value) =>
                                                  Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Nomor Telepon (WA aktif)',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: teleponIbuController,
                                            hintText: 'Masukan nomor telepon',
                                            keyboardType: TextInputType.phone,
                                            obscureText: false,
                                            isPasswordField: false,
                                            validators: [
                                              (value) => Validator.minLength(
                                                  value,
                                                  nullable: true,
                                                  10,
                                                  "Masukkan nomor yang benar!"),
                                              (value) => Validator.maxLength(
                                                  value,
                                                  nullable: true,
                                                  13,
                                                  "Masukkan nomor yang benar!"),
                                              // (value) =>
                                              //     Validator.required(value),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                                      style: TextStyle(
                                                          fontSize: 12),
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
                                                      value:
                                                          selectedGolDarahIbu,
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Tanggal lahiran Anak Sebelumnya',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Jumlah Anak',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          TextFieldWidget(
                                            controller: jumlahAnakIbuController,
                                            hintText: 'Jumlah Anak',
                                            keyboardType: TextInputType.number,
                                            obscureText: false,
                                            isPasswordField: false,
                                            validators: [
                                              // (value) => Validator.required(
                                              //     value,
                                              //     "Jumlah Anak tidak boleh kosong"),
                                            ],
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          const Text(
                                            'Disabilitas',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
                                          // Tampilkan disabilitas yang dipilih
                                          Column(
                                            children:
                                                selectedDisabilityLabelsIbu
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(8)),
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
                                                    onAddCustomDisability:
                                                        (String
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
                                              height: SizeConfig
                                                  .calHeightMultiplier(16)),
                                          ButtonPrimary(
                                            color: bluePrimaryMain,
                                            mainButtonMessage: 'Simpan',
                                            mainButton: () async {
                                              // Validate the form
                                              if (formkey.currentState!
                                                  .validate()) {
                                                debugPrint("Data Ayah");

                                                debugPrint("Data Ibu");
                                                PatchOrangTua.PatchOrangTuaBody
                                                    dataOrangTua = PatchOrangTua
                                                        .PatchOrangTuaBody(
                                                  ayah: PatchOrangTua.Ayah(
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
                                                                .text.isNotEmpty
                                                            ? teleponAyahController
                                                                .text
                                                            : null,
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
                                                      return PatchOrangTua
                                                          .JenisDisabilitas(
                                                              namaDisabilitas:
                                                                  e);
                                                    }).toList(),
                                                  ),
                                                  ibu: PatchOrangTua.Ibu(
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
                                                                .text.isNotEmpty
                                                            ? teleponIbuController
                                                                .text
                                                            : null,
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
                                                      return PatchOrangTua
                                                          .JenisDisabilitas(
                                                              namaDisabilitas:
                                                                  e);
                                                    }).toList(),
                                                  ),
                                                );

                                                logger.d(
                                                    dataOrangTua.ayah.golDarah);

                                                context
                                                    .read<
                                                        UpdateRegisterOrangTuaBloc>()
                                                    .add(
                                                        SendUpdateRegisterOrangTua(
                                                            ayahId:
                                                                widget.ayahId,
                                                            patchOrangTuaBody:
                                                                dataOrangTua));
                                              } else {
                                                print("Form tidak valid");
                                              }
                                            },
                                          ),
                                          SizedBox(
                                              height: SizeConfig
                                                  .calHeightMultiplier(20)),
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
                );
              },
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
