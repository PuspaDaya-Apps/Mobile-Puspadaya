import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/model/paketToScreen/paket_to_create_wali_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/generate_button_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
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
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../alamat/bloc/alamat_bloc.dart';
import '../bloc/createAnakBloc/create_anak_bloc.dart';
import '../cubit/generate_kk_cubit.dart';
import '../cubit/generate_nik_cubit.dart';
import '../model/create_anak_model.dart';

class CreateRegisterWali extends StatelessWidget {
  const CreateRegisterWali({super.key, required this.paket});

  final PaketToCreateWaliModel paket;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenerateKkCubit()),
        BlocProvider(create: (context) => GenerateNikCubit()),
        BlocProvider(
          create: (context) => AlamatBloc(),
        ),
        BlocProvider.value(
          value: paket.createAnakBloc,
        ),
      ],
      child: CreateRegisterWaliView(
        paket: paket,
      ),
    );
  }
}

class CreateRegisterWaliView extends StatefulWidget {
  const CreateRegisterWaliView({super.key, required this.paket});

  final PaketToCreateWaliModel paket;

  @override
  State<CreateRegisterWaliView> createState() => _CreateRegisterWaliViewState();
}

class _CreateRegisterWaliViewState extends State<CreateRegisterWaliView> {
  List<ProvinsiModel.Datum> selectProvinsi = [];
  List<KabupatenModel.Datum> selectKabupaten = [];
  List<KecamatanModel.Datum> selectKecamatan = [];
  List<DesaKelurahanModel.Datum> selectDesaKelurahan = [];
  List<DusunModel.Datum> selectDusun = [];

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nikController = TextEditingController();

  TextEditingController _kkController = TextEditingController();

  TextEditingController _namaController = TextEditingController();

  TextEditingController _tempatLahirController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  TextEditingController _teleponController = TextEditingController();

  TextEditingController _rTController = TextEditingController();

  TextEditingController _rWController = TextEditingController();

  // Controller untuk Data Wali
  String? selectedStatusHubunganDenganAnak;
  String? selectedProvinsiWali;

  String? selectedKabupatenWali;

  String? selectedKecamatanWali;

  String? selectedDesaWali;

  String? selectedDusunIdWali;

  String? selectedGolDarahWali;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesWali = [];

  List<String> selectedDisabilityLabelsWali = [];

  @override
  void initState() {
    super.initState();
    //! ketika memilih kabupaten pastikan ada provinsi,
    selectedDisabilitiesWali =
        List<bool>.from(List.filled(disabilities.length, false));
    context.read<AlamatBloc>().add(ShowAllSectionEvent());
  }

  void _toggleDisability(int index) {
    setState(() {
      selectedDisabilitiesWali[index] = !selectedDisabilitiesWali[index];
      if (selectedDisabilitiesWali[index]) {
        selectedDisabilityLabelsWali.add(disabilities[index]);
      } else {
        selectedDisabilityLabelsWali.remove(disabilities[index]);
      }
    });
  }

  void _removeDisability(String label) {
    setState(() {
      selectedDisabilityLabelsWali.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilitiesWali[index] = false;
      }
    });
  }

  bool _isGenerateWaliValid() {
    return _tempatLahirController.text.isNotEmpty &&
        _tanggalLahirController.text.isNotEmpty &&
        selectedProvinsiWali !=
            null && // Check if selectedProvinsiWali is not null
        selectedKabupatenWali !=
            null && // Check if selectedKabupatenWali is not null
        selectedKecamatanWali !=
            null; // Check if selectedDusunWaliId is not null
  }

  Future<void> _selectDate(BuildContext context) async {
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
        _tanggalLahirController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final createAnakBloc = BlocProvider.of<CreateAnakBloc>(context);
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Tambah Data Wali',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AlamatBloc, AlamatState>(
            builder: (context, state) {
              if (state is AlamatLoading) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: bluePrimaryMain,
                    ),
                  ),
                );
              } else if (state is AlamatFailure) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is ShowAllSection) {
                selectProvinsi = state.provinsi;
                selectKabupaten = state.kabupaten;
                selectKecamatan = state.kecamatan;
                selectDesaKelurahan = state.desaKelurahan;
                selectDusun = state.dusun;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Status Hubungan Dengan Anak',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        DropdownWidget(
                          items: selectStatusHubunganDenganAnak,
                          hint: 'Status Hubungan Dengan Anak',
                          value: selectedStatusHubunganDenganAnak,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Kabupaten harus dipilih";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedStatusHubunganDenganAnak = value;
                            });
                          },
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Nomor Kartu Keluarga',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        BlocConsumer<GenerateKkCubit, GenerateKkState>(
                          listener: (context, state) {
                            if (state is GenerateKKSuccess) {
                              _kkController.text =
                                  state.data.data.nomorKartuKeluarga;
                            }
                          },
                          builder: (context, state) {
                            if (state is GenerateKKLoading) {
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
                                  child: TextFieldWidget(
                                    controller: _kkController,
                                    hintText: 'Masukan Nomor Kartu Keluarga',
                                    isPasswordField: false,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                    validators: [
                                      (value) => Validator.required(value,
                                          "Kartu Keluarga tidak boleh kosong"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width /
                                      3.4, // Atur lebar minimum untuk tombol
                                  child: GenerateButtonWidget(
                                    onPressed: () {
                                      // Validasi sebelum mengizinkan generate
                                      if (_isGenerateWaliValid()) {
                                        // Logika untuk generate
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
                                                'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate KK'));
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
                          'NIK',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        BlocConsumer<GenerateNikCubit, GenerateNikState>(
                          listener: (context, state) {
                            if (state is GenerateNikSuccess) {
                              _nikController.text =
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
                                    controller: _nikController,
                                    hintText: 'NIK',
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    isPasswordField: false,
                                    validators: [
                                      (value) => Validator.consistOf(value, 16,
                                          "NIk Wali harus terdiri atas 16 digit"),
                                      (value) => Validator.required(
                                          value, "NIK Wali tidak boleh kosong"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width /
                                      3.4, // Atur lebar minimum untuk tombol
                                  child: GenerateButtonWidget(
                                    onPressed: () {
                                      // Validasi sebelum mengizinkan generate
                                      if (_isGenerateWaliValid()) {
                                        // Logika untuk generate
                                        print("Generate button pressed");
                                        context
                                            .read<GenerateNikCubit>()
                                            .getGenerateNik(_kkController.text,
                                                _tanggalLahirController.text);
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
                                                'Harap isi Tempat Tanggal Lahir, dan alamat agar bisa generate NIK'));
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
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        TextFieldWidget(
                          controller: _namaController,
                          hintText: 'Masukan Nama',
                          isPasswordField: false,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          validators: [
                            (value) => Validator.required(
                                value, "Nama Wali tidak boleh kosong"),
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
                                    controller: _tempatLahirController,
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
                            // provinsi
                            Expanded(
                              child: DropdownWidget(
                                items: selectProvinsi
                                    .map((provinsi) => provinsi.namaProvinsi)
                                    .toSet() // Menghilangkan duplikasi
                                    .toList(),
                                hint: 'Provinsi',
                                value: selectedProvinsiWali,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Provinsi harus dipilih";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    selectedProvinsiWali = value;
                                  });
                                },
                              ),
                            ),
                            // kabupaten
                            Expanded(
                              child: DropdownWidget(
                                items: selectKabupaten
                                    .map((kabupaten) =>
                                        kabupaten.namaKabupatenKota)
                                    .toList(),
                                hint: 'Kabupaten',
                                value: selectedKabupatenWali,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Kabupaten harus dipilih";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    selectedKabupatenWali = value;
                                  });
                                },
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
                            // kecamatan
                            Expanded(
                              child: DropdownWidget(
                                items: selectKecamatan
                                    .map((kecamatan) => kecamatan.namaKecamatan)
                                    .toList(),
                                hint: 'Kecamatan',
                                value: selectedKecamatanWali,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Kecamatan harus dipilih";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    logger.d('selected Kecamatan id ${value}');
                                    // context
                                    //     .read<AlamatBloc>()
                                    //     .add(SelectKabupaten(selectedProvinsiId));
                                    selectedKecamatanWali = value;
                                  });
                                },
                              ),
                            ),
                            // desa
                            Expanded(
                              child: DropdownWidget(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Desa harus dipilih";
                                  }
                                  return null;
                                },
                                items: selectDesaKelurahan
                                    .map((desa) => desa.namaDesaKelurahan)
                                    .toList(),
                                hint: 'Desa',
                                value: selectedDesaWali,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDesaWali = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        DropdownWidget(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Dusun harus dipilih";
                            }
                            return null;
                          },
                          items: selectDusun
                              .map((dusun) => dusun.namaDusun)
                              .toList(), // Menampilkan Nama Dusun
                          hint: 'Dusun',

                          value: selectedDusunIdWali != null
                              ? selectDusun
                                  .firstWhere(
                                    (dusun) => dusun.id == selectedDusunIdWali,
                                    orElse: () => selectDusun
                                        .first, // Handle jika tidak ditemukan
                                  )
                                  .namaDusun
                              : null, // Menampilkan nama sesuai ID yang dipilih
                          onChanged: (value) {
                            setState(() {
                              final selectedDusun = selectDusun.firstWhere(
                                (dusun) => dusun.namaDusun == value,
                                orElse: () => selectDusun
                                    .first, // Default jika tidak ditemukan
                              );

                              selectedDusunIdWali =
                                  selectedDusun.id; // Simpan ID, bukan nama
                              logger.d(
                                  'Selected Dusun ID: ${selectedDusunIdWali}');
                            });
                          },
                        ),

                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        Row(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                controller: _rTController,
                                hintText: 'RT',
                                isPasswordField: false,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                validators: [
                                  (value) => Validator.required(
                                      value, "RT Tidak Boleh Kosong"),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                controller: _rWController,
                                hintText: 'RW',
                                isPasswordField: false,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                validators: [
                                  (value) => Validator.required(
                                      value, "RW Tidak Boleh Kosong"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        TextFieldWidget(
                          controller: _alamatController,
                          hintText: 'Masukan alamat lengkap',
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          isPasswordField: false,
                          validators: [
                            (value) => Validator.required(
                                value, "Alamat tidak boleh kosong"),
                          ],
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Nomor Telepon (WA aktif)',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        TextFieldWidget(
                          controller: _teleponController,
                          hintText: 'Masukan nomor telepon',
                          keyboardType: TextInputType.phone,
                          obscureText: false,
                          isPasswordField: false,
                          validators: [
                            (value) => Validator.required(
                                value, "Nomor Telepon tidak boleh kosong"),
                          ],
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Golongan Darah',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        DropdownWidget(
                          items: selectGolDarah,
                          hint: 'Golongan Darah',
                          validator: (value) {
                            if (value == null) {
                              return "Golongan Darah harus dipilih";
                            }
                            return null;
                          },
                          value: selectedGolDarahWali,
                          onChanged: (value) {
                            setState(() {
                              selectedGolDarahWali = value;
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
                          children: selectedDisabilityLabelsWali.map((label) {
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
                                  selectedDisabilities:
                                      selectedDisabilitiesWali,
                                  onToggleDisability: _toggleDisability,
                                  onAddCustomDisability:
                                      (String customDisability) {
                                    setState(() {
                                      disabilities.add(customDisability);
                                      selectedDisabilitiesWali.add(true);
                                      selectedDisabilityLabelsWali
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
                          bloc: widget.paket.createAnakBloc,
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
                              mainButtonMessage: 'Selanjutnya',
                              mainButton: () async {
                                if (_formKey.currentState!.validate()) {
                                  createAnakBloc.add(CreateAnak(
                                      widget.paket.createAnakModel.copyWith(
                                          pengasuh: Pengasuh(
                                              statusHubungan:
                                                  selectedStatusHubunganDenganAnak!,
                                              nik: _nikController.text,
                                              namaPengasuh:
                                                  _namaController.text,
                                              tempatLahir:
                                                  _tempatLahirController.text,
                                              tanggalLahir:
                                                  _tanggalLahirController.text,
                                              rt: _rTController.text,
                                              rw: _rWController.text,
                                              alamatLengkap:
                                                  _alamatController.text,
                                              dusunId: selectedDusunIdWali!,
                                              noTelepon:
                                                  _teleponController.text,
                                              golDarah: selectedGolDarahWali!,
                                              nomorKartuKeluarga:
                                                  _kkController.text,
                                              disabilitasPengasuh:
                                                  selectedDisabilityLabelsWali))));
                                } else {
                                  print("Form tidak valid");
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
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
