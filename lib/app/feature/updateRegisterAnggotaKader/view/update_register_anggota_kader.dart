import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/validator/validator.dart';
import '../../../model/paketToScreen/paket_to_update_anggota_kader_model.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../../createRegisterAnggotaKader/model/create_anggota_kader_model.dart';
import '../bloc/update_anggota_kader_bloc.dart';
import '../model/Update_anggota_kader_model.dart';

class UpdateRegisterAnggotaKader extends StatelessWidget {
  const UpdateRegisterAnggotaKader({super.key, required this.paket});
  final PaketToUpdateAnggotaKaderModel paket;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateAnggotaKaderBloc(),
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

class _UpdateRegisterAnggotaKaderViewState extends State<UpdateRegisterAnggotaKaderView> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _namaController = TextEditingController();
  TextEditingController _nomorTeleponController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  // final TextEditingController _posisiController = TextEditingController();
  // final TextEditingController _posyanduController = TextEditingController();
  TextEditingController _rTController = TextEditingController();
  TextEditingController _rWController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  // String? selectedKabupaten;
  // String? selectedKecamatan;
  // String? selectedDesa;
  // String? selectedDusun;

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
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.paket.detailAnggotaKaderResponseModel.data!.namaLengkap);
    _nomorTeleponController = TextEditingController(text: widget.paket.detailAnggotaKaderResponseModel.data!.nomorTelepon);
    _tanggalLahirController = TextEditingController(text: widget.paket.detailAnggotaKaderResponseModel.data!.tanggalLahir);
    _rTController = TextEditingController(text: widget.paket.detailAnggotaKaderResponseModel.data!.rt);
    _rWController = TextEditingController(text: widget.paket.detailAnggotaKaderResponseModel.data!.rw);
    _alamatController = TextEditingController(text: widget.paket.detailAnggotaKaderResponseModel.data!.alamatLengkap);
  }

  @override
  Widget build(BuildContext context) {
    final updateAnggotaKaderBloc = BlocProvider.of<UpdateAnggotaKaderBloc>(context);

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
        padding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
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
                    (value) => Validator.required(
                        value, "Nama Lengkap tidak boleh kosong"),
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
                    (value) => Validator.required(
                        value, "Nomor Telepon tidak boleh kosong"),
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
                // Row(
                //   spacing: 8,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: DropdownWidget(
                //         items: selectKabupaten,
                //         hint: 'Kabupaten',
                //         value: selectedKabupaten,
                //         onChanged: (value) {
                //           setState(() {
                //             selectedKabupaten = value;
                //           });
                //         },
                //       ),
                //     ),
                //     Expanded(
                //       child: DropdownWidget(
                //         items: selectKecamatan,
                //         hint: 'Kecamatan',
                //         value: selectedKecamatan,
                //         onChanged: (value) {
                //           setState(() {
                //             selectedKecamatan = value;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                // Row(
                //   spacing: 8,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Expanded(
                //       child: DropdownWidget(
                //         items: selectDesa,
                //         hint: 'Desa',
                //         value: selectedDesa,
                //         onChanged: (value) {
                //           setState(() {
                //             selectedDesa = value;
                //           });
                //         },
                //       ),
                //     ),
                //     Expanded(
                //       child: DropdownWidget(
                //         items: selectDusun,
                //         hint: 'Dusun',
                //         value: selectedDusun,
                //         onChanged: (value) {
                //           setState(() {
                //             selectedDusun = value;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: SizeConfig.calHeightMultiplier(8)),
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
                    (value) =>
                        Validator.required(value, "Alamat tidak boleh kosong"),
                  ],
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                BlocConsumer<UpdateAnggotaKaderBloc, UpdateAnggotaKaderState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                    if(state is UpdateAnggotaKaderSuccessState) {
                      Navigator.pop(context,1);
                    }
                  },
                  builder: (context, state) {
                    return ButtonPrimary(
                      color: bluePrimaryMain,
                      mainButtonMessage: 'Simpan',
                      mainButton: () {
                        if (formkey.currentState!.validate()) {
                          updateAnggotaKaderBloc.add(UpdateAnggotaKader(
                            anggotaKaderId: widget.paket.anggotaKaderId,
                            updateAnggotaKaderModel: UpdateAnggotaKaderModel(
                              namaLengkap: _namaController.text, 
                              nomorTelepon: _nomorTeleponController.text, 
                              tanggalLahir: _tanggalLahirController.text, 
                              rt: _rTController.text, 
                              rw: _rWController.text, 
                              alamatLengkap: _alamatController.text
                            )
                          ));
                        }
                      }, // Panggil callback saat tombol ditekan
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
