import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/model/create_anak_model.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget2.dart';
import 'package:puspadaya/app/view/widget/measure_widget2.dart';
import 'package:puspadaya/app/view/widget/text_field_widget2.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../config/screen_config/image_config.dart';
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
  final scrollController = ScrollController();
  bool _isExpanded = false;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAnak = [];
  List<String> selectedDisabilityLabelsAnak = [];
  //! controller
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
  TextEditingController jarakPosyanduController = TextEditingController();
  TextEditingController upperArmCircumferenceController =
      TextEditingController();
  TextEditingController headCircumferenceController = TextEditingController();
  TextEditingController keluhanController = TextEditingController();

  String? selectedGender;
  String? selectedCaraLahir;
  String? selectedStatusKelahiran;
  String? selectedStatusOrangTuaAnak;
  String? selectedProvinsiIbu;
  String? selectedKabupatenIbu;
  String? selectedKecamatanIbu;

  //! focus node
  FocusNode nomorKKFocusNode = FocusNode();
  FocusNode namaAyahFocusNode = FocusNode();
  FocusNode namaIbuFocusNode = FocusNode();
  FocusNode nikFocusNode = FocusNode();
  FocusNode namaFocusNode = FocusNode();
  FocusNode anakKeFocusNode = FocusNode();
  FocusNode tempatLahirFocusNode = FocusNode();
  FocusNode tanggalLahirFocusNode = FocusNode();
  FocusNode lingkarLenganFocusNode = FocusNode();
  FocusNode lingkarKepalaFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode heightFocusNode = FocusNode();
  FocusNode weightFocusNode = FocusNode();
  FocusNode jarakPosyanduFocusNode = FocusNode();
  FocusNode upperArmCircumferenceFocusNode = FocusNode();
  FocusNode headCircumferenceFocusNode = FocusNode();
  FocusNode keluhanFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode caraLahirFocusNode = FocusNode();
  FocusNode statusKelahiranFocusNode = FocusNode();
  FocusNode statusOrangTuaAnakFocusNode = FocusNode();

  // !formFieldStateKey
  final GlobalKey<FormFieldState> nomorKKFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> namaAyahFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> namaIbuFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> nikFormFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> namaFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> anakKeFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tempatLahirFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> tanggalLahirFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> lingkarLenganFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> lingkarKepalaFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> ageFormFieldKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> heightFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> weightFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> jarakPosyanduFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> upperArmCircumferenceFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> headCircumferenceFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> keluhanFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> genderFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> caraLahirFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> statusKelahiranFormFieldKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> statusOrangTuaAnakFormFieldKey =
      GlobalKey<FormFieldState>();

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

  void submitForm(CreateAnakBloc createAnakBloc) {
    logger.d("Jarak Posyandu ${jarakPosyanduController.text}");
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
                        kartuKeluargaId: paketToCreateAnakModel.idKartuKeluarga,
                        nik: nikController.text,
                        anakKe: int.parse(anakKeController.text),
                        namaAnak: namaController.text,
                        tempatLahir: tempatLahirController.text,
                        tanggalLahir: tanggalLahirController.text,
                        beratBadanLahir: double.parse(weightController.text),
                        jarakPosyandu:
                            double.tryParse(jarakPosyanduController.text) ?? 0,
                        tinggiBadanLahir: double.parse(heightController.text),
                        lingkarKepalaLahir:
                            double.parse(headCircumferenceController.text),
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
            kartuKeluargaId: paketToCreateAnakModel.idKartuKeluarga,
            nik: nikController.text,
            anakKe: int.parse(anakKeController.text),
            namaAnak: namaController.text,
            tempatLahir: tempatLahirController.text,
            tanggalLahir: tanggalLahirController.text,
            beratBadanLahir: double.parse(weightController.text),
            jarakPosyandu: double.tryParse(jarakPosyanduController.text) ?? 0,
            tinggiBadanLahir: double.parse(heightController.text),
            lingkarKepalaLahir: double.parse(headCircumferenceController.text),
            lingkarLenganAtasLahir:
                double.parse(upperArmCircumferenceController.text),
            caraLahir: selectedCaraLahir!,
            jenisKelamin: selectedGender!,
            statusKelahiran: selectedStatusKelahiran!,
            disabilitasAnak: selectedDisabilityLabelsAnak,
            statusOrangTua: selectedStatusOrangTuaAnak!,
            pengasuh: null)));
      }
      logger.d('go to simpan');
    } else {
      logger.d("form tidak valid");
      final Map<GlobalKey<FormFieldState>, FocusNode> fieldMap = {
        nomorKKFormFieldKey: nomorKKFocusNode,
        nikFormFieldKey: nikFocusNode,
        namaAyahFormFieldKey: namaAyahFocusNode,
        namaIbuFormFieldKey: namaIbuFocusNode,
        namaFormFieldKey: namaFocusNode,
        anakKeFormFieldKey: anakKeFocusNode,
        tempatLahirFormFieldKey: tempatLahirFocusNode,
        tanggalLahirFormFieldKey: tanggalLahirFocusNode,
        weightFormFieldKey: weightFocusNode,
        heightFormFieldKey: heightFocusNode,
        headCircumferenceFormFieldKey: headCircumferenceFocusNode,
        upperArmCircumferenceFormFieldKey: upperArmCircumferenceFocusNode,
        lingkarLenganFormFieldKey: lingkarLenganFocusNode,
        jarakPosyanduFormFieldKey: jarakPosyanduFocusNode,
        lingkarKepalaFormFieldKey: lingkarKepalaFocusNode,
        caraLahirFormFieldKey: caraLahirFocusNode,
        statusKelahiranFormFieldKey: statusKelahiranFocusNode,
        statusOrangTuaAnakFormFieldKey: statusOrangTuaAnakFocusNode,
        genderFormFieldKey: genderFocusNode
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

    setState(() {
      tanggalLahirController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
  }

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
          controller: scrollController,
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
                            focusNode: nomorKKFocusNode,
                            key: nomorKKFormFieldKey,
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
                                    (value) => Validator.required(value),
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
                                    (value) => Validator.required(value),
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
                            return Row(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex:
                                      7, // Adjust this value to make the TextField larger
                                  child: TextFieldWidget2(
                                    fieldName: 'nik',
                                    focusNode: nikFocusNode,
                                    formFieldKey: nikFormFieldKey,
                                    onTap: () {},
                                    controller: nikController,
                                    hintText: 'NIK',
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                    isPasswordField: false,
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
                                      logger
                                          .d('KK : ${nomorKKController.text}');
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
                                          animationDuration:
                                              const Duration(milliseconds: 600),
                                          displayDuration: const Duration(
                                              milliseconds: 2200),
                                          reverseAnimationDuration:
                                              const Duration(milliseconds: 300),
                                          TopSnackbarWidget().error(
                                              'Harap pilih data Orang tua dan isi Tempat Tanggal Lahir agar bisa generate NIK'));
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
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        TextFieldWidget2(
                          fieldName: 'nama',
                          focusNode: namaFocusNode,
                          onTap: () {},
                          formFieldKey: namaFormFieldKey,
                          controller: namaController,
                          hintText: 'Nama',
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
                          'Anak Ke',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        TextFieldWidget2(
                          onTap: () {},
                          fieldName: 'anak_ke',
                          focusNode: anakKeFocusNode,
                          formFieldKey: anakKeFormFieldKey,
                          controller: anakKeController,
                          hintText: 'Anak Ke',
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          isPasswordField: false,
                          clientValidators: [
                            FormBuilderValidators.required(
                                errorText: "Isi terlebih dahulu!"),
                            FormBuilderValidators.numeric(
                                errorText: "Anak ke harus berupa angka!"),
                            FormBuilderValidators.min(1,
                                errorText: "Anak ke minimal 1!"),
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
                                  TextFieldWidget2(
                                    onTap: () {},
                                    fieldName: 'tempat_lahir',
                                    focusNode: tempatLahirFocusNode,
                                    formFieldKey: tempatLahirFormFieldKey,
                                    controller: tempatLahirController,
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
                                  SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(8)),
                                  DateTimePickerWidget(
                                    focusNode: tanggalLahirFocusNode,
                                    key: tanggalLahirFormFieldKey,
                                    controller: tanggalLahirController,
                                    hintText: 'Tanggal Lahir',
                                    selectDate: () {
                                      _selectDate(context);
                                      tanggalLahirFormFieldKey.currentState!
                                          .validate();
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
                                  MeasurementWidget2(
                                    fieldName: 'tinggi_lahir',
                                    focusNode: heightFocusNode,
                                    onTap: () {},
                                    formFieldKey: heightFormFieldKey,
                                    title: 'Tinggi Lahir',
                                    hintText: 'contoh: 37.5',
                                    unit: 'cm',
                                    controller: heightController,
                                    clientValidators: [
                                      FormBuilderValidators.required(
                                          errorText: "Isi terlebih dahulu!"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  MeasurementWidget2(
                                    fieldName: 'lingkar_lengan',
                                    focusNode: lingkarLenganFocusNode,
                                    onTap: () {},
                                    formFieldKey: lingkarLenganFormFieldKey,
                                    title: 'Lingkar Lengan',
                                    hintText: 'contoh: 3.5',
                                    unit: 'cm',
                                    controller: upperArmCircumferenceController,
                                    clientValidators: [
                                      FormBuilderValidators.required(
                                          errorText: "Isi terlebih dahulu!"),
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
                                  MeasurementWidget2(
                                    fieldName: 'berat_lahir',
                                    focusNode: weightFocusNode,
                                    onTap: () {},
                                    formFieldKey: weightFormFieldKey,
                                    title: 'Berat Lahir',
                                    hintText: 'contoh: 9.5',
                                    unit: 'kg',
                                    controller: weightController,
                                    clientValidators: [
                                      FormBuilderValidators.required(
                                          errorText: "Isi terlebih dahulu!"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16),
                                  ),
                                  MeasurementWidget2(
                                    fieldName: 'lingkar_kepala',
                                    focusNode: headCircumferenceFocusNode,
                                    onTap: () {},
                                    formFieldKey: headCircumferenceFormFieldKey,
                                    title: 'Lingkar Kepala',
                                    hintText: 'contoh: 6.5',
                                    unit: 'cm',
                                    controller: headCircumferenceController,
                                    clientValidators: [
                                      FormBuilderValidators.required(
                                          errorText: "Isi terlebih dahulu!"),
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
                        DropdownWidget2(
                          focusNode: genderFocusNode,
                          formFieldKey: genderFormFieldKey,
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
                            genderFormFieldKey.currentState?.validate();
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
                        DropdownWidget2(
                          focusNode: caraLahirFocusNode,
                          formFieldKey: caraLahirFormFieldKey,
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
                            caraLahirFormFieldKey.currentState?.validate();
                          },
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Jarak Posyandu (Meter)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        TextFieldWidget2(
                          fieldName: 'jarak_posyandu',
                          focusNode: jarakPosyanduFocusNode,
                          onTap: () {},
                          formFieldKey: jarakPosyanduFormFieldKey,
                          controller: jarakPosyanduController,
                          hintText: 'Jarak Posyandu',
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          isPasswordField: false,
                          clientValidators: [],
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
                        DropdownWidget2(
                          focusNode: statusKelahiranFocusNode,
                          formFieldKey: statusKelahiranFormFieldKey,
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
                            statusKelahiranFormFieldKey.currentState
                                ?.validate();
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
                        DropdownWidget2(
                          focusNode: statusOrangTuaAnakFocusNode,
                          formFieldKey: statusOrangTuaAnakFormFieldKey,
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
                            statusOrangTuaAnakFormFieldKey.currentState
                                ?.validate();
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
                                submitForm(createAnakBloc);
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
