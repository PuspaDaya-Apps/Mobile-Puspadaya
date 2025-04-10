import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/validator/validator.dart';
import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/dropdown_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../../../../view/widget/textField_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../create/model/post_alat_ukur_alat_deteksi_dini_model.dart';
import '../../create/model/post_alat_ukur_model.dart';
import '../../detail/model/get_detail_alat_ukur_model.dart';
import '../../detail/view/detail_alat_ukur.dart';
import '../bloc/update_alat_ukur_bloc.dart';

class UpdateAlatUkur extends StatelessWidget {
  final GetDetailAlatUkurKaderModel detailAlatUkur;
  const UpdateAlatUkur({super.key, required this.detailAlatUkur});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateAlatUkurBloc(),
      child: UpdateAlatUkurView(
        detailAlatUkur: detailAlatUkur,
      ),
    );
  }
}

class UpdateAlatUkurView extends StatefulWidget {
  final GetDetailAlatUkurKaderModel detailAlatUkur;
  const UpdateAlatUkurView({super.key, required this.detailAlatUkur});

  @override
  State<UpdateAlatUkurView> createState() => UpdateAlatUkurViewState();
}

class UpdateAlatUkurViewState extends State<UpdateAlatUkurView> {
  final TextEditingController _otherController = TextEditingController();
  final TextEditingController _merekAlatController = TextEditingController();

  final List<String> selectKondisiAlat = [
    'Baik',
    'Dimanfaatkan',
    'Rusak',
  ];
  String? selectedAlat;
  String? selectedKondisiAlat;

  late List<Map<String, dynamic>> alatDeteksiDini;

  @override
  void initState() {
    super.initState();

    _merekAlatController.text = widget.detailAlatUkur.data.merekAlat;
    selectedKondisiAlat = widget.detailAlatUkur.data.kondisiAlat;

    logger.d('trigger init state');
    _initAlatDeteksiDini();
  }

  void _initAlatDeteksiDini() {
    // List default alat deteksi dini
    alatDeteksiDini = [
      {'label': 'Kubus', 'isChecked': false, 'isOther': false},
      {'label': 'Lonceng', 'isChecked': false, 'isOther': false},
      {
        'label': 'Rattles atau kerincingan',
        'isChecked': false,
        'isOther': false
      },
      {'label': 'Benang wol merah', 'isChecked': false, 'isOther': false},
      {'label': 'Sapu tangan', 'isChecked': false, 'isOther': false},
      {'label': 'Kartu bergambar', 'isChecked': false, 'isOther': false},
      {'label': 'Cangkir plastik', 'isChecked': false, 'isOther': false},
      {'label': 'Bola Tenis', 'isChecked': false, 'isOther': false},
      {
        'label': 'Bola sepak bahan plastik',
        'isChecked': false,
        'isOther': false
      },
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
            'a. Kartu E 6/60 ukuran huruf E 88 mm, 84 mm, 17,6 mm.\n'
            'b. Kartu E 6/12 ukuran huruf E 17,6 mm, 16,8 mm, 3,52 mm.',
        'isChecked': false,
        'isOther': false
      },
      {
        'label': 'Lainnya',
        'isChecked': false,
        'isOther': true
      }, // Sudah ada "Lainnya" di sini
    ];

    String otherValue = ''; // Untuk menyimpan input "Lainnya"

    // Sinkronisasi dengan checklist dari API
    for (var checklist in widget.detailAlatUkur.data.checklists) {
      final index = alatDeteksiDini
          .indexWhere((e) => e['label'] == checklist.namaChecklist);

      if (index != -1) {
        // Jika checklist sudah ada dalam list alatDeteksiDini, update isChecked
        alatDeteksiDini[index]['isChecked'] = true;
      } else {
        // Simpan nama checklist yang tidak ada sebagai input "Lainnya"
        otherValue = checklist.namaChecklist;
      }
    }

    // Jika ada nilai untuk "Lainnya", tandai sebagai checked
    if (otherValue.isNotEmpty) {
      final indexLainnya =
          alatDeteksiDini.indexWhere((e) => e['isOther'] == true);
      if (indexLainnya != -1) {
        alatDeteksiDini[indexLainnya]['isChecked'] = true;
        _otherController.text = otherValue;
      }
    }
  }

  void _onCheckboxChanged(bool? value, Map<String, dynamic> alat) {
    setState(() {
      alat['isChecked'] = value!;
      if (alat['isOther'] == true && !value) {
        _otherController.clear();
      }
    });
  }

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
        title: 'Perbarui Alat Ukur',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<UpdateAlatUkurBloc, UpdateAlatUkurState>(
          listener: (context, state) {
            if (state is UpdateAlataUkurSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().success("Berhasil Perbarui Alat Ukur"),
              );
              Navigator.pop(context, true);
            }
          },
          builder: (context, state) {
            if (state is UpdateAlataUkurLoading) {
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
            if (state is UpdateAlatUkurFailed) {
              return Center(
                child: Text('Error ${state.message}'),
              );
            }
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                    InfoFieldWidget(
                        text: widget
                            .detailAlatUkur.data.alatPengukuranAdmin.jenisAlat),
                    SizedBox(height: SizeConfig.calHeightMultiplier(16)),

                    widget.detailAlatUkur.data.alatPengukuranAdmin.jenisAlat ==
                            'Alat Deteksi Dini'
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Alat Deteksi Dini (opsional)',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              Column(
                                children: alatDeteksiDini.map((alat) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom:
                                            4), // Beri sedikit jarak antar item
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Checkbox(
                                          visualDensity: VisualDensity(
                                              horizontal: -4, vertical: -2),
                                          side: BorderSide(
                                              color: stroke10, width: 2),
                                          activeColor: bluePrimaryMain,
                                          checkColor: Colors.white,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: alat['isChecked'],
                                          onChanged: (value) {
                                            logger.d(
                                                'is other = ${alat['isOther'] == true && alat['isChecked'] == true}');
                                            setState(() {
                                              alat['isChecked'] = value!;
                                              // Jika "Lainnya" dicentang tetapi kemudian tidak dicentang, hapus input
                                              if (alat['isOther'] == true &&
                                                  !value) {
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
                                        if (alat['isOther'] == true &&
                                            alat['isChecked'] == true) ...[
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
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              // Check if the imageUrl is not null
                              if (widget.detailAlatUkur.data.alatPengukuranAdmin
                                      .imageUrl !=
                                  null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      8), // Give border radius
                                  child: Image.network(
                                    ApiUtils().urlGetPublicImage(widget
                                        .detailAlatUkur
                                        .data
                                        .alatPengukuranAdmin
                                        .imageUrl), // Use Image.network for URLs
                                    height: 300,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      // If there's an error loading the image, show a placeholder
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            8), // Give border radius
                                        child: Image.asset(
                                          noImagePlacholder, // Use placeholder image
                                          height: 300,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              else
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      8), // Give border radius
                                  child: Image.asset(
                                    noImagePlacholder, // Use placeholder image
                                    height: 300,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ],
                          ),
                    // Check if image_url is not

                    SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                    const Text(
                      'Merek Alat',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                    TextFieldWidget(
                      controller: _merekAlatController,
                      hintText: "Masukan Merek Alat",
                      validators: [
                        (value) =>
                            Validator.required(value, 'Merek Alat wajib diisi'),
                      ],
                      keyboardType: TextInputType.text,
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
                          return 'Kondisi Alat wajib diisi';
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
                        if (widget.detailAlatUkur.data.alatPengukuranAdmin
                                .jenisAlat ==
                            'Alat Deteksi Dini') {
                          // alat deteksi dini
                          logger.d(
                              "merek alat ${widget.detailAlatUkur.data.merekAlat}");
                          logger.d(
                              "kondisi alat ${widget.detailAlatUkur.data.kondisiAlat}");
                          logger.d(
                              "id ${widget.detailAlatUkur.data.alatPengukuranAdmin.id}");
                          List<String> selectedLabels = getSelectedLabels();
                          logger.d('selected Label $selectedLabels');
                          PostAlatUkurAlatDeteksiDiniModel
                              patchAlatUkurAlatDeteksiDini =
                              PostAlatUkurAlatDeteksiDiniModel(
                            merekAlat: _merekAlatController.text,
                            kondisiAlat: selectedKondisiAlat!,
                            alatPengukuranAdminId: widget
                                .detailAlatUkur.data.alatPengukuranAdmin.id,
                            checklistItems: selectedLabels,
                          );
                          context.read<UpdateAlatUkurBloc>().add(
                              UpdateAlatUkurDeteksiDini(
                                  patchAlatUkurAlatDeteksiDini));
                        } else {
                          logger.d(
                              "jenis alat id ${widget.detailAlatUkur.data.alatPengukuranAdmin.id}");
                          logger.d(
                              "merek alat ${widget.detailAlatUkur.data.merekAlat}");
                          logger.d(
                              "kondisi alat ${widget.detailAlatUkur.data.kondisiAlat}");
                          PostAlatUkurModel patchAlatUkurData =
                              PostAlatUkurModel(
                            jenisAlatId: widget
                                .detailAlatUkur.data.alatPengukuranAdmin.id,
                            merekAlat: _merekAlatController.text,
                            kondisiAlat: selectedKondisiAlat!,
                          );
                          context.read<UpdateAlatUkurBloc>().add(
                              UpdateAlatUkurKader(widget.detailAlatUkur.data.id,
                                  patchAlatUkurData));
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
