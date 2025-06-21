import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/cubit/generate_kk_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/cubit/generate_nik_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/cubit/orang_tua_form_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/model/post_orang_tua_body.dart'
    as post_orang_tua_body;
import 'package:puspadaya/app/model/data_wilayah_model.dart';
import 'package:puspadaya/app/view/widget/checkbox_list_widget.dart';
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
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateRegisterAyah extends StatelessWidget {
  final VoidCallback onNext;
  final OrangTuaFormCubit cubit;

  const CreateRegisterAyah(
      {super.key, required this.onNext, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenerateKkCubit()),
        BlocProvider(create: (context) => GenerateNikCubit()),
        BlocProvider<AlamatSaveCubit>(
          create: (BuildContext context) => AlamatSaveCubit(),
        ),
      ],
      child: CreateRegisterAyahView(
        cubit: cubit,
        onNext: onNext,
      ),
    );
  }
}

class CreateRegisterAyahView extends StatefulWidget {
  final OrangTuaFormCubit cubit;
  final VoidCallback onNext;
  const CreateRegisterAyahView(
      {super.key, required this.onNext, required this.cubit});

  @override
  State<CreateRegisterAyahView> createState() => _CreateRegisterAyahViewState();
}

class _CreateRegisterAyahViewState extends State<CreateRegisterAyahView> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController(); // Untuk
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

  // !ayah fokus node
  final FocusNode kkAyahFocusNode = FocusNode();
  final FocusNode nikAyahFocusNode = FocusNode();
  final FocusNode namaAyahFocusNode = FocusNode();
  final FocusNode tempatLahirAyahFocusNode = FocusNode();
  final FocusNode tanggalLahirAyahFocusNode = FocusNode();
  final FocusNode alamatAyahFocusNode = FocusNode();
  final FocusNode teleponAyahFocusNode = FocusNode();
  final FocusNode rtAyahFocusNode = FocusNode();
  final FocusNode rwAyahFocusNode = FocusNode();

  final FocusNode selectedKabupatenAyahFocusNode = FocusNode();
  final FocusNode selectedKecamatanAyahFocusNode = FocusNode();
  final FocusNode selectedDesaAyahFocusNode = FocusNode();
  final FocusNode selectedDusunAyahFocusNode = FocusNode();
  final FocusNode selectedGolDarahAyahFocusNode = FocusNode();

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

  bool _isGenerateAyahValid() {
    return tempatLahirAyahController.text.isNotEmpty &&
        tanggalLahirAyahController.text.isNotEmpty &&
        selectedKabupatenAyah !=
            null && // Check if selectedKabupatenAyah is not null
        selectedKecamatanAyah !=
            null; // Check if selectedDusunAyahId is not null
  }

  void _submitForm() {
    // Langkah 1: Jalankan validasi form
    if (_formKey.currentState!.validate()) {
      // ! form valid save to local
      // widget.onSaveData({'nik_ayah': });
      post_orang_tua_body.Ayah ayah = post_orang_tua_body.Ayah(
        alamat: alamatAyahController.text,
        nomorKartuKeluarga: kkAyahController.text,
        dusunId: selectedDusunAyah!.id,
        golDarah: selectedGolDarahAyah,
        namaAyah: namaAyahController.text,
        nik: nikAyahController.text,
        nomorTelepon: teleponAyahController.text.isNotEmpty
            ? teleponAyahController.text
            : null,
        rt: rTAyahController.text,
        rw: rWAyahController.text,
        tempatLahir: tempatLahirAyahController.text,
        tanggalLahir: tanggalLahirAyahController.text,
        jenisDisabilitas: selectedDisabilityLabelsAyah.map((e) {
          return post_orang_tua_body.JenisDisabilitas(namaDisabilitas: e);
        }).toList(),
      );

      widget.cubit.updateAyah(ayah);

      widget.onNext();
    } else {
      // JIKA FORM TIDAK VALID
      print('Form tidak valid. Mencari error pertama...');

      // Buat daftar field Anda secara berurutan sesuai tampilan di UI
      // Ini PENTING agar scroll menuju ke error PALING ATAS
      final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
        kkAyahKey: kkAyahFocusNode,
        nikAyahKey: nikAyahFocusNode,
        namaAyahKey: namaAyahFocusNode,
        tempatLahirAyahKey: tempatLahirAyahFocusNode,
        tanggalLahirAyahKey: tanggalLahirAyahFocusNode,
        teleponAyahKey: teleponAyahFocusNode,
        rtAyahKey: rtAyahFocusNode,
        rwAyahKey: rwAyahFocusNode,
        alamatAyahKey: alamatAyahFocusNode,
        selectedKabupatenAyahKey: selectedKabupatenAyahFocusNode,
        selectedKecamatanAyahKey: selectedKecamatanAyahFocusNode,
        selectedDesaAyahKey: selectedDesaAyahFocusNode,
        selectedDusunAyahKey: selectedDusunAyahFocusNode,
        selectedGolDarahAyahKey: selectedGolDarahAyahFocusNode
      };
      // logger.d(fieldMap);

      // Cari field pertama yang memiliki error
      for (var entry in fieldMap.entries) {
        final key = entry.key;
        final focusNode = entry.value;

        logger.d(
            'key is ${key}, context current is ${key.currentContext}, has error ${key.currentState?.hasError}');
        // Cek apakah field ini punya error
        if (key.currentState?.hasError ?? false) {
          // Jika ya, scroll ke field ini

          print('Field ${entry.key} has error: ${key.currentState?.hasError}');
          print('Current context: ${key.currentContext}');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scrollable.ensureVisible(
              key.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: 0.3,
            );
            focusNode.requestFocus();
          });

          // Hentikan loop karena kita hanya butuh fokus ke error pertama
          break;
        }
      }
    }
  }

  @override
  void initState() {
    logger.d('trigger fetch');
    context.read<AlamatSaveCubit>().getDataWilayah();
    // Inisialisasi selectedDisabilitiesIbu dengan panjang yang sama dengan disabilities
    selectedDisabilitiesAyah =
        List<bool>.from(List.filled(disabilities.length, false));
    super.initState();
  }

  @override
  void dispose() {
    // 1. Dispose ScrollController
    _scrollController.dispose();

    // 2. Dispose semua TextEditingController untuk Ayah
    kkAyahController.dispose();
    nikAyahController.dispose();
    namaAyahController.dispose();
    tempatLahirAyahController.dispose();
    tanggalLahirAyahController.dispose();
    alamatAyahController.dispose();
    teleponAyahController.dispose();
    rTAyahController.dispose();
    rWAyahController.dispose();
    // (Tambahkan controller untuk Ibu di sini jika ada)

    // 3. Dispose semua FocusNode untuk Ayah
    kkAyahFocusNode.dispose();
    nikAyahFocusNode.dispose();
    namaAyahFocusNode.dispose();
    tempatLahirAyahFocusNode.dispose();
    tanggalLahirAyahFocusNode.dispose();
    alamatAyahFocusNode.dispose();
    teleponAyahFocusNode.dispose();
    rtAyahFocusNode.dispose();
    rwAyahFocusNode.dispose();
    selectedKabupatenAyahFocusNode.dispose();
    selectedKecamatanAyahFocusNode.dispose();
    selectedDesaAyahFocusNode.dispose();
    selectedDusunAyahFocusNode.dispose();
    selectedGolDarahAyahFocusNode.dispose();
    // (Tambahkan focus node untuk Ibu di sini jika ada)

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
      builder: (context, stateDataWilayah) {
        logger.d('stateDataWilayah is ${stateDataWilayah.toString()}');
        debugPrint(stateDataWilayah.toString());
        if (stateDataWilayah is GetAlamatProccessState) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Center(
              child: SpinKitThreeBounce(
                color: bluePrimaryMain,
                size: 50.0,
              ),
            ),
          );
        }
        if (stateDataWilayah is GetAlamatSuccessState) {
          logger.d(
              'length data wilayah ${stateDataWilayah.dataWilayahModel.provinsi.kabupatenKota.length}');
          if (dataKabupatenKotaAyah.isEmpty) {
            dataKabupatenKotaAyah.addAll(
                stateDataWilayah.dataWilayahModel.provinsi.kabupatenKota);
          }

          return Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: SingleChildScrollView(
              controller: _scrollController,
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
                        kkAyahController.text =
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
                              fieldName: 'kkAyah',
                              onTap: () {},
                              formFieldKey: kkAyahKey,
                              focusNode: kkAyahFocusNode,
                              controller: kkAyahController,
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
                                    errorText:
                                        "KK harus terdiri dari 16 angka!"),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Validasi sebelum mengizinkan generate
                              if (_isGenerateAyahValid()) {
                                logger.d(
                                    'provinsi id ayah ${stateDataWilayah.dataWilayahModel.provinsi.id}');
                                logger.d(
                                    'kabupaten id ayah ${selectedKabupatenAyah?.id}');
                                logger.d(
                                    'kecamatan id ayah ${selectedKecamatanAyah?.id}');
                                // Logika untuk generate
                                context.read<GenerateKkCubit>().getGenerateKK(
                                    stateDataWilayah
                                        .dataWilayahModel.provinsi.id,
                                    selectedKabupatenAyah!.id,
                                    selectedKecamatanAyah!.id,
                                    tanggalLahirAyahController.text);
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
                        nikAyahController.text =
                            state.data.data.nomorIndukKeluarga;
                      }
                      if (state is GenerateNikFailed) {
                        showTopSnackBar(
                            Overlay.of(context),
                            animationDuration:
                                const Duration(milliseconds: 600),
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
                                onTap: () {},
                                focusNode: nikAyahFocusNode,
                                formFieldKey: nikAyahKey,
                                controller: nikAyahController,
                                hintText: 'Masukan NIK',
                                isPasswordField: false,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                fieldName: 'nikAyah',
                                clientValidators: [
                                  FormBuilderValidators.required(
                                      errorText: "Isi terlebih dahulu!"),
                                  FormBuilderValidators.numeric(
                                      errorText: "NIK harus berupa angka!"),
                                  FormBuilderValidators.equalLength(16,
                                      errorText:
                                          "NIK harus terdiri dari 16 angka!"),
                                ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (kkAyahController.text.isEmpty) {
                                showTopSnackBar(
                                    Overlay.of(context),
                                    animationDuration:
                                        const Duration(milliseconds: 600),
                                    displayDuration:
                                        const Duration(milliseconds: 2200),
                                    reverseAnimationDuration:
                                        const Duration(milliseconds: 300),
                                    TopSnackbarWidget().error(
                                        'KK harus terisi terlebih dahulu!'));
                              } else {
                                // Validasi sebelum mengizinkan generate
                                if (_isGenerateAyahValid()) {
                                  // Logika untuk generate
                                  print("Generate button pressed");
                                  context
                                      .read<GenerateNikCubit>()
                                      .getGenerateNik(kkAyahController.text,
                                          tanggalLahirAyahController.text);
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
                    onTap: () {},
                    fieldName: 'namaAyah',
                    focusNode: namaAyahFocusNode,
                    formFieldKey: namaAyahKey,
                    controller: namaAyahController,
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
                              onTap: () {},
                              fieldName: 'tempatLahirAyah',
                              formFieldKey: tempatLahirAyahKey,
                              controller: tempatLahirAyahController,
                              hintText: 'Tempat Lahir',
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              isPasswordField: false,
                              focusNode: tempatLahirAyahFocusNode,
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
                                key: tanggalLahirAyahKey,
                                controller: tanggalLahirAyahController,
                                hintText: 'Tanggal Lahir',
                                selectDate: () {
                                  _selectDateAyah(context);
                                },
                                isDate: true,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: "Isi terlebih dahulu!"),
                                ])),
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
                              dataKabupatenKotaAyah.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataKabupatenKota>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedKabupatenAyah, // Ini bisa null
                            hint: Text(
                              "Kabupaten",
                              style:
                                  AppTextStyles.secoundaryTextNormal.copyWith(
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
                            key: selectedKabupatenAyahKey,
                            items: dataKabupatenKotaAyah.map((item) {
                              return DropdownMenuItem<DataKabupatenKota>(
                                value: item,
                                child: Text(item.namaKabupatenKota),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedKabupatenAyah = value;
                                dataKecamatanAyah.clear();
                                dataKecamatanAyah.addAll(value!.kecamatan);
                                //clear list
                                dataDesaKelurahanAyah.clear();
                                dataDusunAyah.clear();

                                //clear data
                                selectedKecamatanAyah = null;
                                selectedDesaAyah = null;
                                selectedDusunAyah = null;
                              });
                            },
                            onSaved: (value) {},
                            validator: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              hintText: "Kabupaten",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: redPrimaryMain),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: IgnorePointer(
                          ignoring: dataKecamatanAyah.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataKecamatan>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedKecamatanAyah, // Ini bisa null
                            hint: Text(
                              "Kecamatan",
                              style:
                                  AppTextStyles.secoundaryTextNormal.copyWith(
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
                            items: dataKecamatanAyah.map((item) {
                              return DropdownMenuItem<DataKecamatan>(
                                value: item,
                                child: Text(item.namaKecamatan),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedKecamatanAyah = value;
                                dataDesaKelurahanAyah.clear();
                                dataDesaKelurahanAyah
                                    .addAll(value!.desaKelurahan);

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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              hintText: "Kecamatan",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: redPrimaryMain),
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
                              dataDesaKelurahanAyah.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataDesaKelurahan>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedDesaAyah, // Ini bisa null
                            hint: Text(
                              "Desa",
                              style:
                                  AppTextStyles.secoundaryTextNormal.copyWith(
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
                            items: dataDesaKelurahanAyah.map((item) {
                              return DropdownMenuItem<DataDesaKelurahan>(
                                value: item,
                                child: Text(item.namaDesaKelurahan),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedDesaAyah = value;
                                dataDusunAyah.clear();
                                dataDusunAyah.addAll(value!.dusun);

                                //clear data
                                selectedDusunAyah = null;
                              });
                            },
                            key: selectedDesaAyahKey,
                            onSaved: (value) {},
                            validator: null,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              hintText: "Desa",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: redPrimaryMain),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: IgnorePointer(
                          ignoring: dataDusunAyah.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataDusun>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedDusunAyah, // Ini bisa null
                            hint: Text(
                              "Dusun",
                              style:
                                  AppTextStyles.secoundaryTextNormal.copyWith(
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
                            key: selectedDusunAyahKey,
                            items: dataDusunAyah.map((item) {
                              return DropdownMenuItem<DataDusun>(
                                value: item,
                                child: Text(item.namaDusun),
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              hintText: "Dusun",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
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
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: redPrimaryMain),
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
                          fieldName: 'rtAyah',
                          onTap: () {},
                          focusNode: rtAyahFocusNode,
                          formFieldKey: rtAyahKey,
                          controller: rTAyahController,
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
                            fieldName: 'rwAyah',
                            onTap: () {},
                            controller: rWAyahController,
                            hintText: 'RW',
                            focusNode: rwAyahFocusNode,
                            formFieldKey: rwAyahKey,
                            isPasswordField: false,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            clientValidators: [
                              FormBuilderValidators.required(
                                  errorText: "Isi RW"),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget2(
                    onTap: () {},
                    fieldName: 'alamatAyah',
                    controller: alamatAyahController,
                    hintText: 'Masukan alamat lengkap',
                    keyboardType: TextInputType.text,
                    focusNode: alamatAyahFocusNode,
                    obscureText: false,
                    formFieldKey: alamatAyahKey,
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
                    fieldName: 'teleponAyah',
                    onTap: () {},
                    controller: teleponAyahController,
                    focusNode: teleponAyahFocusNode,
                    hintText: 'Masukan nomor telepon',
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    formFieldKey: teleponAyahKey,
                    isPasswordField: false,
                    clientValidators: [
                      FormBuilderValidators.minLength(10,
                          checkNullOrEmpty: false),
                      FormBuilderValidators.maxLength(13,
                          checkNullOrEmpty: false),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Golongan Darah',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  DropdownWidget(
                    key: selectedGolDarahAyahKey,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "Golongan harud dipilih"),
                    ]),
                    items: selectGolDarah,
                    hint: 'Golongan Darah',
                    value: selectedGolDarahAyah,
                    onChanged: (value) {
                      setState(() {
                        selectedGolDarahAyah = value;
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
                    children: selectedDisabilityLabelsAyah.map((label) {
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
                            _removeDisabilityAyah(label);
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
                            selectedDisabilities: selectedDisabilitiesAyah,
                            onToggleDisability: _toggleDisabilityAyah,
                            onAddCustomDisability: (String customDisability) {
                              setState(() {
                                disabilities.add(customDisability);
                                selectedDisabilitiesAyah.add(true);
                                selectedDisabilityLabelsAyah
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
                    mainButton: () {
                      logger.d('trigger button next');
                      _submitForm();
                      // _goToNextTab();
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
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
