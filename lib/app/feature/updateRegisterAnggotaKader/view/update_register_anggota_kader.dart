import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../config/validator/validator.dart';
import '../../../model/data_wilayah_model.dart';
import '../../../model/paketToScreen/paket_to_update_anggota_kader_model.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import '../bloc/update_anggota_kader_bloc.dart';
import '../model/Update_anggota_kader_model.dart';

class UpdateRegisterAnggotaKader extends StatelessWidget {
  const UpdateRegisterAnggotaKader({super.key, required this.paket});
  final PaketToUpdateAnggotaKaderModel paket;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateAnggotaKaderBloc(),
        ),
        BlocProvider(
          create: (context) => AlamatSaveCubit(),
        ),
      ],
      child: UpdateRegisterAnggotaKaderView(paket: paket),
    );
  }
}

class UpdateRegisterAnggotaKaderView extends StatefulWidget {
  const UpdateRegisterAnggotaKaderView({super.key, required this.paket});

  final PaketToUpdateAnggotaKaderModel paket;

  @override
  State<UpdateRegisterAnggotaKaderView> createState() =>
      _UpdateRegisterAnggotaKaderViewState();
}

class _UpdateRegisterAnggotaKaderViewState
    extends State<UpdateRegisterAnggotaKaderView> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _namaController = TextEditingController();
  TextEditingController _nomorTeleponController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _rTController = TextEditingController();
  TextEditingController _rWController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  List<DataKabupatenKota> dataKabupatenKota = [];
  List<DataKecamatan> dataKecamatan = [];
  List<DataDesaKelurahan> dataDesaKelurahan = [];
  List<DataDusun> dataDusun = [];

  DataKabupatenKota? selectedKabupaten;
  DataKecamatan? selectedKecamatan;
  DataDesaKelurahan? selectedDesa;
  DataDusun? selectedDusun;

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

    setState(() {
      _tanggalLahirController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
  }

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(
        text: widget.paket.detailAnggotaKaderResponseModel.data!.namaLengkap);
    _nomorTeleponController = TextEditingController(
        text: widget.paket.detailAnggotaKaderResponseModel.data!.nomorTelepon);
    _tanggalLahirController = TextEditingController(
        text: widget.paket.detailAnggotaKaderResponseModel.data!.tanggalLahir);
    _rTController = TextEditingController(
        text: widget.paket.detailAnggotaKaderResponseModel.data!.rt);
    _rWController = TextEditingController(
        text: widget.paket.detailAnggotaKaderResponseModel.data!.rw);
    _alamatController = TextEditingController(
        text: widget.paket.detailAnggotaKaderResponseModel.data!.alamatLengkap);

    BlocProvider.of<AlamatSaveCubit>(context).getDataWilayah();
  }

  @override
  Widget build(BuildContext context) {
    final updateAnggotaKaderBloc =
        BlocProvider.of<UpdateAnggotaKaderBloc>(context);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Perbarui Anggota Kader',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: Container(
        margin: EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: BlocConsumer<AlamatSaveCubit, AlamatSaveState>(
              listener: (context, state) {
                debugPrint(state.toString());
              },
              builder: (context, state) {
                if (state is GetAlamatProccessState) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: Center(
                      child: SpinKitThreeBounce(
                        color: bluePrimaryMain,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                if (state is GetAlamatSuccessState) {
                  debugPrint('build');
                  if (dataKabupatenKota.isEmpty) {
                    dataKabupatenKota
                        .addAll(state.dataWilayahModel.provinsi.kabupatenKota);
                    selectedKabupaten = dataKabupatenKota.firstWhere(
                        (element) =>
                            element.id ==
                            widget
                                .paket
                                .detailAnggotaKaderResponseModel
                                .data!
                                .dusun
                                .desaKelurahan
                                .kecamatan
                                .kabupatenKota
                                .id);

                    dataKecamatan.addAll(selectedKabupaten!.kecamatan);
                    selectedKecamatan = dataKecamatan.firstWhere((element) =>
                        element.id ==
                        widget.paket.detailAnggotaKaderResponseModel.data!.dusun
                            .desaKelurahan.kecamatan.id);
                    dataDesaKelurahan.addAll(selectedKecamatan!.desaKelurahan);
                    selectedDesa = dataDesaKelurahan.firstWhere((element) =>
                        element.id ==
                        widget.paket.detailAnggotaKaderResponseModel.data!.dusun
                            .desaKelurahan.id);
                    dataDusun.addAll(selectedDesa!.dusun);
                    selectedDusun = dataDusun.firstWhere((element) =>
                        element.id ==
                        widget.paket.detailAnggotaKaderResponseModel.data!.dusun
                            .id);
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama Lengkap',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      TextFieldWidget(
                        controller: _namaController,
                        hintText: 'Masukan Nama Lengkap',
                        isPasswordField: false,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        validators: [
                          (value) => Validator.required(value),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text(
                        'Nomor Telepon',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      TextFieldWidget(
                        controller: _nomorTeleponController,
                        hintText: 'Masukan Nomor Telepon',
                        isPasswordField: false,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
                        validators: [
                          (value) => Validator.minLength(
                              value, 10, "Masukkan nomor yang benar!"),
                          (value) => Validator.maxLength(
                              value, 13, "Masukkan nomor yang benar!"),
                          (value) => Validator.required(value),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text(
                        'Tanggal Lahir',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
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
                                  dataKabupatenKota.isNotEmpty ? false : true,
                              child:
                                  DropdownButtonFormField2<DataKabupatenKota>(
                                isExpanded: true,
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                                value: selectedKabupaten, // Ini bisa null
                                hint: Text(
                                  "Kabupaten",
                                  style: AppTextStyles.secoundaryTextNormal
                                      .copyWith(
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
                                items: dataKabupatenKota.map((item) {
                                  return DropdownMenuItem<DataKabupatenKota>(
                                    value: item,
                                    child: Text(item.namaKabupatenKota),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedKabupaten = value;
                                    dataKecamatan.clear();
                                    dataKecamatan.addAll(value!.kecamatan);
                                    //clear list
                                    dataDesaKelurahan.clear();
                                    dataDusun.clear();

                                    //clear data
                                    selectedKecamatan = null;
                                    selectedDesa = null;
                                    selectedDusun = null;
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
                              ignoring: dataKecamatan.isNotEmpty ? false : true,
                              child: DropdownButtonFormField2<DataKecamatan>(
                                isExpanded: true,
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                                value: selectedKecamatan, // Ini bisa null
                                hint: Text(
                                  "Kecamatan",
                                  style: AppTextStyles.secoundaryTextNormal
                                      .copyWith(
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
                                items: dataKecamatan.map((item) {
                                  return DropdownMenuItem<DataKecamatan>(
                                    value: item,
                                    child: Text(item.namaKecamatan),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedKecamatan = value;
                                    dataDesaKelurahan.clear();
                                    dataDesaKelurahan
                                        .addAll(value!.desaKelurahan);

                                    //clear list
                                    dataDusun.clear();

                                    //clear data
                                    selectedDesa = null;
                                    selectedDusun = null;
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
                                  dataDesaKelurahan.isNotEmpty ? false : true,
                              child:
                                  DropdownButtonFormField2<DataDesaKelurahan>(
                                isExpanded: true,
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                                value: selectedDesa, // Ini bisa null
                                hint: Text(
                                  "Desa",
                                  style: AppTextStyles.secoundaryTextNormal
                                      .copyWith(
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
                                items: dataDesaKelurahan.map((item) {
                                  return DropdownMenuItem<DataDesaKelurahan>(
                                    value: item,
                                    child: Text(item.namaDesaKelurahan),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedDesa = value;
                                    dataDusun.clear();
                                    dataDusun.addAll(value!.dusun);

                                    //clear data
                                    selectedDusun = null;
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
                              ignoring: dataDusun.isNotEmpty ? false : true,
                              child: DropdownButtonFormField2<DataDusun>(
                                isExpanded: true,
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                                value: selectedDusun, // Ini bisa null
                                hint: Text(
                                  "Dusun",
                                  style: AppTextStyles.secoundaryTextNormal
                                      .copyWith(
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
                                items: dataDusun.map((item) {
                                  return DropdownMenuItem<DataDusun>(
                                    value: item,
                                    child: Text(item.namaDusun),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedDusun = value;
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
                            child: TextFieldWidget(
                              controller: _rTController,
                              hintText: 'RT',
                              isPasswordField: false,
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              validators: [],
                            ),
                          ),
                          Expanded(
                            child: TextFieldWidget(
                              controller: _rWController,
                              hintText: 'RW',
                              isPasswordField: false,
                              keyboardType: TextInputType.number,
                              obscureText: false,
                              validators: [],
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
                          (value) => Validator.required(value),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      BlocConsumer<UpdateAnggotaKaderBloc,
                          UpdateAnggotaKaderState>(
                        listener: (context, state) {
                          debugPrint(state.toString());
                          if (state is UpdateAnggotaKaderSuccessState) {
                            Navigator.pop(context, 1);
                          }
                        },
                        builder: (context, state) {
                          return ButtonPrimary(
                            color: bluePrimaryMain,
                            mainButtonMessage: 'Simpan',
                            mainButton: () {
                              if (formkey.currentState!.validate()) {
                                debugPrint(widget.paket.anggotaKaderId);
                                debugPrint(selectedDusun!.id);
                                updateAnggotaKaderBloc.add(UpdateAnggotaKader(
                                    anggotaKaderId: widget.paket.anggotaKaderId,
                                    updateAnggotaKaderModel:
                                        UpdateAnggotaKaderModel(
                                            namaLengkap: _namaController.text,
                                            nomorTelepon:
                                                _nomorTeleponController.text,
                                            tanggalLahir:
                                                _tanggalLahirController.text,
                                            rt: _rTController.text,
                                            rw: _rWController.text,
                                            alamatLengkap:
                                                _alamatController.text,
                                            dusunId: selectedDusun!.id)));
                              }
                            }, // Panggil callback saat tombol ditekan
                          );
                        },
                      ),
                    ],
                  );
                }
                return const ErrorServerScreen();
              },
            ),
          ),
        ),
      ),
    );
  }
}
