import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/model/get_orangtua_detail_response.dart'
    as get_detail_orang_tua;
// GetOrangtuaDetailResponseModel get getOrangTuaDetailResponse

import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/outline_button_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/validator/validator.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/textField_widget.dart';

class UpdateRegisterAyah extends StatelessWidget {
  final get_detail_orang_tua.Ayah detailDataAyah;

  const UpdateRegisterAyah({required this.detailDataAyah, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlamatSaveCubit(),
      child: UpdateRegisterAyahView(
        detailDataAyah: detailDataAyah,
      ),
    );
  }
}

class UpdateRegisterAyahView extends StatefulWidget {
  final get_detail_orang_tua.Ayah detailDataAyah;
  const UpdateRegisterAyahView({
    required this.detailDataAyah,
    super.key,
  });

  @override
  State<UpdateRegisterAyahView> createState() => UpdateRegisterAyahViewState();
}

class UpdateRegisterAyahViewState extends State<UpdateRegisterAyahView> {
  late TextEditingController kkAyahController;
  late TextEditingController nikAyahController;
  late TextEditingController namaAyahController;
  late TextEditingController tempatLahirAyahController;
  late TextEditingController tanggalLahirAyahController;
  late TextEditingController alamatAyahController;
  late TextEditingController teleponAyahController;
  late TextEditingController rTAyahController;
  late TextEditingController rWAyahController;
  String? selectedKabupatenAyah;
  String? selectedKecamatanAyah;
  String? selectedDesaAyah;
  String? selectedDusunAyah;
  String? selectedGolDarahAyah;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  late List<String> selectKabupaten;

  late List<String> selectKecamatan;

  late List<String> selectDesa;

  late List<String> selectDusun;

  late List<String> selectGolDarah;
  late List<String> disabilities;
  // late VoidCallback onNext;
  @override
  void initState() {
    context.read<AlamatSaveCubit>().getDataWilayah();
    // Inisialisasi status checkbox dengan false

    // insisai all data ayah
    kkAyahController.text =
        widget.detailDataAyah.kartuKeluarga.nomorKartuKeluarga;
    nikAyahController.text = widget.detailDataAyah.nik;
    namaAyahController.text = widget.detailDataAyah.namaAyah;
    tempatLahirAyahController.text = widget.detailDataAyah.tempatLahir;
    tanggalLahirAyahController.text =
        widget.detailDataAyah.tanggalLahir.toString().split(' ')[0];
    alamatAyahController.text = widget.detailDataAyah.alamat;
    teleponAyahController.text = widget.detailDataAyah.nomorTelepon ?? '';
    rTAyahController.text = widget.detailDataAyah.rt;
    rWAyahController.text = widget.detailDataAyah.rw;
    selectedKabupatenAyah = widget
        .detailDataAyah.dusun.desaKelurahan.kecamatan.kabupaten.namaKabupaten;
    selectedKecamatanAyah =
        widget.detailDataAyah.dusun.desaKelurahan.kecamatan.namaKecamatan;
    selectedDesaAyah =
        widget.detailDataAyah.dusun.desaKelurahan.namaDesaKelurahan;
    selectedDusunAyah = widget.detailDataAyah.dusun.namaDusun;
    selectedGolDarahAyah = widget.detailDataAyah.golDarah;
    disabilities = widget.detailDataAyah.jenisDisabilitas
            ?.map((e) => e.namaDisabilitas)
            .toList() ??
        [];

    selectedDisabilitiesAyah =
        List<bool>.from(List.filled(disabilities.length, false));
    super.initState();
  }

  void _toggleDisability(int index) {
    setState(() {
      selectedDisabilitiesAyah[index] =
          !selectedDisabilitiesAyah[index];
      if (selectedDisabilitiesAyah[index]) {
        selectedDisabilityLabelsAyah.add(disabilities[index]);
      } else {
        selectedDisabilityLabelsAyah.remove(disabilities[index]);
      }
    });
  }
  void submitTest() {
    logger.d('submit test');
  }

  void _removeDisability(String label) {
    setState(() {
      selectedDisabilityLabelsAyah.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilitiesAyah[index] = false;
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
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

    setState(() {
      tanggalLahirAyahController.text =
          "${pickedDate?.toLocal()}".split(' ')[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
      builder: (context, state) {
        if (state is GetAlamatSuccessState) {
          // if (dataKabupatenKotaAyah.isEmpty ||
          //     dataKabupatenKotaIbu.isEmpty) {
          //   //ayah
          //   dataKabupatenKotaAyah.addAll(
          //       state.dataWilayahModel.provinsi.kabupatenKota);
          //   selectedKabupatenAyah =
          //       dataKabupatenKotaAyah.firstWhere((element) =>
          //           element.id ==
          //           detailData.data.ayah.dusun.desaKelurahan
          //               .kecamatan.kabupaten.id);

          //   dataKecamatanAyah
          //       .addAll(selectedKabupatenAyah!.kecamatan);
          //   selectedKecamatanAyah =
          //       dataKecamatanAyah.firstWhere((element) =>
          //           element.id ==
          //           detailData.data.ayah.dusun.desaKelurahan
          //               .kecamatan.id);
          //   dataDesaKelurahanAyah
          //       .addAll(selectedKecamatanAyah!.desaKelurahan);
          //   selectedDesaAyah = dataDesaKelurahanAyah.firstWhere(
          //       (element) =>
          //           element.id ==
          //           detailData
          //               .data.ayah.dusun.desaKelurahan.id);
          //   dataDusunAyah.addAll(selectedDesaAyah!.dusun);
          //   selectedDusunAyah = dataDusunAyah.firstWhere(
          //       (element) =>
          //           element.id ==
          //           detailData.data.ayah.dusun.id);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Nomor Kartu Keluarga',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: kkAyahController,
                  hintText: 'Masukan Nomor Kartu Keluarga',
                  isPasswordField: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  validators: [
                    (value) => Validator.consistOf(value, 16,
                        "Kartu keluarga harus terdiri atas 16 digit"),
                    (value) => Validator.required(value),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'NIK',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: nikAyahController,
                  hintText: 'Masukan NIK',
                  isPasswordField: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  validators: [
                    (value) => Validator.consistOf(
                        value, 16, "Nik harus terdiri atas 16 digit"),
                    (value) => Validator.required(value),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Nama',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: namaAyahController,
                  hintText: 'Masukan Nama',
                  isPasswordField: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  validators: [
                    (value) => Validator.required(value),
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
                          TextFieldWidget(
                            controller: tempatLahirAyahController,
                            hintText: 'Tempat Lahir',
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            isPasswordField: false,
                            validators: [
                              (value) => Validator.required(value),
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
                            controller: tanggalLahirAyahController,
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
                Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownWidget(
                        items: selectKabupaten,
                        hint: 'Kabupaten',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kabupaten harus dipilih";
                          }
                          return null;
                        },
                        value: selectedKabupatenAyah,
                        onChanged: (value) {
                          setState(() {
                            selectedKabupatenAyah = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownWidget(
                        items: selectKecamatan,
                        hint: 'Kecamatan',
                        value: selectedKecamatanAyah,
                        onChanged: (value) {
                          setState(() {
                            selectedKecamatanAyah = value;
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
                    Expanded(
                      child: DropdownWidget(
                        items: selectDesa,
                        hint: 'Desa',
                        value: selectedDesaAyah,
                        onChanged: (value) {
                          setState(() {
                            selectedDesaAyah = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownWidget(
                        items: selectDusun,
                        hint: 'Dusun',
                        value: selectedDusunAyah,
                        onChanged: (value) {
                          setState(() {
                            selectedDusunAyah = value;
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
                    Expanded(
                      child: TextFieldWidget(
                        controller: rTAyahController,
                        hintText: 'RT',
                        isPasswordField: false,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validators: [],
                      ),
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        controller: rWAyahController,
                        hintText: 'RW',
                        isPasswordField: false,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validators: [],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: alamatAyahController,
                  hintText: 'Masukan alamat lengkap',
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  isPasswordField: false,
                  validators: [
                    (value) => Validator.required(value),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Nomor Telepon (WA aktif)',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: teleponAyahController,
                  hintText: 'Masukan nomor telepon',
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  isPasswordField: false,
                  validators: [
                    (value) => Validator.required(value),
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
                          selectedDisabilities: selectedDisabilitiesAyah,
                          onToggleDisability: _toggleDisability,
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
                  mainButton: (){
                    logger.d('next page');
                  }, // Panggil callback saat tombol ditekan
                ),
              ],
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
