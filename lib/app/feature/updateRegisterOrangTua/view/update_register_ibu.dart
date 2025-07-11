import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/model/get_orangtua_detail_response.dart'
    as get_detail_orang_tua;
import 'package:puspadaya/utils/logger/logger.dart';
import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';

class UpdateRegisterIbu extends StatelessWidget {
  final get_detail_orang_tua.Ibu detailDataIbu;
  const UpdateRegisterIbu({required this.detailDataIbu, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlamatSaveCubit(),
      child: UpdateRegisterIbuView(
        detailDataIbu: detailDataIbu,
      ),
    );
  }
}

class UpdateRegisterIbuView extends StatefulWidget {
  final get_detail_orang_tua.Ibu detailDataIbu;
  const UpdateRegisterIbuView({
    required this.detailDataIbu,
    super.key,
  });

  @override
  State<UpdateRegisterIbuView> createState() => UpdateRegisterIbuViewState();
}

class UpdateRegisterIbuViewState extends State<UpdateRegisterIbuView> {
  late TextEditingController kkIbuController;
  late TextEditingController nikIbuController;
  late TextEditingController namaIbuController;
  late TextEditingController tempatLahirIbuController;
  late TextEditingController tanggalLahirIbuController;
  late TextEditingController alamatIbuController;
  late TextEditingController teleponIbuController;
  late TextEditingController rTIbuController;
  late TextEditingController rWIbuController;
  late TextEditingController tanggalKelahiranAnakSebelumnyaIbuController;
  late TextEditingController jumlahAnakIbuController;
  String? selectedKabupatenIbu;
  String? selectedKecamatanIbu;
  String? selectedDesaIbu;
  String? selectedDusunIbu;
  String? selectedJenisKBIbu;
  String? selectedGolDarahIbu;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  late List<String> selectKabupaten;

  late List<String> selectKecamatan;

  late List<String> selectDesa;

  late List<String> selectDusun;

  late List<String> selectGolDarah;
  late List<String> disabilities;
  late VoidCallback onSubmit;
  late VoidCallback navigateBack;

  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedDesa;
  String? selectedDusun;
  String? selectedGolDarah;
  String? selectedJenisKB;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilities = [];
  List<String> selectedDisabilityLabels = [];

  @override
  void initState() {
    // Inisialisasi status checkbox dengan false
    context.read<AlamatSaveCubit>().getDataWilayah();

    // insisai all data ibu
    kkIbuController.text =
        widget.detailDataIbu.kartuKeluarga.nomorKartuKeluarga;
    nikIbuController.text = widget.detailDataIbu.nik;
    namaIbuController.text = widget.detailDataIbu.nama;
    tempatLahirIbuController.text = widget.detailDataIbu.tempatLahir;
    tanggalLahirIbuController.text =
        widget.detailDataIbu.tanggalLahir.toIso8601String().split('T')[0];
    alamatIbuController.text = widget.detailDataIbu.alamat;
    teleponIbuController.text = widget.detailDataIbu.nomorTelepon ?? '';
    rTIbuController.text = widget.detailDataIbu.rt;
    rWIbuController.text = widget.detailDataIbu.rw;
    selectedKabupatenIbu = widget
        .detailDataIbu.dusun.desaKelurahan.kecamatan.kabupaten.namaKabupaten;
    selectedKecamatanIbu =
        widget.detailDataIbu.dusun.desaKelurahan.kecamatan.namaKecamatan;
    selectedDesaIbu =
        widget.detailDataIbu.dusun.desaKelurahan.namaDesaKelurahan;
    selectedDusunIbu = widget.detailDataIbu.dusun.namaDusun;
    selectedGolDarahIbu = widget.detailDataIbu.golDarah;
    disabilities = widget.detailDataIbu.jenisDisabilitas
            ?.map((e) => e.namaDisabilitas)
            .toList() ??
        [];
    selectedDisabilities =
        List<bool>.from(List.filled(disabilities.length, false));
    super.initState();
  }

  void _toggleDisability(int index) {
    setState(() {
      selectedDisabilities[index] = !selectedDisabilities[index];
      if (selectedDisabilities[index]) {
        selectedDisabilityLabels.add(disabilities[index]);
      } else {
        selectedDisabilityLabels.remove(disabilities[index]);
      }
    });
  }

  void submitTest() {
    logger.d('submit test');
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
      tanggalLahirIbuController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
  }

  Future<void> _selectDateKelahiranSebelumnua(BuildContext context) async {
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

    setState(() {
      tanggalKelahiranAnakSebelumnyaIbuController.text =
          "${pickedDate?.toLocal()}".split(' ')[0];
    });
  }

  void _removeDisability(String label) {
    setState(() {
      selectedDisabilityLabels.remove(label);
      int index = disabilities.indexOf(label);
      if (index != -1) {
        selectedDisabilities[index] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
      builder: (context, state) {
        if (state is GetAlamatSuccessState) {
          //   //ibu
          //   dataKabupatenKotaIbu.addAll(
          //       state.dataWilayahModel.provinsi.kabupatenKota);
          //   selectedKabupatenIbu =
          //       dataKabupatenKotaIbu.firstWhere((element) =>
          //           element.id ==
          //           detailData.data.ibu.dusun.desaKelurahan
          //               .kecamatan.kabupaten.id);

          //   dataKecamatanIbu
          //       .addAll(selectedKabupatenIbu!.kecamatan);
          //   selectedKecamatanIbu = dataKecamatanIbu.firstWhere(
          //       (element) =>
          //           element.id ==
          //           detailData.data.ibu.dusun.desaKelurahan
          //               .kecamatan.id);
          //   dataDesaKelurahanIbu
          //       .addAll(selectedKecamatanIbu!.desaKelurahan);
          //   selectedDesaIbu = dataDesaKelurahanIbu.firstWhere(
          //       (element) =>
          //           element.id ==
          //           detailData.data.ibu.dusun.desaKelurahan.id);
          //   dataDusunIbu.addAll(selectedDesaIbu!.dusun);
          //   selectedDusunIbu = dataDusunIbu.firstWhere(
          //       (element) =>
          //           element.id == detailData.data.ibu.dusun.id);
          // }
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
                  controller: kkIbuController,
                  hintText: 'Masukan Nomor Kartu Keluarga',
                  isPasswordField: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  validators: [
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
                  controller: nikIbuController,
                  hintText: 'Masukan NIK',
                  isPasswordField: false,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  validators: [
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
                  controller: namaIbuController,
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
                            controller: tempatLahirIbuController,
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
                            controller: tanggalLahirIbuController,
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
                    Expanded(
                      child: DropdownWidget(
                        items: selectKabupaten,
                        hint: 'Kabupaten',
                        value: selectedKabupatenIbu,
                        onChanged: (value) {
                          setState(() {
                            selectedKabupatenIbu = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownWidget(
                        items: selectKecamatan,
                        hint: 'Kecamatan',
                        value: selectedKecamatanIbu,
                        onChanged: (value) {
                          setState(() {
                            selectedKecamatanIbu = value;
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
                        value: selectedDesaIbu,
                        onChanged: (value) {
                          setState(() {
                            selectedDesaIbu = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownWidget(
                        items: selectDusun,
                        hint: 'Dusun',
                        value: selectedDusunIbu,
                        onChanged: (value) {
                          setState(() {
                            selectedDusunIbu = value;
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
                        controller: rTIbuController,
                        hintText: 'RT',
                        isPasswordField: false,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validators: [],
                      ),
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        controller: rWIbuController,
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
                  controller: alamatIbuController,
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
                  controller: teleponIbuController,
                  hintText: 'Masukan nomor telepon',
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  isPasswordField: false,
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
                            'Jenis KB',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                          DropdownWidget(
                            items: selectJenisKB,
                            hint: 'Jenis KB',
                            value: selectedJenisKB,
                            onChanged: (value) {
                              setState(() {
                                selectedJenisKB = value;
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
                            items: selectGolDarah,
                            hint: 'Golongan Darah',
                            value: selectedGolDarah,
                            onChanged: (value) {
                              setState(() {
                                selectedGolDarah = value;
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
                    _selectDateKelahiranSebelumnua(context);
                  },
                  hintText: "Tanggal Lahiran Anak Sebelumnya",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tanggal harus dipilih";
                    }
                    return null;
                  },
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Jumlah Anak',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                TextFieldWidget(
                  controller: jumlahAnakIbuController,
                  hintText: 'Jumlah Anak',
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  isPasswordField: false,
                  validators: [
                    (value) => Validator.required(value),
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
                  children: selectedDisabilityLabels.map((label) {
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
                          selectedDisabilities: selectedDisabilities,
                          onToggleDisability: _toggleDisability,
                          onAddCustomDisability: (String customDisability) {
                            setState(() {
                              disabilities.add(customDisability);
                              selectedDisabilities.add(true);
                              selectedDisabilityLabels.add(customDisability);
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
                  mainButton: onSubmit, // Panggil callback saat tombol ditekan
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                Center(
                  child: GestureDetector(
                    onTap: navigateBack,
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
            ...List.generate(disabilities.length, (index) {
              return CheckboxListWidget(
                isChecked: widget.selectedDisabilities[index],
                label: disabilities[index],
                onChanged: (bool? value) {
                  setState(() {
                    widget.onToggleDisability(index);
                  });
                },
              );
            }),

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

/**
 * 
 */
