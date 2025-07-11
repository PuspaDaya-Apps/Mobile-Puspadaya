import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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

class CreateRegisterIbu extends StatelessWidget {
  final VoidCallback onSave;
  final OrangTuaFormCubit cubit;

  const CreateRegisterIbu(
      {super.key, required this.onSave, required this.cubit});

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
      child: CreateRegisterIbuView(
        onSave: onSave,
        cubit: cubit,
      ),
    );
  }
}

class CreateRegisterIbuView extends StatefulWidget {
  final VoidCallback onSave;
  final OrangTuaFormCubit cubit;
  const CreateRegisterIbuView(
      {super.key, required this.onSave, required this.cubit});

  @override
  State<CreateRegisterIbuView> createState() => CreateRegisterIbuViewState();
}

class CreateRegisterIbuViewState extends State<CreateRegisterIbuView>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController(); // Untuk
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

  // focus node
  final FocusNode kkIbuFocusNode = FocusNode();
  final FocusNode nikIbuFocusNode = FocusNode();
  final FocusNode namaIbuFocusNode = FocusNode();
  final FocusNode tempatLahirIbuFocusNode = FocusNode();
  final FocusNode tanggalLahirIbuFocusNode = FocusNode();
  final FocusNode alamatIbuFocusNode = FocusNode();
  final FocusNode teleponIbuFocusNode = FocusNode();
  final FocusNode rtIbuFocusNode = FocusNode();
  final FocusNode rwIbuFocusNode = FocusNode();
  final FocusNode tanggalKelahiranAnakSebelumnyaIbuFocusNode = FocusNode();
  final FocusNode jumlahAnakIbuFocusNode = FocusNode();
  final FocusNode selectedKabupatenIbuFocusNode = FocusNode();
  final FocusNode selectedKecamatanIbuFocusNode = FocusNode();
  final FocusNode selectedDesaIbuFocusNode = FocusNode();
  final FocusNode selectedDusunIbuFocusNode = FocusNode();
  final FocusNode selectedJenisKBIbuFocusNode = FocusNode();
  final FocusNode selectedGolDarahIbuFocusNode = FocusNode();

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

  bool _isGenerateIbuValid() {
    return tempatLahirIbuController.text.isNotEmpty &&
        tanggalLahirIbuController.text.isNotEmpty &&
        selectedKabupatenIbu !=
            null && // Check if selectedKabupatenIbu is not null
        selectedKecamatanIbu != null; // Check if selectedDusunIbuId is not null
  }

  void submitTest(){
    logger.d('submit test');
  }

  void submitForm() {
    // Langkah 1: Jalankan validasi form
    if (_formKey.currentState!.validate()) {
      // JIKA FORM VALID
      // Lakukan aksi selanjutnya, seperti menyimpan data atau pindah halaman
      print('Form valid. Melanjutkan ke langkah berikutnya...');
      // _goToNextTab(); // Contoh aksi

      post_orang_tua_body.Ibu ibu = post_orang_tua_body.Ibu(
        tanggalMelahirkanSebelumnya:
            tanggalKelahiranAnakSebelumnyaIbuController.text != ""
                ? tanggalKelahiranAnakSebelumnyaIbuController.text
                : null,
        jumlahAnak: jumlahAnakIbuController.text != ""
            ? int.parse(jumlahAnakIbuController.text)
            : 0,
        jenisKb: selectedJenisKBIbu,
        alamat: alamatIbuController.text,
        nomorKartuKeluarga: kkIbuController.text,
        dusunId: selectedDusunIbu!.id,
        golDarah: selectedGolDarahIbu,
        namaIbu: namaIbuController.text,
        nik: nikIbuController.text,
        nomorTelepon: teleponIbuController.text.isNotEmpty
            ? teleponIbuController.text
            : null,
        rt: rTIbuController.text,
        rw: rWIbuController.text,
        tempatLahir: tempatLahirIbuController.text,
        tanggalLahir: tanggalLahirIbuController.text,
        jenisDisabilitas: selectedDisabilityLabelsIbu.map((e) {
          return post_orang_tua_body.JenisDisabilitas(namaDisabilitas: e);
        }).toList(),
      );
      widget.cubit.updateIbu(ibu);
      logger.d('data ayah ${widget.cubit.getAyahData().toJson()}');
      logger.d('data ibu ${widget.cubit.getIbuData().toJson()}');

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Data Valid!')),
      // );
      widget.onSave(); // Panggil callback onSave untuk melanjutkan
    } else {
      // JIKA FORM TIDAK VALID
      print('Form tidak valid. Mencari error pertama...');

      // Buat daftar field Anda secara berurutan sesuai tampilan di UI
      // Ini PENTING agar scroll menuju ke error PALING ATAS
      final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
        kkIbuKey: kkIbuFocusNode,
        nikIbuKey: nikIbuFocusNode,
        namaIbuKey: namaIbuFocusNode,
        tempatLahirIbuKey: tempatLahirIbuFocusNode,
        tanggalLahirIbuKey: tanggalLahirIbuFocusNode,
        rtIbuKey: rtIbuFocusNode,
        rwIbuKey: rwIbuFocusNode,
        selectedKabupatenIbuKey: selectedKabupatenIbuFocusNode,
        selectedKecamatanIbuKey: selectedKecamatanIbuFocusNode,
        selectedDesaIbuKey: selectedDesaIbuFocusNode,
        selectedDusunIbuKey: selectedDusunIbuFocusNode,
        alamatIbuKey: alamatIbuFocusNode,
        teleponIbuKey: teleponIbuFocusNode,
        selectedJenisKBIbuKey: selectedJenisKBIbuFocusNode,
        selectedGolDarahIbuKey: selectedGolDarahIbuFocusNode,
        tanggalKelahiranAnakSebelumnyaIbuKey:
            tanggalKelahiranAnakSebelumnyaIbuFocusNode,
        jumlahAnakIbuKey: jumlahAnakIbuFocusNode,
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
    selectedDisabilitiesIbu =
        List<bool>.from(List.filled(disabilities.length, false));
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Memanggil super untuk AutomaticKeepAliveClientMixin
    return BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
      builder: (context, stateDataWilayah) {
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
          if (dataKabupatenKotaIbu.isEmpty) {
            dataKabupatenKotaIbu.addAll(
                stateDataWilayah.dataWilayahModel.provinsi.kabupatenKota);
          }
          return Form(
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
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  BlocConsumer<GenerateKkCubit, GenerateKkState>(
                    listener: (context, stateKK) {
                      if (stateKK is GenerateKKSuccess) {
                        kkIbuController.text =
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
                              fieldName: 'kkIbu',
                              onTap: () {},
                              focusNode: kkIbuFocusNode,
                              formFieldKey: kkIbuKey,
                              controller: kkIbuController,
                              hintText: 'Masukan Nomor KK',
                              isPasswordField: false,
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              clientValidators: [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                                FormBuilderValidators.equalLength(16),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Validasi sebelum mengizinkan generate
                              if (_isGenerateIbuValid()) {
                                // Logika untuk generate
                                logger.d(
                                    'provinsi id ibu ${stateDataWilayah.dataWilayahModel.provinsi.id}');
                                logger.d(
                                    'kabupaten id ibu ${selectedKabupatenIbu?.id}');
                                logger.d(
                                    'kecataman id ibu ${selectedKecamatanIbu?.id}');
                                print("Generate button pressed");

                                context.read<GenerateKkCubit>().getGenerateKK(
                                    stateDataWilayah
                                        .dataWilayahModel.provinsi.id,
                                    selectedKabupatenIbu!.id,
                                    selectedKecamatanIbu!.id,
                                    tanggalLahirIbuController.text);
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
                        nikIbuController.text =
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
                                fieldName: 'nikIbu',
                                focusNode: nikIbuFocusNode,
                                formFieldKey: nikIbuKey,
                                controller: nikIbuController,
                                hintText: 'Masukan NIK',
                                isPasswordField: false,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                onTap: () {},
                                clientValidators: [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                  FormBuilderValidators.equalLength(16),
                                ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (kkIbuController.text.isEmpty) {
                                showTopSnackBar(
                                    Overlay.of(context),
                                    animationDuration:
                                        const Duration(milliseconds: 600),
                                    displayDuration:
                                        const Duration(milliseconds: 2200),
                                    reverseAnimationDuration:
                                        const Duration(milliseconds: 300),
                                    TopSnackbarWidget().error(
                                        'KK Harus Diisi Terlebih Dahulu'));
                              } else {
                                // Validasi sebelum mengizinkan generate
                                if (_isGenerateIbuValid()) {
                                  // Logika untuk generate
                                  print("Generate button pressed");
                                  context
                                      .read<GenerateNikCubit>()
                                      .getGenerateNik(kkIbuController.text,
                                          tanggalLahirIbuController.text);
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
                      fieldName: 'namaIbu',
                      onTap: () {},
                      focusNode: namaIbuFocusNode,
                      formFieldKey: namaIbuKey,
                      controller: namaIbuController,
                      hintText: 'Masukan Nama',
                      isPasswordField: false,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      clientValidators: [
                        FormBuilderValidators.required(),
                      ]),
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
                              fieldName: 'tempatLahirIbu',
                              onTap: () {},
                              focusNode: tempatLahirIbuFocusNode,
                              formFieldKey: tempatLahirIbuKey,
                              controller: tempatLahirIbuController,
                              hintText: 'Tempat Lahir',
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              isPasswordField: false,
                              clientValidators: [
                                FormBuilderValidators.required(),
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
                                _selectDateIbu(context);
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
                      Expanded(
                        child: IgnorePointer(
                          ignoring:
                              dataKabupatenKotaIbu.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataKabupatenKota>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedKabupatenIbu, // Ini bisa null
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
                            items: dataKabupatenKotaIbu.map((item) {
                              return DropdownMenuItem<DataKabupatenKota>(
                                value: item,
                                child: Text(item.namaKabupatenKota),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedKabupatenIbu = value;
                                dataKecamatanIbu.clear();
                                dataKecamatanIbu.addAll(value!.kecamatan);
                                //clear list
                                dataDesaKelurahanIbu.clear();
                                dataDusunIbu.clear();

                                //clear data
                                selectedKecamatanIbu = null;
                                selectedDesaIbu = null;
                                selectedDusunIbu = null;
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
                          ignoring: dataKecamatanIbu.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataKecamatan>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedKecamatanIbu, // Ini bisa null
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
                            items: dataKecamatanIbu.map((item) {
                              return DropdownMenuItem<DataKecamatan>(
                                value: item,
                                child: Text(item.namaKecamatan),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedKecamatanIbu = value;
                                dataDesaKelurahanIbu.clear();
                                dataDesaKelurahanIbu
                                    .addAll(value!.desaKelurahan);

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
                              dataDesaKelurahanIbu.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataDesaKelurahan>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedDesaIbu, // Ini bisa null
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
                            items: dataDesaKelurahanIbu.map((item) {
                              return DropdownMenuItem<DataDesaKelurahan>(
                                value: item,
                                child: Text(item.namaDesaKelurahan),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedDesaIbu = value;
                                dataDusunIbu.clear();
                                dataDusunIbu.addAll(value!.dusun);

                                //clear data
                                selectedDusunIbu = null;
                              });
                            },
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
                          ignoring: dataDusunIbu.isNotEmpty ? false : true,
                          child: DropdownButtonFormField2<DataDusun>(
                            isExpanded: true,
                            style: AppTextStyles.primaryTextNormal.copyWith(
                              fontSize: 12,
                            ),
                            value: selectedDusunIbu, // Ini bisa null
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
                            items: dataDusunIbu.map((item) {
                              return DropdownMenuItem<DataDusun>(
                                value: item,
                                child: Text(item.namaDusun),
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
                            fieldName: 'rtIbu',
                            onTap: () {},
                            controller: rTIbuController,
                            focusNode: rtIbuFocusNode,
                            formFieldKey: rtIbuKey,
                            hintText: 'RT',
                            isPasswordField: false,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            clientValidators: [
                              FormBuilderValidators.required()
                            ]),
                      ),
                      Expanded(
                        child: TextFieldWidget2(
                          onTap: () {},
                          fieldName: 'rwIbu ',
                          focusNode: rwIbuFocusNode,
                          formFieldKey: rwIbuKey,
                          controller: rWIbuController,
                          hintText: 'RW',
                          isPasswordField: false,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          clientValidators: [FormBuilderValidators.required()],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget2(
                    onTap: () {},
                    fieldName: 'alamatIbu',
                    focusNode: alamatIbuFocusNode,
                    formFieldKey: alamatIbuKey,
                    controller: alamatIbuController,
                    hintText: 'Masukan alamat lengkap',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    isPasswordField: false,
                    clientValidators: [FormBuilderValidators.required()],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Nomor Telepon (WA aktif)',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget2(
                    onTap: () {},
                    fieldName: 'teleponIbu',
                    controller: teleponIbuController,
                    focusNode: teleponIbuFocusNode,
                    formFieldKey: teleponIbuKey,
                    hintText: 'Masukan nomor telepon',
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    isPasswordField: false,
                    clientValidators: [
                      FormBuilderValidators.minLength(10,
                          checkNullOrEmpty: false, errorText: 'Minimal 10'),
                      FormBuilderValidators.maxLength(13,
                          checkNullOrEmpty: false, errorText: 'Minimal 13')
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
                              value: selectedJenisKBIbu,
                              onChanged: (value) {
                                setState(() {
                                  selectedJenisKBIbu = value;
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
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
                      _selectDateKelahiranSebelumnyaIbu(context);
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
                    fieldName: 'jumlahAnakIbu',
                    onTap: () {},
                    focusNode: jumlahAnakIbuFocusNode,
                    formFieldKey: jumlahAnakIbuKey,
                    controller: jumlahAnakIbuController,
                    hintText: 'Jumlah Anak',
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    isPasswordField: false,
                    clientValidators: [FormBuilderValidators.numeric()],
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Disabilitas',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  // Tampilkan disabilitas yang dipilih
                  Column(
                    children: selectedDisabilityLabelsIbu.map((label) {
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
                            _removeDisabilityIbu(label);
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
                            selectedDisabilities: selectedDisabilitiesIbu,
                            onToggleDisability: _toggleDisabilityIbu,
                            onAddCustomDisability: (String customDisability) {
                              setState(() {
                                disabilities.add(customDisability);
                                selectedDisabilitiesIbu.add(true);
                                selectedDisabilityLabelsIbu
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
                      logger.d("trigger simpan");
                      submitForm();
                      // bool isValidAllDataAyah = validateAyah();
                      // logger.d('is validate Data ayah $isValidAllDataAyah');
                      // if (isValidAllDataAyah) {
                      //   print('Form valid');
                      //   // Validate the form
                      //   if (formkey.currentState!.validate()) {
                      //     PostOrangTuaBody dataOrangTua = PostOrangTuaBody(
                      //       ayah: Ayah(
                      //         alamat: alamatAyahController.text,
                      //         nomorKartuKeluarga: kkAyahController.text,
                      //         dusunId: selectedDusunAyah!.id,
                      //         golDarah: selectedGolDarahAyah!,
                      //         namaAyah: namaAyahController.text,
                      //         nik: nikAyahController.text,
                      //         nomorTelepon: teleponAyahController.text.isNotEmpty
                      //             ? teleponAyahController.text
                      //             : null,
                      //         rt: rTAyahController.text,
                      //         rw: rWAyahController.text,
                      //         tempatLahir: tempatLahirAyahController.text,
                      //         tanggalLahir: tanggalLahirAyahController.text,
                      //         jenisDisabilitas: selectedDisabilityLabelsAyah.map((e) {
                      //           return JenisDisabilitas(namaDisabilitas: e);
                      //         }).toList(),
                      //       ),
                      //       ibu: Ibu(
                      //         tanggalMelahirkanSebelumnya:
                      //             tanggalKelahiranAnakSebelumnyaIbuController.text !=
                      //                     ""
                      //                 ? tanggalKelahiranAnakSebelumnyaIbuController
                      //                     .text
                      //                 : null,
                      //         jumlahAnak: jumlahAnakIbuController.text != ""
                      //             ? int.parse(jumlahAnakIbuController.text)
                      //             : 0,
                      //         jenisKb: selectedJenisKBIbu!,
                      //         alamat: alamatIbuController.text,
                      //         nomorKartuKeluarga: kkIbuController.text,
                      //         dusunId: selectedDusunIbu!.id,
                      //         golDarah: selectedGolDarahIbu!,
                      //         namaIbu: namaIbuController.text,
                      //         nik: nikIbuController.text,
                      //         nomorTelepon: teleponIbuController.text.isNotEmpty
                      //             ? teleponIbuController.text
                      //             : null,
                      //         rt: rTIbuController.text,
                      //         rw: rWIbuController.text,
                      //         tempatLahir: tempatLahirIbuController.text,
                      //         tanggalLahir: tanggalLahirIbuController.text,
                      //         jenisDisabilitas: selectedDisabilityLabelsIbu.map((e) {
                      //           return JenisDisabilitas(namaDisabilitas: e);
                      //         }).toList(),
                      //       ),
                      //     );

                      //     context.read<CreateRegisterOrangTuaBloc>().add(
                      //         SendRegisterOrangTua(postOrangTuaBody: dataOrangTua));
                      //   } else {
                      //     print("Form tidak valid");
                      //     showTopSnackBar(
                      //         Overlay.of(context),
                      //         animationDuration: const Duration(milliseconds: 600),
                      //         displayDuration: const Duration(milliseconds: 2200),
                      //         reverseAnimationDuration:
                      //             const Duration(milliseconds: 300),
                      //         TopSnackbarWidget().error(
                      //             'Terdapat data yang kosong pada data Ibu, harap di cek kembali'));
                      //   }
                      // } else {
                      //   showTopSnackBar(
                      //       Overlay.of(context),
                      //       animationDuration: const Duration(milliseconds: 600),
                      //       displayDuration: const Duration(milliseconds: 2200),
                      //       reverseAnimationDuration:
                      //           const Duration(milliseconds: 300),
                      //       TopSnackbarWidget().error(
                      //           'Terdapat data Ayah yang kosong, harap di cek kembali'));
                      // }
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: _navigateBack,
                  //     child: Text(
                  //       'Kembali Ke data Ayah',
                  //       style: AppTextStyles.secoundaryTextMedium.copyWith(
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
