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

class UpdateRegisterAyah extends StatelessWidget {
  final GlobalKey<FormState> formAyahkey;
  final ScrollController ayahScrollController;

  final TextEditingController kkAyahController;
  final TextEditingController nikAyahController;
  final TextEditingController namaAyahController;
  final TextEditingController tempatLahirAyahController;
  final TextEditingController tanggalLahirAyahController;
  final TextEditingController alamatAyahController;
  final TextEditingController teleponAyahController;
  final TextEditingController rTAyahController;
  final TextEditingController rWAyahController;

  //? ayah selected
  List<DataKabupatenKota> dataKabupatenKotaAyah;
  List<DataKecamatan> dataKecamatanAyah;
  List<DataDesaKelurahan> dataDesaKelurahanAyah;
  List<DataDusun> dataDusunAyah;

  DataKabupatenKota? selectedKabupatenAyah;
  DataKecamatan? selectedKecamatanAyah;
  DataDesaKelurahan? selectedDesaAyah;
  DataDusun? selectedDusunAyah;

  String selectedGolDarahAyah;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah;
  List<bool> selectedDisabilitiesIbu;
  List<String> selectedDisabilityLabelsAyah;

  //! validate formKeyController
  // ? Ayah
  final GlobalKey<FormFieldState> kkAyahKey;
  final GlobalKey<FormFieldState> nikAyahKey;
  final GlobalKey<FormFieldState> namaAyahKey;
  final GlobalKey<FormFieldState> tempatLahirAyahKey;
  final GlobalKey<FormFieldState> tanggalLahirAyahKey;
  final GlobalKey<FormFieldState> alamatAyahKey;
  final GlobalKey<FormFieldState> teleponAyahKey;
  final GlobalKey<FormFieldState> rtAyahKey;
  final GlobalKey<FormFieldState> rwAyahKey;

  final GlobalKey<FormFieldState> selectedKabupatenAyahKey;
  final GlobalKey<FormFieldState> selectedKecamatanAyahKey;
  final GlobalKey<FormFieldState> selectedDesaAyahKey;
  final GlobalKey<FormFieldState> selectedDusunAyahKey;
  final GlobalKey<FormFieldState> selectedGolDarahAyahKey;

  // !ayah fokus node
  final FocusNode kkAyahFocusNode;
  final FocusNode nikAyahFocusNode;
  final FocusNode namaAyahFocusNode;
  final FocusNode tempatLahirAyahFocusNode;
  final FocusNode tanggalLahirAyahFocusNode;
  final FocusNode alamatAyahFocusNode;
  final FocusNode teleponAyahFocusNode;
  final FocusNode rtAyahFocusNode;
  final FocusNode rwAyahFocusNode;

  final FocusNode selectedKabupatenAyahFocusNode;
  final FocusNode selectedKecamatanAyahFocusNode;
  final FocusNode selectedDesaAyahFocusNode;
  final FocusNode selectedDusunAyahFocusNode;
  final FocusNode selectedGolDarahAyahFocusNode;

  // function for remove, toogle, and add disabilities
  final Future<void> Function(BuildContext) onSelectDate;
  final void Function(String) removeDisability;
  final void Function(int) toggleDisabilityAyah;
  //  bool _isGenerateAyahValid() {
  final bool Function() isGenerateAyahValid;

  final DataWilayahModel dataWilayahModel;

  final void Function(DataKabupatenKota) handleKabupatenAyahChanged;
  final void Function(DataKecamatan) handleKecamatanAyahChanged;
  final void Function(DataDesaKelurahan) handleDesaAyahChanged;
  final void Function(DataDusun) handleDusunAyahChanged;
  final void Function(dynamic) handleGolDarahAyahChanged;
  final void Function() submitAyahForm;

  UpdateRegisterAyah({
    // form
    required this.formAyahkey,
    // scroll
    required this.ayahScrollController,
    // controllers
    required this.kkAyahController,
    required this.nikAyahController,
    required this.namaAyahController,
    required this.tempatLahirAyahController,
    required this.tanggalLahirAyahController,
    required this.alamatAyahController,
    required this.teleponAyahController,
    required this.rTAyahController,
    required this.rWAyahController,
    // data wilayah
    required this.dataKabupatenKotaAyah,
    required this.dataKecamatanAyah,
    required this.dataDesaKelurahanAyah,
    required this.dataDusunAyah,
    // selected wilayah
    this.selectedKabupatenAyah,
    this.selectedKecamatanAyah,
    this.selectedDesaAyah,
    this.selectedDusunAyah,
    // selected golongan darah
    this.selectedGolDarahAyah = '',
    // selected disabilities
    this.selectedDisabilitiesAyah = const [],
    this.selectedDisabilitiesIbu = const [],
    this.selectedDisabilityLabelsAyah = const [],
    // form key
    required this.kkAyahKey,
    required this.nikAyahKey,
    required this.namaAyahKey,
    required this.tempatLahirAyahKey,
    required this.tanggalLahirAyahKey,
    required this.alamatAyahKey,
    required this.teleponAyahKey,
    required this.rtAyahKey,
    required this.rwAyahKey,
    // selected wilayah key
    required this.selectedKabupatenAyahKey,
    required this.selectedKecamatanAyahKey,
    required this.selectedDesaAyahKey,
    required this.selectedDusunAyahKey,
    required this.selectedGolDarahAyahKey,
    // focus node
    required this.kkAyahFocusNode,
    required this.nikAyahFocusNode,
    required this.namaAyahFocusNode,
    required this.tempatLahirAyahFocusNode,
    required this.tanggalLahirAyahFocusNode,
    required this.alamatAyahFocusNode,
    required this.teleponAyahFocusNode,
    required this.rtAyahFocusNode,
    required this.rwAyahFocusNode,
    // focus node wilayah
    required this.selectedKabupatenAyahFocusNode,
    required this.selectedKecamatanAyahFocusNode,
    required this.selectedDesaAyahFocusNode,
    required this.selectedDusunAyahFocusNode,
    required this.selectedGolDarahAyahFocusNode,
    required this.onSelectDate,
    required this.removeDisability,
    required this.toggleDisabilityAyah,
    required this.isGenerateAyahValid,
    required this.dataWilayahModel,
    required this.handleKabupatenAyahChanged,
    required this.handleKecamatanAyahChanged,
    required this.handleDesaAyahChanged,
    required this.handleDusunAyahChanged,
    required this.handleGolDarahAyahChanged,

    required this.submitAyahForm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenerateKkCubit()),
        BlocProvider(create: (context) => GenerateNikCubit()),
      ],
      child: UpdateRegisterAyahView(
        formAyahkey: formAyahkey,
        ayahScrollController: ayahScrollController,
        kkAyahController: kkAyahController,
        nikAyahController: nikAyahController,
        namaAyahController: namaAyahController,
        tempatLahirAyahController: tempatLahirAyahController,
        tanggalLahirAyahController: tanggalLahirAyahController,
        alamatAyahController: alamatAyahController,
        teleponAyahController: teleponAyahController,
        rTAyahController: rTAyahController,
        rWAyahController: rWAyahController,
        dataKabupatenKotaAyah: dataKabupatenKotaAyah,
        dataKecamatanAyah: dataKecamatanAyah,
        dataDesaKelurahanAyah: dataDesaKelurahanAyah,
        dataDusunAyah: dataDusunAyah,
        selectedKabupatenAyah: selectedKabupatenAyah,
        selectedKecamatanAyah: selectedKecamatanAyah,
        selectedDesaAyah: selectedDesaAyah,
        selectedDusunAyah: selectedDusunAyah,
        selectedGolDarahAyah: selectedGolDarahAyah,
        selectedDisabilitiesAyah: selectedDisabilitiesAyah,
        selectedDisabilitiesIbu: selectedDisabilitiesIbu,
        selectedDisabilityLabelsAyah: selectedDisabilityLabelsAyah,
        kkAyahKey: kkAyahKey,
        nikAyahKey: nikAyahKey,
        namaAyahKey: namaAyahKey,
        tempatLahirAyahKey: tempatLahirAyahKey,
        tanggalLahirAyahKey: tanggalLahirAyahKey,
        alamatAyahKey: alamatAyahKey,
        teleponAyahKey: teleponAyahKey,
        rtAyahKey: rtAyahKey,
        rwAyahKey: rwAyahKey,
        selectedKabupatenAyahKey: selectedKabupatenAyahKey,
        selectedKecamatanAyahKey: selectedKecamatanAyahKey,
        selectedDesaAyahKey: selectedDesaAyahKey,
        selectedDusunAyahKey: selectedDusunAyahKey,
        selectedGolDarahAyahKey: selectedGolDarahAyahKey,
        kkAyahFocusNode: kkAyahFocusNode,
        nikAyahFocusNode: nikAyahFocusNode,
        namaAyahFocusNode: namaAyahFocusNode,
        tempatLahirAyahFocusNode: tempatLahirAyahFocusNode,
        tanggalLahirAyahFocusNode: tanggalLahirAyahFocusNode,
        alamatAyahFocusNode: alamatAyahFocusNode,
        teleponAyahFocusNode: teleponAyahFocusNode,
        rtAyahFocusNode: rtAyahFocusNode,
        rwAyahFocusNode: rwAyahFocusNode,
        selectedKabupatenAyahFocusNode: selectedKabupatenAyahFocusNode,
        selectedKecamatanAyahFocusNode: selectedKecamatanAyahFocusNode,
        selectedDesaAyahFocusNode: selectedDesaAyahFocusNode,
        selectedDusunAyahFocusNode: selectedDusunAyahFocusNode,
        selectedGolDarahAyahFocusNode: selectedGolDarahAyahFocusNode,
        onSelectDate: onSelectDate,
        removeDisability: removeDisability,
        toggleDisabilityAyah: toggleDisabilityAyah,
        isGenerateAyahValid: isGenerateAyahValid,
        dataWilayahModel: dataWilayahModel,
        handleDesaAyahChanged: handleDesaAyahChanged,
        handleDusunAyahChanged: handleDusunAyahChanged,
        handleGolDarahAyahChanged: handleGolDarahAyahChanged,
        handleKabupatenAyahChanged: handleKabupatenAyahChanged,
        handleKecamatanAyahChanged: handleKecamatanAyahChanged,
        submitAyahForm: submitAyahForm,
      ),
    );
  }
}

class UpdateRegisterAyahView extends StatefulWidget {
  final GlobalKey<FormState> formAyahkey;
  final ScrollController ayahScrollController;

  final TextEditingController kkAyahController;
  final TextEditingController nikAyahController;
  final TextEditingController namaAyahController;
  final TextEditingController tempatLahirAyahController;
  final TextEditingController tanggalLahirAyahController;
  final TextEditingController alamatAyahController;
  final TextEditingController teleponAyahController;
  final TextEditingController rTAyahController;
  final TextEditingController rWAyahController;

  //? ayah selected
  List<DataKabupatenKota> dataKabupatenKotaAyah;
  List<DataKecamatan> dataKecamatanAyah;
  List<DataDesaKelurahan> dataDesaKelurahanAyah;
  List<DataDusun> dataDusunAyah;

  DataKabupatenKota? selectedKabupatenAyah;
  DataKecamatan? selectedKecamatanAyah;
  DataDesaKelurahan? selectedDesaAyah;
  DataDusun? selectedDusunAyah;

  String selectedGolDarahAyah;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah;
  List<bool> selectedDisabilitiesIbu;
  List<String> selectedDisabilityLabelsAyah;

  //! validate formKeyController
  // ? Ayah
  final GlobalKey<FormFieldState> kkAyahKey;
  final GlobalKey<FormFieldState> nikAyahKey;
  final GlobalKey<FormFieldState> namaAyahKey;
  final GlobalKey<FormFieldState> tempatLahirAyahKey;
  final GlobalKey<FormFieldState> tanggalLahirAyahKey;
  final GlobalKey<FormFieldState> alamatAyahKey;
  final GlobalKey<FormFieldState> teleponAyahKey;
  final GlobalKey<FormFieldState> rtAyahKey;
  final GlobalKey<FormFieldState> rwAyahKey;

  final GlobalKey<FormFieldState> selectedKabupatenAyahKey;
  final GlobalKey<FormFieldState> selectedKecamatanAyahKey;
  final GlobalKey<FormFieldState> selectedDesaAyahKey;
  final GlobalKey<FormFieldState> selectedDusunAyahKey;
  final GlobalKey<FormFieldState> selectedGolDarahAyahKey;

  // !ayah fokus node
  final FocusNode kkAyahFocusNode;
  final FocusNode nikAyahFocusNode;
  final FocusNode namaAyahFocusNode;
  final FocusNode tempatLahirAyahFocusNode;
  final FocusNode tanggalLahirAyahFocusNode;
  final FocusNode alamatAyahFocusNode;
  final FocusNode teleponAyahFocusNode;
  final FocusNode rtAyahFocusNode;
  final FocusNode rwAyahFocusNode;

  final FocusNode selectedKabupatenAyahFocusNode;
  final FocusNode selectedKecamatanAyahFocusNode;
  final FocusNode selectedDesaAyahFocusNode;
  final FocusNode selectedDusunAyahFocusNode;
  final FocusNode selectedGolDarahAyahFocusNode;

  // function for remove, toogle, and add disabilities
  final Future<void> Function(BuildContext) onSelectDate;
  final void Function(String) removeDisability;
  final void Function(int) toggleDisabilityAyah;
  //  bool _isGenerateAyahValid() {
  final bool Function() isGenerateAyahValid;

  final DataWilayahModel dataWilayahModel;

  final void Function(DataKabupatenKota) handleKabupatenAyahChanged;
  final void Function(DataKecamatan) handleKecamatanAyahChanged;
  final void Function(DataDesaKelurahan) handleDesaAyahChanged;
  final void Function(DataDusun) handleDusunAyahChanged;
  final void Function(dynamic) handleGolDarahAyahChanged;
  final void Function() submitAyahForm;
  UpdateRegisterAyahView({
    // form
    required this.formAyahkey,
    // scroll
    required this.ayahScrollController,
    // controllers
    required this.kkAyahController,
    required this.nikAyahController,
    required this.namaAyahController,
    required this.tempatLahirAyahController,
    required this.tanggalLahirAyahController,
    required this.alamatAyahController,
    required this.teleponAyahController,
    required this.rTAyahController,
    required this.rWAyahController,
    // data wilayah
    required this.dataKabupatenKotaAyah,
    required this.dataKecamatanAyah,
    required this.dataDesaKelurahanAyah,
    required this.dataDusunAyah,
    // selected wilayah
    this.selectedKabupatenAyah,
    this.selectedKecamatanAyah,
    this.selectedDesaAyah,
    this.selectedDusunAyah,
    // selected golongan darah
    this.selectedGolDarahAyah = '',
    // selected disabilities
    this.selectedDisabilitiesAyah = const [],
    this.selectedDisabilitiesIbu = const [],
    this.selectedDisabilityLabelsAyah = const [],
    // form key
    required this.kkAyahKey,
    required this.nikAyahKey,
    required this.namaAyahKey,
    required this.tempatLahirAyahKey,
    required this.tanggalLahirAyahKey,
    required this.alamatAyahKey,
    required this.teleponAyahKey,
    required this.rtAyahKey,
    required this.rwAyahKey,
    // selected wilayah key
    required this.selectedKabupatenAyahKey,
    required this.selectedKecamatanAyahKey,
    required this.selectedDesaAyahKey,
    required this.selectedDusunAyahKey,
    required this.selectedGolDarahAyahKey,
    // focus node
    required this.kkAyahFocusNode,
    required this.nikAyahFocusNode,
    required this.namaAyahFocusNode,
    required this.tempatLahirAyahFocusNode,
    required this.tanggalLahirAyahFocusNode,
    required this.alamatAyahFocusNode,
    required this.teleponAyahFocusNode,
    required this.rtAyahFocusNode,
    required this.rwAyahFocusNode,
    // focus node wilayah
    required this.selectedKabupatenAyahFocusNode,
    required this.selectedKecamatanAyahFocusNode,
    required this.selectedDesaAyahFocusNode,
    required this.selectedDusunAyahFocusNode,
    required this.selectedGolDarahAyahFocusNode,
    required this.onSelectDate,
    required this.removeDisability,
    required this.toggleDisabilityAyah,
    required this.isGenerateAyahValid,
    required this.dataWilayahModel,
    required this.handleKabupatenAyahChanged,
    required this.handleKecamatanAyahChanged,
    required this.handleDesaAyahChanged,
    required this.handleDusunAyahChanged,
    required this.handleGolDarahAyahChanged,
    required this.submitAyahForm,
    super.key,
  });

  @override
  State<UpdateRegisterAyahView> createState() => _UpdateRegisterAyahViewState();
}

class _UpdateRegisterAyahViewState extends State<UpdateRegisterAyahView> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formAyahkey,
      child: SingleChildScrollView(
        controller: widget.ayahScrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Nomor Kartu Keluarga',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            BlocConsumer<GenerateKkCubit, GenerateKkState>(
              listener: (context, stateKK) {
                if (stateKK is GenerateKKSuccess) {
                  widget.kkAyahController.text =
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
                      flex: 3, // Mengatur lebar TextField
                      child: TextFieldWidget2(
                        onTap: () {},
                        fieldName: 'kk_ayah',
                        formFieldKey: widget.kkAyahKey,
                        controller: widget.kkAyahController,
                        focusNode: widget.kkAyahFocusNode,
                        hintText: 'Masukan Nomor Kartu Keluarga',
                        isPasswordField: false,
                        keyboardType: TextInputType.number,
                        obscureText: false,
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
                        logger.d('provinsi id ayah  ');

                        // logger.d(
                        //     'provinsi id ayah ${widget.dataWilayahModel.provinsi.id}');
                        // logger.d(
                        //     'kabupaten id ayah ${widget.selectedKabupatenAyah?.id}');
                        // logger.d(
                        //     'kecamatan id ayah ${widget.selectedKecamatanAyah?.id}');
                        // logger.d(
                        //     'tanggal lahir ayah ${widget.tanggalLahirAyahController.text}');
                        // Validasi sebelum mengizinkan generate
                        if (widget.isGenerateAyahValid()) {
                          logger.d(
                              'provinsi id ayah ${widget.dataWilayahModel.provinsi.id}');
                          logger.d(
                              'kabupaten id ayah ${widget.selectedKabupatenAyah?.id}');
                          logger.d(
                              'kecamatan id ayah ${widget.selectedKecamatanAyah?.id}');
                          // Logika untuk generate
                          context.read<GenerateKkCubit>().getGenerateKK(
                              widget.dataWilayahModel.provinsi.id,
                              widget.selectedKabupatenAyah!.id,
                              widget.selectedKecamatanAyah!.id,
                              widget.tanggalLahirAyahController.text);
                          print("Generate button pressed");
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
                  widget.nikAyahController.text =
                      state.data.data.nomorIndukKeluarga;
                }
                if (state is GenerateNikFailed) {
                  showTopSnackBar(
                      Overlay.of(context),
                      animationDuration: const Duration(milliseconds: 600),
                      displayDuration: const Duration(milliseconds: 2200),
                      reverseAnimationDuration:
                          const Duration(milliseconds: 300),
                      TopSnackbarWidget()
                          .error('KK harus terisi terlebih dahulu'));
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: TextFieldWidget2(
                        fieldName: 'nik_ayah',
                        onTap: () {},
                        formFieldKey: widget.nikAyahKey,
                        controller: widget.nikAyahController,
                        focusNode: widget.nikAyahFocusNode,
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
                        if (widget.kkAyahController.text.isEmpty) {
                          showTopSnackBar(
                              Overlay.of(context),
                              animationDuration:
                                  const Duration(milliseconds: 600),
                              displayDuration:
                                  const Duration(milliseconds: 2200),
                              reverseAnimationDuration:
                                  const Duration(milliseconds: 300),
                              TopSnackbarWidget()
                                  .error('KK harus terisi terlebih dahulu!'));
                        } else {
                          // Validasi sebelum mengizinkan generate
                          if (widget.isGenerateAyahValid()) {
                            // Logika untuk generate
                            print("Generate button pressed");
                            context.read<GenerateNikCubit>().getGenerateNik(
                                widget.kkAyahController.text,
                                widget.tanggalLahirAyahController.text);
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
              fieldName: 'nama_ayah',
              onTap: () {},
              formFieldKey: widget.namaAyahKey,
              controller: widget.namaAyahController,
              focusNode: widget.namaAyahFocusNode,
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
                        formFieldKey: widget.tempatLahirAyahKey,
                        onTap: () {},
                        fieldName: 'tempat_lahir_ayah',
                        focusNode: widget.tempatLahirAyahFocusNode,
                        controller: widget.tempatLahirAyahController,
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
                        key: widget.tanggalLahirAyahKey,
                        focusNode: widget.tanggalLahirAyahFocusNode,
                        controller: widget.tanggalLahirAyahController,
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
                        widget.dataKabupatenKotaAyah.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataKabupatenKota>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedKabupatenAyah, // Ini bisa null
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
                      key: widget.selectedKabupatenAyahKey,
                      items: widget.dataKabupatenKotaAyah.map((item) {
                        return DropdownMenuItem<DataKabupatenKota>(
                          value: item,
                          child: Text(item.namaKabupatenKota),
                        );
                      }).toList(),
                      onChanged: (value) => widget.handleKabupatenAyahChanged(value!),
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
                    ignoring:
                        widget.dataKecamatanAyah.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataKecamatan>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedKecamatanAyah, // Ini bisa null
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
                      items: widget.dataKecamatanAyah.map((item) {
                        return DropdownMenuItem<DataKecamatan>(
                          value: item,
                          child: Text(item.namaKecamatan),
                        );
                      }).toList(),
                      onChanged: (value) => widget.handleKecamatanAyahChanged(value!),
                      key: widget.selectedKecamatanAyahKey,
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
                        widget.dataDesaKelurahanAyah.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataDesaKelurahan>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedDesaAyah, // Ini bisa null
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
                      items: widget.dataDesaKelurahanAyah.map((item) {
                        return DropdownMenuItem<DataDesaKelurahan>(
                          value: item,
                          child: Text(item.namaDesaKelurahan),
                        );
                      }).toList(),
                      onChanged: (value) => widget.handleDesaAyahChanged(value!),
                      key: widget.selectedDesaAyahKey,
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
                    ignoring: widget.dataDusunAyah.isNotEmpty ? false : true,
                    child: DropdownButtonFormField2<DataDusun>(
                      isExpanded: true,
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        fontSize: 12,
                      ),
                      value: widget.selectedDusunAyah, // Ini bisa null
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
                      key: widget.selectedDusunAyahKey,
                      items: widget.dataDusunAyah.map((item) {
                        return DropdownMenuItem<DataDusun>(
                          value: item,
                          child: Text(item.namaDusun),
                        );
                      }).toList(),
                      onChanged: (value) => widget.handleDusunAyahChanged(value!),
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
                    formFieldKey: widget.rtAyahKey,
                    fieldName: 'rt_ayah',
                    controller: widget.rTAyahController,
                    focusNode: widget.rtAyahFocusNode,
                    onTap: () {},
                    hintText: 'RT',
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    clientValidators: [
                      FormBuilderValidators.required(errorText: "Isi RT"),
                    ],
                  ),
                ),
                Expanded(
                  child: TextFieldWidget2(
                    onTap: () {},
                    controller: widget.rWAyahController,
                    hintText: 'RW',
                    fieldName: 'rw_ayah',
                    focusNode: widget.rwAyahFocusNode,
                    formFieldKey: widget.rwAyahKey,
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    clientValidators: [
                      FormBuilderValidators.required(errorText: "Isi RW"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget2(
              fieldName: 'alamat_ayah',
              focusNode: widget.alamatAyahFocusNode,
              onTap: () {},
              controller: widget.alamatAyahController,
              hintText: 'Masukan alamat lengkap',
              keyboardType: TextInputType.text,
              obscureText: false,
              key: widget.alamatAyahKey,
              isPasswordField: false,
              clientValidators: [
                FormBuilderValidators.required(
                    errorText: "Isi Terlebih Dahulu"),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Nomor Telepon (WA aktif)',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            TextFieldWidget2(
              controller: widget.teleponAyahController,
              fieldName: 'telepon_ayah',
              focusNode: widget.teleponAyahFocusNode,
              onTap: () {},
              hintText: 'Masukan nomor telepon',
              keyboardType: TextInputType.phone,
              obscureText: false,
              key: widget.teleponAyahKey,
              isPasswordField: false,
              clientValidators: [
                FormBuilderValidators.minLength(10,
                    checkNullOrEmpty: false, errorText: "Minimal 10 digit"),
                FormBuilderValidators.maxLength(13,
                    checkNullOrEmpty: false, errorText: "Maksimal 13 digit"),
              ],
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(16)),
            const Text(
              'Golongan Darah',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
            DropdownWidget(
              key: widget.selectedGolDarahAyahKey,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: "Golongan harus dipilih"),
              ]),
              items: selectGolDarah,
              hint: 'Golongan Darah',
              value: widget.selectedGolDarahAyah,
              onChanged: (value) => widget.handleGolDarahAyahChanged(value!),
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
                logger.d("tambah disabilitas");
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogDisabilitas(
                      disabilities: disabilities,
                      selectedDisabilities: widget.selectedDisabilitiesAyah,
                      onToggleDisability: widget.toggleDisabilityAyah,
                      onAddCustomDisability: (String customDisability) {
                        setState(() {
                          disabilities.add(customDisability);
                          widget.selectedDisabilitiesAyah.add(true);
                          widget.selectedDisabilityLabelsAyah
                              .add(customDisability);

                          // penyamaan value dan length
                          widget.selectedDisabilitiesIbu.add(false);
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
              mainButton: () {
                // _goToNextTab();
                logger.d("selanjutnya");
                widget.submitAyahForm();
              },
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
