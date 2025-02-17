import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/paketToScreen/paket_to_update_pengasuh_model.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/outline_button_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../alamat/bloc/alamat_bloc.dart';
import '../bloc/update_pengasuh_bloc.dart';

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

import '../model/update_pengasuh_model.dart';

class UpdateRegisterPengasuh extends StatelessWidget {
  const UpdateRegisterPengasuh(
      {super.key, required this.paketToUpdatePengasuhModel});
  final PaketToUpdatePengasuhModel paketToUpdatePengasuhModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdatePengasuhBloc(),
        ),
        BlocProvider(
          create: (context) => AlamatBloc(),
        ),
      ],
      child: UpdateRegisterPengasuhView(
        paket: paketToUpdatePengasuhModel,
      ),
    );
  }
}

class UpdateRegisterPengasuhView extends StatefulWidget {
  const UpdateRegisterPengasuhView({super.key, required this.paket});
  final PaketToUpdatePengasuhModel paket;

  @override
  State<UpdateRegisterPengasuhView> createState() =>
      _UpdateRegisterPengasuhViewState();
}

class _UpdateRegisterPengasuhViewState
    extends State<UpdateRegisterPengasuhView> {
  final _formKey = GlobalKey<FormState>();

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAnak = [];
  List<String> selectedDisabilityLabelsAnak = [];

  TextEditingController _nomorKKController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _tempatLahirController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _rTWaliController = TextEditingController();
  TextEditingController _rWWaliController = TextEditingController();
  TextEditingController _teleponWaliController = TextEditingController();
  TextEditingController _alamatWaliController = TextEditingController();

  String? selectedStatusHubunganDenganAnak;
  String? selectedKabupatenDataWali;
  String? selectedKecamatanDataWali;
  String? selectedDesaDataWali;
  String? selectedDusunDataWali;
  String? selectedDusunIdDataWali;
  String? selectedGolDarahWali;

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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlamatBloc>(context).add(const ShowAllSectionEvent());
    // Inisialisasi status checkbox dengan false
    selectedDisabilitiesAnak =
        List<bool>.from(List.filled(disabilities.length, false));

    //! textcontroller
    _nomorKKController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.kartuKeluarga
            .nomorKartuKeluarga);
    _nikController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.nik);
    _namaController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.namaPengasuh);
    _tempatLahirController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.tempatLahir);
    _tanggalLahirController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.tanggalLahir);
    _rTWaliController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.rt);
    _rWWaliController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.rw);
    _teleponWaliController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.user.nomorTelepon);
    _alamatWaliController = TextEditingController(
        text: widget.paket.detailPengasuhResponseModel.data!.alamatLengkap);

    //! selected
    selectedStatusHubunganDenganAnak =
        widget.paket.detailPengasuhResponseModel.data!.statusHubungan;
    selectedKabupatenDataWali = widget.paket.detailPengasuhResponseModel.data!
        .dusun.desaKelurahan.kecamatan.kabupatenKota.namaKabupatenKota;
    selectedKecamatanDataWali = widget.paket.detailPengasuhResponseModel.data!
        .dusun.desaKelurahan.kecamatan.namaKecamatan;
    selectedDesaDataWali = widget.paket.detailPengasuhResponseModel.data!.dusun
        .desaKelurahan.namaDesaKelurahan;
    selectedDusunDataWali =
        widget.paket.detailPengasuhResponseModel.data!.dusun.namaDusun;
    selectedDusunIdDataWali =
        widget.paket.detailPengasuhResponseModel.data!.dusun.id;
    selectedGolDarahWali =
        widget.paket.detailPengasuhResponseModel.data!.golDarah;

    debugPrint('Init state');
    debugPrint(widget
        .paket.detailPengasuhResponseModel.data!.disabilitasPengasuh.length
        .toString());
    if (widget.paket.detailPengasuhResponseModel.data!.disabilitasPengasuh
        .isNotEmpty) {
      debugPrint('not empty');
      for (var value in widget
          .paket.detailPengasuhResponseModel.data!.disabilitasPengasuh) {
        debugPrint(disabilities.contains(value.namaDisabilitas).toString());
        selectedDisabilityLabelsAnak.add(value.namaDisabilitas);
        if (disabilities.contains(value.namaDisabilitas)) {
          int index = disabilities.indexOf(value.namaDisabilitas);
          debugPrint(index.toString());
          selectedDisabilitiesAnak[index] = true;
        }
      }
    }
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
    final updatePengasuhBloc = BlocProvider.of<UpdatePengasuhBloc>(context);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Perbarui Data Pengasuh',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<AlamatBloc, AlamatState>(
          listener: (context, state) {
            debugPrint(state.toString());
          },
          builder: (context, state) {
            if (state is AlamatLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: bluePrimaryMain,
              ));
            }
            if (state is ShowAllSection) {
              final List<ProvinsiModel.Datum> selectProvinsi = state.provinsi;
              final List<KabupatenModel.Datum> selectKabupaten =
                  state.kabupaten;
              final List<KecamatanModel.Datum> selectKecamatan =
                  state.kecamatan;
              final List<DesaKelurahanModel.Datum> selectDesaKelurahan =
                  state.desaKelurahan;
              final List<DusunModel.Datum> selectDusun = state.dusun;
              return Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 1.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Status Hubungan Dengan Anak',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        DropdownWidget(
                          items: selectStatusHubunganDenganAnak,
                          hint: 'Status Hubungan Dengan Anak',
                          value: selectedStatusHubunganDenganAnak,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Status Hubungan harus dipilih";
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
                          'Nomor Kartu keluarga',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(8),
                        ),
                        TextFieldWidget(
                          controller: _nikController,
                          hintText: 'Nomor Kartu keluarga',
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          isPasswordField: false,
                          validators: [
                            (value) => Validator.required(
                                value, "Nomor KK tidak boleh kosong"),
                          ],
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
                        TextFieldWidget(
                          controller: _nikController,
                          hintText: 'NIK',
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          isPasswordField: false,
                          validators: [
                            (value) => Validator.required(
                                value, "NIK tidak boleh kosong"),
                          ],
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
                        TextFieldWidget(
                          controller: _namaController,
                          hintText: 'Nama',
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          isPasswordField: false,
                          validators: [
                            (value) => Validator.required(
                                value, "Nama tidak boleh kosong"),
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
                            Expanded(
                              child: DropdownWidget(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Kabupaten harus dipilih";
                                  }
                                  return null;
                                },
                                items: selectKabupaten
                                    .map((kabupaten) =>
                                        kabupaten.namaKabupatenKota)
                                    .toSet() // Menghilangkan duplikasi
                                    .toList(),
                                hint: 'Kabupaten',
                                value: selectedKabupatenDataWali,
                                onChanged: (value) {
                                  setState(() {
                                    selectedKabupatenDataWali = value;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: DropdownWidget(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Kecamatan harus dipilih";
                                  }
                                  return null;
                                },
                                items: selectKecamatan
                                    .map((kecamatan) => kecamatan.namaKecamatan)
                                    .toList(),
                                hint: 'Kecamatan',
                                value: selectedKecamatanDataWali,
                                onChanged: (value) {
                                  setState(() {
                                    selectedKecamatanDataWali = value;
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
                                value: selectedDesaDataWali,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDesaDataWali = value;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: DropdownWidget(
                                items: selectDusun
                                    .map((dusun) => dusun.namaDusun)
                                    .toList(),
                                hint: 'Dusun',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Dusun harus dipilih";
                                  }
                                  return null;
                                },
                                value: selectedDusunDataWali,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDusunDataWali = value;
                                    selectedDusunIdDataWali = selectDusun
                                        .firstWhere(
                                            (dusun) => dusun.namaDusun == value)
                                        .id;
                                    debugPrint(selectedDusunIdDataWali);
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
                                controller: _rTWaliController,
                                hintText: 'RT',
                                isPasswordField: false,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                validators: [
                                  (value) => Validator.required(
                                      value, "RT tidak boleh kosong"),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                controller: _rWWaliController,
                                hintText: 'RW',
                                isPasswordField: false,
                                keyboardType: TextInputType.number,
                                obscureText: false,
                                validators: [
                                  (value) => Validator.required(
                                      value, "RW tidak boleh kosong"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        TextFieldWidget(
                          controller: _alamatWaliController,
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
                          controller: _teleponWaliController,
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
                        BlocConsumer<UpdatePengasuhBloc, UpdatePengasuhState>(
                          listener: (context, state) {
                            debugPrint(state.toString());
                            if (state is UpdatePengasuhSuccessState) {
                              Navigator.pop(context, 1);
                            }
                          },
                          builder: (context, state) {
                            return ButtonPrimary(
                              color: bluePrimaryMain,
                              mainButtonMessage: 'Simpan',
                              mainButton: () {
                                if (_formKey.currentState!.validate()) {
                                  updatePengasuhBloc.add(
                                    UpdatePengasuh(
                                      id: widget.paket.idPengasuh,
                                      updatePengasuhModel: UpdatePengasuhModel(
                                          statusHubungan:
                                              selectedStatusHubunganDenganAnak!,
                                          nik: _nikController.text,
                                          namaPengasuh: _namaController.text,
                                          tempatLahir:
                                              _tempatLahirController.text,
                                          tanggalLahir:
                                              _tanggalLahirController.text,
                                          rt: _rTWaliController.text,
                                          rw: _rWWaliController.text,
                                          alamatLengkap:
                                              _alamatWaliController.text,
                                          dusunId: selectedDusunIdDataWali!,
                                          noTelepon:
                                              _teleponWaliController.text,
                                          golDarah: selectedGolDarahWali!,
                                          nomorKartuKeluarga:
                                              _nomorKKController.text,
                                          disabilitasPengasuh:
                                              selectedDisabilityLabelsAnak),
                                    ),
                                  );
                                } else {
                                  logger.d('form tidak valid');
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const ErrorServerScreen();
          },
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
