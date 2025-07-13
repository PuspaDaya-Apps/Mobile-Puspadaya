import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:puspadaya/app/feature/alatUkur/detail/view/detail_alat_ukur.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/cubit/generate_kk_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/cubit/generate_nik_cubit.dart';
import 'package:puspadaya/app/model/data_wilayah_model.dart';
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/outline_button_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/text_field_widget2.dart';
import 'package:puspadaya/app/view/widget/top_snackbar/top_snackbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/utils/constant/constanst.dart';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UpdateRegisterIbu extends StatelessWidget {
  final GlobalKey<FormState> formIbukey;
  final ScrollController ibuScrollController;

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

  //? Ibu selected
  List<DataKabupatenKota> dataKabupatenKotaIbu;
  List<DataKecamatan> dataKecamatanIbu;
  List<DataDesaKelurahan> dataDesaKelurahanIbu;
  List<DataDusun> dataDusunIbu;

  DataKabupatenKota? selectedKabupatenIbu;
  DataKecamatan? selectedKecamatanIbu;
  DataDesaKelurahan? selectedDesaIbu;
  DataDusun? selectedDusunIbu;


  String selectedJenisKB;
  String selectedGolDarahIbu;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu;
  List<bool> selectedDisabilitiesAyah;
  List<String> selectedDisabilityLabelsIbu;

  //! validate formKeyController
  // ? Ibu
  final GlobalKey<FormFieldState> kkIbuKey;
  final GlobalKey<FormFieldState> nikIbuKey;
  final GlobalKey<FormFieldState> namaIbuKey;
  final GlobalKey<FormFieldState> tempatLahirIbuKey;
  final GlobalKey<FormFieldState> tanggalLahirIbuKey;
  final GlobalKey<FormFieldState> alamatIbuKey;
  final GlobalKey<FormFieldState> teleponIbuKey;
  final GlobalKey<FormFieldState> rtIbuKey;
  final GlobalKey<FormFieldState> rwIbuKey;

  final GlobalKey<FormFieldState> selectedKabupatenIbuKey;
  final GlobalKey<FormFieldState> selectedKecamatanIbuKey;
  final GlobalKey<FormFieldState> selectedDesaIbuKey;
  final GlobalKey<FormFieldState> selectedDusunIbuKey;
  final GlobalKey<FormFieldState> selectedGolDarahIbuKey;
  final GlobalKey<FormFieldState> jenisKBKey;
  final GlobalKey<FormFieldState> jumlahAnakIbuKey;
  final GlobalKey<FormFieldState> tanggalKelahiranAnakSebelumnyaIbuKey;

  // !Ibu fokus node
  final FocusNode kkIbuFocusNode;
  final FocusNode nikIbuFocusNode;
  final FocusNode namaIbuFocusNode;
  final FocusNode tempatLahirIbuFocusNode;
  final FocusNode tanggalLahirIbuFocusNode;
  final FocusNode alamatIbuFocusNode;
  final FocusNode teleponIbuFocusNode;
  final FocusNode rtIbuFocusNode;
  final FocusNode rwIbuFocusNode;

  final FocusNode selectedKabupatenIbuFocusNode;
  final FocusNode selectedKecamatanIbuFocusNode;
  final FocusNode selectedDesaIbuFocusNode;
  final FocusNode selectedDusunIbuFocusNode;
  final FocusNode selectedGolDarahIbuFocusNode;
  final FocusNode jenisKBFocusNode;
  final FocusNode jumlahAnakIbuFocusNode;
  final FocusNode tanggalKelahiranAnakSebelumnyaIbuFocusNode;

  final Future<void> Function(BuildContext) onSelectDate;

  final Future<void> Function(BuildContext) onSelectDateKelahiranSebelumnya;
  final void Function(String) removeDisability;
  final void Function(int) toggleDisabilityIbu;
  //  bool _isGenerateIbuValid() {
  final bool Function() isGenerateIbuValid;

  final DataWilayahModel dataWilayahModel;

  final void Function(DataKabupatenKota) handleKabupatenIbuChanged;
  final void Function(DataKecamatan) handleKecamatanIbuChanged;
  final void Function(DataDesaKelurahan) handleDesaIbuChanged;
  final void Function(DataDusun) handleDusunIbuChanged;
  final void Function(dynamic) handleGolDarahIbuChanged;
  final void Function(dynamic) handleJenisKBChanged;
  final void Function() submitIbuForm;

  UpdateRegisterIbu({
    super.key,
    // form
    required this.formIbukey,
    // scroll
    required this.ibuScrollController,
    // controllers
    required this.kkIbuController,
    required this.nikIbuController,
    required this.namaIbuController,
    required this.tempatLahirIbuController,
    required this.tanggalLahirIbuController,
    required this.alamatIbuController,
    required this.teleponIbuController,
    required this.rTIbuController,
    required this.rWIbuController,
    required this.selectedJenisKB,
    required this.jumlahAnakIbuController,
    required this.tanggalKelahiranAnakSebelumnyaIbuController,
    // data wilIbu
    required this.dataKabupatenKotaIbu,
    required this.dataKecamatanIbu,
    required this.dataDesaKelurahanIbu,
    required this.dataDusunIbu,
    // selected wilIbu
    this.selectedKabupatenIbu,
    this.selectedKecamatanIbu,
    this.selectedDesaIbu,
    this.selectedDusunIbu,
    // selected golongan darah
    this.selectedGolDarahIbu = '-',
    // selected disabilities
    this.selectedDisabilitiesIbu = const [],
    this.selectedDisabilitiesAyah = const [],
    this.selectedDisabilityLabelsIbu = const [],
    // form key
    required this.kkIbuKey,
    required this.nikIbuKey,
    required this.namaIbuKey,
    required this.tempatLahirIbuKey,
    required this.tanggalLahirIbuKey,
    required this.alamatIbuKey,
    required this.teleponIbuKey,
    required this.rtIbuKey,
    required this.rwIbuKey,
    required this.jenisKBKey,
    required this.jumlahAnakIbuKey,
    required this.tanggalKelahiranAnakSebelumnyaIbuKey,
    // selected wilIbu key
    required this.selectedKabupatenIbuKey,
    required this.selectedKecamatanIbuKey,
    required this.selectedDesaIbuKey,
    required this.selectedDusunIbuKey,
    required this.selectedGolDarahIbuKey,
    // focus node
    required this.kkIbuFocusNode,
    required this.nikIbuFocusNode,
    required this.namaIbuFocusNode,
    required this.tempatLahirIbuFocusNode,
    required this.tanggalLahirIbuFocusNode,
    required this.alamatIbuFocusNode,
    required this.teleponIbuFocusNode,
    required this.rtIbuFocusNode,
    required this.rwIbuFocusNode,
    required this.jenisKBFocusNode,
    required this.jumlahAnakIbuFocusNode,
    required this.tanggalKelahiranAnakSebelumnyaIbuFocusNode,
    // focus node wilIbu
    required this.selectedKabupatenIbuFocusNode,
    required this.selectedKecamatanIbuFocusNode,
    required this.selectedDesaIbuFocusNode,
    required this.selectedDusunIbuFocusNode,
    required this.selectedGolDarahIbuFocusNode,
    required this.onSelectDate,
    required this.removeDisability,
    required this.toggleDisabilityIbu,
    required this.isGenerateIbuValid,
    required this.dataWilayahModel,
    required this.handleKabupatenIbuChanged,
    required this.handleKecamatanIbuChanged,
    required this.handleDesaIbuChanged,
    required this.handleDusunIbuChanged,
    required this.handleGolDarahIbuChanged,
    required this.handleJenisKBChanged,
    required this.onSelectDateKelahiranSebelumnya,
    required this.submitIbuForm,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenerateKkCubit()),
        BlocProvider(create: (context) => GenerateNikCubit()),
      ],
      child: UpdateRegisterIbuView(
        selectedJenisKB: selectedJenisKB,
        formIbukey: formIbukey,
        ibuScrollController: ibuScrollController,
        kkIbuController: kkIbuController,
        nikIbuController: nikIbuController,
        namaIbuController: namaIbuController,
        tempatLahirIbuController: tempatLahirIbuController,
        tanggalLahirIbuController: tanggalLahirIbuController,
        alamatIbuController: alamatIbuController,
        teleponIbuController: teleponIbuController,
        rTIbuController: rTIbuController,
        rWIbuController: rWIbuController,
        jumlahAnakIbuController: jumlahAnakIbuController,
        tanggalKelahiranAnakSebelumnyaIbuController:
            tanggalKelahiranAnakSebelumnyaIbuController,
        dataKabupatenKotaIbu: dataKabupatenKotaIbu,
        dataKecamatanIbu: dataKecamatanIbu,
        dataDesaKelurahanIbu: dataDesaKelurahanIbu,
        dataDusunIbu: dataDusunIbu,
        selectedKabupatenIbu: selectedKabupatenIbu,
        selectedKecamatanIbu: selectedKecamatanIbu,
        selectedDesaIbu: selectedDesaIbu,
        selectedDusunIbu: selectedDusunIbu,
        selectedGolDarahIbu: selectedGolDarahIbu,
        selectedDisabilitiesIbu: selectedDisabilitiesIbu,
        selectedDisabilitiesAyah: selectedDisabilitiesAyah,
        selectedDisabilityLabelsIbu: selectedDisabilityLabelsIbu,
        kkIbuKey: kkIbuKey,
        nikIbuKey: nikIbuKey,
        namaIbuKey: namaIbuKey,
        tempatLahirIbuKey: tempatLahirIbuKey,
        tanggalLahirIbuKey: tanggalLahirIbuKey,
        alamatIbuKey: alamatIbuKey,
        teleponIbuKey: teleponIbuKey,
        rtIbuKey: rtIbuKey,
        rwIbuKey: rwIbuKey,
        selectedKabupatenIbuKey: selectedKabupatenIbuKey,
        selectedKecamatanIbuKey: selectedKecamatanIbuKey,
        selectedDesaIbuKey: selectedDesaIbuKey,
        selectedDusunIbuKey: selectedDusunIbuKey,
        selectedGolDarahIbuKey: selectedGolDarahIbuKey,
        jenisKBKey: jenisKBKey,
        jumlahAnakIbuKey: jumlahAnakIbuKey,
        tanggalKelahiranAnakSebelumnyaIbuKey:
            tanggalKelahiranAnakSebelumnyaIbuKey,
        kkIbuFocusNode: kkIbuFocusNode,
        nikIbuFocusNode: nikIbuFocusNode,
        namaIbuFocusNode: namaIbuFocusNode,
        tempatLahirIbuFocusNode: tempatLahirIbuFocusNode,
        tanggalLahirIbuFocusNode: tanggalLahirIbuFocusNode,
        alamatIbuFocusNode: alamatIbuFocusNode,
        teleponIbuFocusNode: teleponIbuFocusNode,
        rtIbuFocusNode: rtIbuFocusNode,
        rwIbuFocusNode: rwIbuFocusNode,
        selectedKabupatenIbuFocusNode: selectedKabupatenIbuFocusNode,
        selectedKecamatanIbuFocusNode: selectedKecamatanIbuFocusNode,
        selectedDesaIbuFocusNode: selectedDesaIbuFocusNode,
        selectedDusunIbuFocusNode: selectedDusunIbuFocusNode,
        selectedGolDarahIbuFocusNode: selectedGolDarahIbuFocusNode,
        jenisKBFocusNode: jenisKBFocusNode,
        jumlahAnakIbuFocusNode: jumlahAnakIbuFocusNode,
        tanggalKelahiranAnakSebelumnyaIbuFocusNode:
            tanggalKelahiranAnakSebelumnyaIbuFocusNode,
        onSelectDate: onSelectDate,
        removeDisability: removeDisability,
        toggleDisabilityIbu: toggleDisabilityIbu,
        isGenerateIbuValid: isGenerateIbuValid,
        dataWilayahModel: dataWilayahModel,
        handleDesaIbuChanged: handleDesaIbuChanged,
        handleDusunIbuChanged: handleDusunIbuChanged,
        handleGolDarahIbuChanged: handleGolDarahIbuChanged,
        handleKabupatenIbuChanged: handleKabupatenIbuChanged,
        handleKecamatanIbuChanged: handleKecamatanIbuChanged,
        handleJenisKBChanged: handleJenisKBChanged,
        onSelectDateKelahiranSebelumnya: onSelectDateKelahiranSebelumnya,
        submitIbuForm: submitIbuForm,
      ),
    );
  }
}

class UpdateRegisterIbuView extends StatefulWidget {
  final GlobalKey<FormState> formIbukey;
  final ScrollController ibuScrollController;

  final TextEditingController kkIbuController;
  final TextEditingController nikIbuController;
  final TextEditingController namaIbuController;
  final TextEditingController tempatLahirIbuController;
  final TextEditingController tanggalLahirIbuController;
  final TextEditingController alamatIbuController;
  final TextEditingController teleponIbuController;
  final TextEditingController rTIbuController;
  final TextEditingController rWIbuController;
  final TextEditingController jumlahAnakIbuController;
  final TextEditingController tanggalKelahiranAnakSebelumnyaIbuController;

  //? Ibu selected
  List<DataKabupatenKota> dataKabupatenKotaIbu;
  List<DataKecamatan> dataKecamatanIbu;
  List<DataDesaKelurahan> dataDesaKelurahanIbu;
  List<DataDusun> dataDusunIbu;

  DataKabupatenKota? selectedKabupatenIbu;
  DataKecamatan? selectedKecamatanIbu;
  DataDesaKelurahan? selectedDesaIbu;
  DataDusun? selectedDusunIbu;
  String selectedJenisKB;
  // String selectedJenisKBIbu = '-';
  String selectedGolDarahIbu;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu;
  List<bool> selectedDisabilitiesAyah;
  List<String> selectedDisabilityLabelsIbu;

  //! validate formKeyController
  // ? Ibu
  final GlobalKey<FormFieldState> kkIbuKey;
  final GlobalKey<FormFieldState> nikIbuKey;
  final GlobalKey<FormFieldState> namaIbuKey;
  final GlobalKey<FormFieldState> tempatLahirIbuKey;
  final GlobalKey<FormFieldState> tanggalLahirIbuKey;
  final GlobalKey<FormFieldState> alamatIbuKey;
  final GlobalKey<FormFieldState> teleponIbuKey;
  final GlobalKey<FormFieldState> rtIbuKey;
  final GlobalKey<FormFieldState> rwIbuKey;

  final GlobalKey<FormFieldState> selectedKabupatenIbuKey;
  final GlobalKey<FormFieldState> selectedKecamatanIbuKey;
  final GlobalKey<FormFieldState> selectedDesaIbuKey;
  final GlobalKey<FormFieldState> selectedDusunIbuKey;
  final GlobalKey<FormFieldState> selectedGolDarahIbuKey;
  final GlobalKey<FormFieldState> jenisKBKey;
  final GlobalKey<FormFieldState> jumlahAnakIbuKey;
  final GlobalKey<FormFieldState> tanggalKelahiranAnakSebelumnyaIbuKey;

  // !Ibu fokus node
  final FocusNode kkIbuFocusNode;
  final FocusNode nikIbuFocusNode;
  final FocusNode namaIbuFocusNode;
  final FocusNode tempatLahirIbuFocusNode;
  final FocusNode tanggalLahirIbuFocusNode;
  final FocusNode alamatIbuFocusNode;
  final FocusNode teleponIbuFocusNode;
  final FocusNode rtIbuFocusNode;
  final FocusNode rwIbuFocusNode;

  final FocusNode selectedKabupatenIbuFocusNode;
  final FocusNode selectedKecamatanIbuFocusNode;
  final FocusNode selectedDesaIbuFocusNode;
  final FocusNode selectedDusunIbuFocusNode;
  final FocusNode selectedGolDarahIbuFocusNode;
  final FocusNode jenisKBFocusNode;
  final FocusNode jumlahAnakIbuFocusNode;
  final FocusNode tanggalKelahiranAnakSebelumnyaIbuFocusNode;

  final Future<void> Function(BuildContext) onSelectDate;
  final void Function(String) removeDisability;
  final void Function(int) toggleDisabilityIbu;
  //  bool _isGenerateIbuValid() {
  final bool Function() isGenerateIbuValid;

  final DataWilayahModel dataWilayahModel;

  final void Function(DataKabupatenKota) handleKabupatenIbuChanged;
  final void Function(DataKecamatan) handleKecamatanIbuChanged;
  final void Function(DataDesaKelurahan) handleDesaIbuChanged;
  final void Function(DataDusun) handleDusunIbuChanged;
  final void Function(dynamic) handleGolDarahIbuChanged;
  final void Function(dynamic) handleJenisKBChanged;

  final Future<void> Function(BuildContext) onSelectDateKelahiranSebelumnya;
  final void Function() submitIbuForm;
  UpdateRegisterIbuView({
    super.key,
    // form
    required this.formIbukey,
    // scroll
    required this.ibuScrollController,
    // controllers
    required this.kkIbuController,
    required this.nikIbuController,
    required this.namaIbuController,
    required this.tempatLahirIbuController,
    required this.tanggalLahirIbuController,
    required this.alamatIbuController,
    required this.teleponIbuController,
    required this.rTIbuController,
    required this.rWIbuController,
    required this.jumlahAnakIbuController,
    required this.tanggalKelahiranAnakSebelumnyaIbuController,
    // data wilIbu
    required this.dataKabupatenKotaIbu,
    required this.dataKecamatanIbu,
    required this.dataDesaKelurahanIbu,
    required this.dataDusunIbu,
    // selected wilIbu
    this.selectedKabupatenIbu,
    this.selectedKecamatanIbu,
    this.selectedDesaIbu,
    this.selectedDusunIbu,
    // selected golongan darah
    required this.selectedJenisKB,
    this.selectedGolDarahIbu = '-',
    // selected disabilities
    this.selectedDisabilitiesIbu = const [],
    this.selectedDisabilitiesAyah = const [],
    this.selectedDisabilityLabelsIbu = const [],
    // form key
    required this.kkIbuKey,
    required this.nikIbuKey,
    required this.namaIbuKey,
    required this.tempatLahirIbuKey,
    required this.tanggalLahirIbuKey,
    required this.alamatIbuKey,
    required this.teleponIbuKey,
    required this.rtIbuKey,
    required this.rwIbuKey,
    required this.jenisKBKey,
    required this.jumlahAnakIbuKey,
    required this.tanggalKelahiranAnakSebelumnyaIbuKey,
    // selected wilIbu key
    required this.selectedKabupatenIbuKey,
    required this.selectedKecamatanIbuKey,
    required this.selectedDesaIbuKey,
    required this.selectedDusunIbuKey,
    required this.selectedGolDarahIbuKey,
    // focus node
    required this.kkIbuFocusNode,
    required this.nikIbuFocusNode,
    required this.namaIbuFocusNode,
    required this.tempatLahirIbuFocusNode,
    required this.tanggalLahirIbuFocusNode,
    required this.alamatIbuFocusNode,
    required this.teleponIbuFocusNode,
    required this.rtIbuFocusNode,
    required this.rwIbuFocusNode,
    required this.jenisKBFocusNode,
    required this.jumlahAnakIbuFocusNode,
    required this.tanggalKelahiranAnakSebelumnyaIbuFocusNode,
    // focus node wilIbu
    required this.selectedKabupatenIbuFocusNode,
    required this.selectedKecamatanIbuFocusNode,
    required this.selectedDesaIbuFocusNode,
    required this.selectedDusunIbuFocusNode,
    required this.selectedGolDarahIbuFocusNode,
    required this.onSelectDate,
    required this.removeDisability,
    required this.toggleDisabilityIbu,
    required this.isGenerateIbuValid,
    required this.dataWilayahModel,
    required this.handleKabupatenIbuChanged,
    required this.handleKecamatanIbuChanged,
    required this.handleDesaIbuChanged,
    required this.handleDusunIbuChanged,
    required this.handleGolDarahIbuChanged,
    required this.handleJenisKBChanged,
    required this.onSelectDateKelahiranSebelumnya,
    required this.submitIbuForm,
  });

  @override
  State<UpdateRegisterIbuView> createState() => _UpdateRegisterIbuViewState();
}

class _UpdateRegisterIbuViewState extends State<UpdateRegisterIbuView> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formIbukey,
      child: SingleChildScrollView(
        controller: widget.ibuScrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Nomor Kartu Keluarga',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            BlocConsumer<GenerateKkCubit, GenerateKkState>(
              listener: (context, stateKK) {
                if (stateKK is GenerateKKSuccess) {
                  widget.kkIbuController.text =
                      stateKK.data.data.nomorKartuKeluarga;
                }
              },
              builder: (context, stateKK) {
                if (stateKK is GenerateKKLoading) {
                  return SizedBox(
                    child: Center(
                      child: SpinKitThreeBounce(
                        color: bluePrimaryMain,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: TextFieldWidget2(
                        controller: widget.kkIbuController,
                        formFieldKey: widget.kkIbuKey,
                        hintText: 'Masukan Nomor KK',
                        isPasswordField: false,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        fieldName: 'kk_ibu',
                        onTap: () {},
                        focusNode: widget.kkIbuFocusNode,
                        clientValidators: [
                          FormBuilderValidators.required(
                              errorText: "Isi terlebih dahulu!"),
                          FormBuilderValidators.numeric(
                              errorText: "KK harus berupa angka!"),
                          FormBuilderValidators.equalLength(16,
                              errorText: "KK harus terdiri dari 16 angka!"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Validasi sebelum mengizinkan generate
                          // logger.d(
                          //     'provinsi id ibu ${widget.dataWilayahModel.provinsi.id}');
                          // logger.d(
                          //     'kabupaten id ibu ${widget.selectedKabupatenIbu?.id}');
                          // logger.d(
                          //     'kecataman id ibu ${widget.selectedKecamatanIbu?.id}');
                        if (widget.isGenerateIbuValid()) {
                          // Logika untuk generate
                          print("Generate button pressed");

                          context.read<GenerateKkCubit>().getGenerateKK(
                              widget.dataWilayahModel.provinsi.id,
                              widget.selectedKabupatenIbu!.id,
                              widget.selectedKecamatanIbu!.id,
                              widget.tanggalLahirIbuController.text);
                        } else {
                          // Tampilkan snackbar atau dialog jika form tidak valid
                          showTopSnackBar(
                              Overlay.of(context),
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              displayDuration:
                                  const Duration(milliseconds: 2200),
                              reverseAnimationDuration:
                                  const Duration(milliseconds: 300),
                              TopSnackbarWidget().error(
                                  'Lengkapi data lahir & alamat untuk membuat Nomor KK!'));
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
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'NIK',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),

            BlocConsumer<GenerateNikCubit, GenerateNikState>(
              listener: (context, state) {
                if (state is GenerateNikSuccess) {
                  widget.nikIbuController.text =
                      state.data.data.nomorIndukKeluarga;
                }
              },
              builder: (context, state) {
                if (state is GenerateNikLoading) {
                  return SizedBox(
                    child: Center(
                      child: SpinKitThreeBounce(
                        color: bluePrimaryMain,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: TextFieldWidget2(
                        controller: widget.nikIbuController,
                        fieldName: 'nik_ibu',
                        focusNode: widget.nikIbuFocusNode,
                        formFieldKey: widget.nikIbuKey,
                        onTap: () {},
                        hintText: 'Masukan NIK',
                        isPasswordField: false,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        clientValidators: [
                          FormBuilderValidators.required(
                              errorText: "Isi terlebih dahulu!"),
                          FormBuilderValidators.numeric(
                              errorText: "NIK harus berupa angka!"),
                          FormBuilderValidators.equalLength(16,
                              errorText: "NIK harus terdiri dari 16 angka!"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.kkIbuController.text.isEmpty) {
                          showTopSnackBar(
                              Overlay.of(context),
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              displayDuration:
                                  const Duration(milliseconds: 2200),
                              reverseAnimationDuration:
                                  const Duration(milliseconds: 300),
                              TopSnackbarWidget()
                                  .error('KK Harus Diisi Terlebih Dahulu'));
                        } else {
                          // Validasi sebelum mengizinkan generate
                          if (widget.isGenerateIbuValid()) {
                            // Logika untuk generate
                            print("Generate button pressed");
                            context.read<GenerateNikCubit>().getGenerateNik(
                                widget.kkIbuController.text,
                                widget.tanggalLahirIbuController.text);
                          } else {
                            // Tampilkan snackbar atau dialog jika form tidak valid
                            showTopSnackBar(
                                Overlay.of(context),
                                animationDuration:
                                    const Duration(milliseconds: 600),
                                displayDuration:
                                    const Duration(milliseconds: 2200),
                                reverseAnimationDuration:
                                    const Duration(milliseconds: 300),
                                TopSnackbarWidget().error(
                                    'Lengkapi data lahir & alamat untuk membuat Nomor KK!'));
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
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Nama',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget2(
              fieldName: 'nama_ibu',
              focusNode: widget.namaIbuFocusNode,
              onTap: () {},
              controller: widget.namaIbuController,
              formFieldKey: widget.namaIbuKey,
              hintText: 'Masukan Nama',
              isPasswordField: false,
              keyboardType: TextInputType.text,
              obscureText: false,
              clientValidators: [
                FormBuilderValidators.required(
                    errorText: "Isi terlebih dahulu!"),
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
                      TextFieldWidget2(
                        controller: widget.tempatLahirIbuController,
                        focusNode: widget.tempatLahirIbuFocusNode,
                        onTap: () {},
                        formFieldKey: widget.tempatLahirIbuKey,
                        fieldName: 'tempat_lahir_ibu',
                        hintText: 'Tempat Lahir',
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        isPasswordField: false,
                        clientValidators: [
                          FormBuilderValidators.required(
                              errorText: "Isi terlebih dahulu!"),
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
                          widget.onSelectDate(context);
                        },
                        isDate: true,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                                errorText: "Isi terlebih dahulu!"),
                          ],
                        ),
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
                  child: IgnorePointer(
                    ignoring:
                        widget.dataKabupatenKotaIbu.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataKabupatenKota>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedKabupatenIbu, // Ini bisa null
                      hint: Text(
                        "Kabupaten",
                        style: AppTextStyles.secoundaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      buttonStyleData: const ButtonStyleData(
                        elevation: 0,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: backgroundWhite10,
                        ),
                        elevation: 0,
                      ),
                      key: widget.selectedKabupatenIbuKey,
                      items: widget.dataKabupatenKotaIbu.map((item) {
                        return DropdownMenuItem<DataKabupatenKota>(
                          value: item,
                          child: Text(item.namaKabupatenKota),
                        );
                      }).toList(),
                      onChanged: (value) => widget.handleKabupatenIbuChanged(value!),
                      onSaved: (value) {},
                      validator: null,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        hintText: "Kabupaten",
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.grey,
                                ),
                        filled: true,
                        fillColor: backgroundWhite10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: redPrimaryMain),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IgnorePointer(
                    ignoring: widget.dataKecamatanIbu.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataKecamatan>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedKecamatanIbu, // Ini bisa null
                      hint: Text(
                        "Kecamatan",
                        style: AppTextStyles.secoundaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      buttonStyleData: const ButtonStyleData(
                        elevation: 0,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: backgroundWhite10,
                        ),
                        elevation: 0,
                      ),
                      items: widget.dataKecamatanIbu.map((item) {
                        return DropdownMenuItem<DataKecamatan>(
                          value: item,
                          child: Text(item.namaKecamatan),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          widget.handleKecamatanIbuChanged(value!),
                      onSaved: (value) {},
                      validator: null,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        hintText: "Kecamatan",
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.grey,
                                ),
                        filled: true,
                        fillColor: backgroundWhite10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: redPrimaryMain),
                        ),
                      ),
                    ),
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
                  child: IgnorePointer(
                    ignoring:
                        widget.dataDesaKelurahanIbu.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataDesaKelurahan>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedDesaIbu, // Ini bisa null
                      hint: Text(
                        "Desa",
                        style: AppTextStyles.secoundaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      buttonStyleData: const ButtonStyleData(
                        elevation: 0,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: backgroundWhite10,
                        ),
                        elevation: 0,
                      ),
                      items: widget.dataDesaKelurahanIbu.map((item) {
                        return DropdownMenuItem<DataDesaKelurahan>(
                          value: item,
                          child: Text(item.namaDesaKelurahan),
                        );
                      }).toList(),
                      onChanged: (value) => widget.handleDesaIbuChanged(value!),
                      onSaved: (value) {},
                      validator: null,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        hintText: "Desa",
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.grey,
                                ),
                        filled: true,
                        fillColor: backgroundWhite10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: redPrimaryMain),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: IgnorePointer(
                    ignoring: widget.dataDusunIbu.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataDusun>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedDusunIbu, // Ini bisa null
                      hint: Text(
                        "Dusun",
                        style: AppTextStyles.secoundaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      buttonStyleData: const ButtonStyleData(
                        elevation: 0,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: backgroundWhite10,
                        ),
                        elevation: 0,
                      ),
                      items: widget.dataDusunIbu.map((item) {
                        return DropdownMenuItem<DataDusun>(
                          value: item,
                          child: Text(item.namaDusun),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          widget.handleDusunIbuChanged(value!),
                      onSaved: (value) {},
                      validator: null,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        hintText: "Dusun",
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.grey,
                                ),
                        filled: true,
                        fillColor: backgroundWhite10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: redPrimaryMain),
                        ),
                      ),
                    ),
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
                  child: TextFieldWidget2(
                    fieldName: 'rt_ibu',
                    focusNode: widget.rtIbuFocusNode,
                    onTap: () {},
                    formFieldKey: widget.rtIbuKey,
                    controller: widget.rTIbuController,
                    hintText: 'RT',
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    clientValidators: [
                      FormBuilderValidators.required(
                          errorText: "Isi terlebih dahulu!"),
                      FormBuilderValidators.numeric(
                          errorText: "RT harus berupa angka!"),
                    ],
                  ),
                ),
                Expanded(
                  child: TextFieldWidget2(
                    fieldName: 'rw_ibu',
                    focusNode: widget.rwIbuFocusNode,
                    onTap: () {},
                    controller: widget.rWIbuController,
                    formFieldKey: widget.rwIbuKey,
                    hintText: 'RW',
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    clientValidators: [
                      FormBuilderValidators.required(
                          errorText: "Isi terlebih dahulu!"),
                      FormBuilderValidators.numeric(
                              errorText: "RW harus berupa angka!"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget2(
              controller: widget.alamatIbuController,
              fieldName: 'alamat_ibu',
              onTap: () {},
              focusNode: widget.alamatIbuFocusNode,
              formFieldKey: widget.alamatIbuKey,
              hintText: 'Masukan alamat lengkap',
              keyboardType: TextInputType.text,
              obscureText: false,
              isPasswordField: false,
              clientValidators: [
                FormBuilderValidators.required(
                    errorText: "Isi terlebih dahulu!"),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Nomor Telepon (WA aktif)',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget2(
              controller: widget.teleponIbuController,
              hintText: 'Masukan nomor telepon',
              keyboardType: TextInputType.phone,
              fieldName: 'nomor_telepon_ibu',
              focusNode: widget.teleponIbuFocusNode,
              formFieldKey: widget.teleponIbuKey,
              onTap: () {},
              obscureText: false,
              isPasswordField: false,
              clientValidators: [
                FormBuilderValidators.numeric(
                    errorText: "Nomor harus berupa angka!"),
                FormBuilderValidators.minLength(10,
                    checkNullOrEmpty: false, errorText: "Minimal 10 digit"),
                FormBuilderValidators.maxLength(13,
                    checkNullOrEmpty: false, errorText: "Maksimal 13 digit"),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Jenis KB harus dipilih";
                          }
                          return null;
                        },
                        items: selectJenisKB,
                        hint: 'Jenis KB',
                        value: widget.selectedJenisKB,
                        onChanged: (value) =>
                            widget.handleJenisKBChanged(value),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Golongan Darah harus dipilih";
                          }
                          return null;
                        },
                        items: selectGolDarah,
                        hint: 'Golongan Darah',
                        value: widget.selectedGolDarahIbu,
                        onChanged: (value) =>
                            widget.handleGolDarahIbuChanged(value),
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
              focusNode: widget.tanggalKelahiranAnakSebelumnyaIbuFocusNode,
              key: widget.tanggalKelahiranAnakSebelumnyaIbuKey,
              isDate: true,
              controller: widget.tanggalKelahiranAnakSebelumnyaIbuController,
              selectDate: () {
                widget.onSelectDateKelahiranSebelumnya(context);
              },
              hintText: "Tanggal Lahiran Anak Sebelumnya",
              // validator: (value) {
              //   if (value == null ||
              //       value.isEmpty) {
              //     return "Tanggal harus dipilih";
              //   }
              //   return null;
              // },
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Jumlah Anak',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget2(
              controller: widget.jumlahAnakIbuController,
              hintText: 'Jumlah Anak',
              keyboardType: TextInputType.number,
              obscureText: false,
              isPasswordField: false,
              fieldName: 'jumlah_anak_ibu',
              focusNode: widget.jumlahAnakIbuFocusNode,
              onTap: () {},
              formFieldKey: widget.jumlahAnakIbuKey,
              clientValidators: [
                // (value) => Validator.required(value,
                //     "Jumlah Anak tidak boleh kosong"),
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
              children: widget.selectedDisabilityLabelsIbu.map((label) {
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
                      widget.removeDisability(label);
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
                      selectedDisabilities: widget.selectedDisabilitiesIbu,
                      onToggleDisability: widget.toggleDisabilityIbu,
                      onAddCustomDisability: (String customDisability) {
                        setState(() {
                          disabilities.add(customDisability);
                          widget.selectedDisabilitiesIbu.add(true);
                          widget.selectedDisabilityLabelsIbu
                              .add(customDisability);

                          // penyamaan value dan length
                          widget.selectedDisabilitiesAyah.add(false);
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
                widget.submitIbuForm();
                
              },
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(20)),
            Center(
              child: GestureDetector(
                // onTap: _navigateBack,
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
