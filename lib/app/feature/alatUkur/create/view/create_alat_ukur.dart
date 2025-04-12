import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/alatUkur/create/bloc/create_alat_ukur_bloc.dart';
import 'package:puspadaya/app/view/widget/top_snackbar/top_snackbar_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/validator/validator.dart';
import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/checkbox_list_widget.dart';
import '../../../../view/widget/dropdown_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../../../../view/widget/textField_widget.dart';
import '../model/post_alat_ukur_alat_deteksi_dini_model.dart';
import '../model/post_alat_ukur_model.dart';

class CreateAlatUkur extends StatelessWidget {
  const CreateAlatUkur({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAlatUkurBloc(),
      child: const CreateAlatUkurView(),
    );
  }
}

class CreateAlatUkurView extends StatefulWidget {
  const CreateAlatUkurView({super.key});

  @override
  State<CreateAlatUkurView> createState() => _CreateAlatUkurViewState();
}

class _CreateAlatUkurViewState extends State<CreateAlatUkurView> {
  final TextEditingController _otherController = TextEditingController();
  final TextEditingController _merekAlatController = TextEditingController();
  // form key
  final _formKey = GlobalKey<FormState>();
  List<String> selectJenisAlat = [];
  final List<String> selectKondisiAlat = [
    'Baik',
    'Dimanfaatkan',
    'Rusak',
  ];
  final Map<String, String> alatGambarMap = {
    'Timbangan Injak Berat Badan Digital': imageTimbanganInjakBeratBadanDigital,
    'Timbangan Injak Berat Badan Non-Digital':
        imageTimbanganInjakBeratBadanNonDigital,
    'Timbangan Bayi Digital': imageTimbanganBayiDigital,
    'Timbangan Bayi Non Digital': imageTimbanganBayiNonDigital,
    'Timbangan Dacin': imageTimbanganDacin,
    'Alat Ukur Badan (Microtoise)': imageAlatUkurBadanMicrotoise,
    'Alat Ukur Panjang Tinggi Badan (Stadiometer)':
        imageAlatUkurPanjangTinggiBadanStadiometer,
    'Papan Pengukur Panjang Badan': imagePapanPengukurPanjangBadan,
    'Pita Lingkar Lengan Atas': imagePitLingkarLenganAtas,
    'Alat Ukur Lingkar Kepala': imageAlatUkurLingkarKepala,
    'Metline': imageMetline,
  };

  String? selectedAlat;
  String? selectedAlatId;
  String? selectedKondisiAlat;
  List<Map<String, dynamic>> alatDeteksiDini = [
    {'label': 'Kubus', 'isChecked': false, 'isOther': false},
    {'label': 'Lonceng', 'isChecked': false, 'isOther': false},
    {'label': 'Rattles atau kerincingan', 'isChecked': false, 'isOther': false},
    {'label': 'Benang wol merah', 'isChecked': false, 'isOther': false},
    {'label': 'Sapu tangan', 'isChecked': false, 'isOther': false},
    {'label': 'Kartu bergambar', 'isChecked': false, 'isOther': false},
    {'label': 'Cangkir plastik', 'isChecked': false, 'isOther': false},
    {'label': 'Bola Tenis', 'isChecked': false, 'isOther': false},
    {'label': 'Bola sepak bahan plastik', 'isChecked': false, 'isOther': false},
    {'label': 'Botol ulir', 'isChecked': false, 'isOther': false},
    {
      'label': 'Pensil warna terdiri 6 warna',
      'isChecked': false,
      'isOther': false
    },
    {'label': 'Senter / penlight', 'isChecked': false, 'isOther': false},
    {'label': 'Tas ban canvas', 'isChecked': false, 'isOther': false},
    {
      'label': 'Kartu warna (merah, biru, putih, hijau, kuning)',
      'isChecked': false,
      'isOther': false
    },
    {
      'label': 'Kartu E terdiri dari 2 buah:\n'
          'a. Kartu E 6/60 ukuran huruf E 88 mm,84 mm, 17,6 mm.\n'
          'b. Kartu E 6/12 ukuran huruf E 17,6 mm, 16,8 mm, 3,52 mm.',
      'isChecked': false,
      'isOther': false
    },
    {'label': 'Lainnya', 'isChecked': false, 'isOther': true},
  ];

  @override
  void initState() {
    super.initState();
    context.read<CreateAlatUkurBloc>().add(GetAlatUkurAdmin());
  }

  // Method to get selected labels
  List<String> getSelectedLabels() {
    // select all labels kecuali lainnya
    List<String> selectedLabels = alatDeteksiDini
        .where((item) => item['isChecked'] == true && item['isOther'] == false)
        .map((item) => item['label'] as String)
        .toList();

    // Cek apakah "Lainnya" dicentang dan tambahkan teks dari _otherController jika tidak kosong
    Map<String, dynamic>? otherItem = alatDeteksiDini.firstWhere(
      (item) => item['isOther'] == true,
      orElse: () => {},
    );

    if (otherItem.isNotEmpty && otherItem['isChecked'] == true) {
      String otherText = _otherController.text.trim();
      if (otherText.isNotEmpty) {
        selectedLabels.add(otherText);
      }
    }

    return selectedLabels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Buat Alat Ukur',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<CreateAlatUkurBloc, CreateAlatUkurState>(
          listener: (context, state) {
            if (state is CreateAlatUkurPostSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().success("Berhasil Membuat Alat Ukur"),
              );
              Navigator.pop(context, true);
            }
            if (state is CreateAlatUkurPostFailed) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().error(state.message),
              );
            }
          },
          builder: (context, state) {
            if (state is CreateAlatUkurInitialFormLoading) {
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
            if (state is CreateAlatUkurInitialFormFailed) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is CreateAlatUkurInitialFormSuccess) {
              selectJenisAlat.clear();

              // Use forEach to add each jenis_alat to the selectJenisAlat list
              state.alatUkurAdmin
                  .forEach((e) => selectJenisAlat.add(e.jenisAlat));

              // Log the result
              logger.d(selectJenisAlat);

              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jenis Alat',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        DropdownWidget(
                          hint: "Pilih Jenis Alat",
                          value: selectedAlat,
                          validator: (value) {
                            if (value == null) {
                              return 'Pilih Jenis Alat';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedAlat = value;
                              selectedAlatId = state.alatUkurAdmin
                                  .firstWhere((e) => e.jenisAlat == value)
                                  .id;
                            });
                          },
                          items: selectJenisAlat,
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        selectedAlat == 'Alat Deteksi Dini'
                            ? _buildSDIDTK()
                            : Column(
                                // Wrap the map in a Column to display the images
                                children: state.alatUkurAdmin
                                    .where((e) => e.jenisAlat == selectedAlat)
                                    .map((e) {
                                  // Check if image_url is not null
                                  logger.d(e.imageUrl);
                                  if (e.imageUrl != null) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8), // Give border radius
                                      child: Image.network(
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                8), // Give border radius
                                            child: Image.asset(
                                              noImagePlacholder, // Use Image.network for URLs
                                              height: 300,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ); // R
                                        },
                                        ApiUtils().urlGetPublicImage(e
                                            .imageUrl!), // Use Image.network for URLs
                                        height: 300,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8), // Give border radius
                                      child: Image.asset(
                                        noImagePlacholder, // Use Image.network for URLs
                                        height: 300,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ); // Return an empty container if image_url is null
                                  }
                                }).toList(),
                              ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Merek Alat',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        TextFieldWidget(
                          controller: _merekAlatController,
                          hintText: "Masukan Merek Alat",
                          keyboardType: TextInputType.text,
                          validators: [
                            (value) => Validator.required(
                                value),
                          ],
                          obscureText: false,
                          isPasswordField: false,
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Kondisi Alat',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        DropdownWidget(
                          hint: "Pilih Kondisi Alat",
                          value: selectedKondisiAlat,
                          validator: (value) {
                            if (value == null) {
                              return 'Pilih Kondisi Alat';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedKondisiAlat = value;
                            });
                          },
                          items: selectKondisiAlat,
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        ButtonPrimary(
                          color: bluePrimaryMain,
                          mainButtonMessage: 'Simpan',
                          mainButton: () {
                            if (_formKey.currentState!.validate()) {
                              if (selectedAlat == 'Alat Deteksi Dini') {
                                List<String> selectedLabels =
                                    getSelectedLabels();
                                logger.d('selectedAlatId ${selectedAlatId}');
                                logger.d(
                                    'merek alat ${_merekAlatController.text}');
                                logger.d('kondisi alat ${selectedKondisiAlat}');
                                //get label alat deteksi dini yang di selected
                                logger.d('Selected Labels: $selectedLabels');
                                PostAlatUkurAlatDeteksiDiniModel
                                    postAlatUkurAlatDeteksiDini =
                                    PostAlatUkurAlatDeteksiDiniModel(
                                  merekAlat: _merekAlatController.text,
                                  kondisiAlat: selectedKondisiAlat!,
                                  alatPengukuranAdminId: selectedAlatId!,
                                  checklistItems: selectedLabels,
                                );
                                context.read<CreateAlatUkurBloc>().add(
                                    PostAlatUkurAlatDini(
                                        postAlatUkurAlatDeteksiDini));
                              } else {
                                logger.d('selectedAlatId ${selectedAlatId}');
                                logger.d(
                                    'merek alat ${_merekAlatController.text}');
                                logger.d('kondisi alat ${selectedKondisiAlat}');
                                PostAlatUkurModel postAlatUkurData =
                                    PostAlatUkurModel(
                                  jenisAlatId: selectedAlatId!,
                                  merekAlat: _merekAlatController.text,
                                  kondisiAlat: selectedKondisiAlat!,
                                );
                                context
                                    .read<CreateAlatUkurBloc>()
                                    .add(PostAlatUkur(postAlatUkurData));
                              }
                            } else {
                              logger.d('form not valid');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Column _buildSDIDTK() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alat Deteksi Dini (opsional)',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
        Column(
          children: alatDeteksiDini.map((alat) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Agar teks wrap
              children: [
                Checkbox(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -0),
                  side: BorderSide(color: stroke10, width: 2),
                  activeColor: bluePrimaryMain,
                  checkColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: alat['isChecked'],
                  onChanged: (value) {
                    logger.d(
                        'is other = ${alat['isOther'] == true && alat['isChecked'] == true}');
                    setState(() {
                      alat['isChecked'] = value!;
                      // Jika "Lainnya" dicentang tetapi kemudian tidak dicentang, hapus input
                      if (alat['isOther'] == true && !value) {
                        _otherController.clear();
                      }
                    });
                  },
                ),
                SizedBox(width: 4),
                Flexible(
                  // Menangani overflow
                  child: Text(
                    alat['label'],
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                if (alat['isOther'] == true && alat['isChecked'] == true) ...[
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      enabled: alat['isChecked'],
                      controller: _otherController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        isDense: true,
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
