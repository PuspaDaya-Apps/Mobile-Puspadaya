import 'package:flutter/material.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/validator/validator.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';

class UpdateRegisterAnggotaKader extends StatelessWidget {
  const UpdateRegisterAnggotaKader({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdateRegisterAnggotaKaderView();
  }
}

class UpdateRegisterAnggotaKaderView extends StatefulWidget {
  const UpdateRegisterAnggotaKaderView({super.key});

  @override
  State<UpdateRegisterAnggotaKaderView> createState() =>
      _UpdateRegisterAnggotaKaderViewState();
}

class _UpdateRegisterAnggotaKaderViewState
    extends State<UpdateRegisterAnggotaKaderView> {
  final formkey = GlobalKey<FormState>();
  final List<String> selectPosyandu = [
    'Posyandu A',
    'Posyandu B',
    'Posyandu C',
    'Posyandu D'
  ];
  final List<String> selectKabupaten = [
    'Banyuwangi',
    'Maluku',
  ];

  final List<String> selectKecamatan = [
    'Kecamatan 1',
    'Kecamatan 2',
  ];

  final List<String> selectDesa = [
    'Banyuwangi',
    'Maluku',
  ];

  final List<String> selectDusun = [
    'Kecamatan 1',
    'Kecamatan 2',
  ];

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _posisiController = TextEditingController();
  final TextEditingController _posyanduController = TextEditingController();
  final TextEditingController _rTController = TextEditingController();
  final TextEditingController _rWController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedDesa;
  String? selectedDusun;
  void _onSaveButtonPressed() {
    if (formkey.currentState!.validate()) {
      // If the form is valid, print a message or perform other actions
      print("All validations are correct!");
      // You can also save the data or navigate to another screen here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                keyboardType: TextInputType.number,
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
                'Email',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              TextFieldWidget(
                controller: _emailController,
                hintText: 'Masukan Email',
                isPasswordField: false,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                validators: [
                  (value) =>
                      Validator.required(value, "Email tidak boleh kosong"),
                ],
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              const Text(
                'Posisi',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              TextFieldWidget(
                controller: _posisiController,
                hintText: 'Masukan posisi',
                isPasswordField: false,
                keyboardType: TextInputType.text,
                obscureText: false,
                validators: [
                  (value) =>
                      Validator.required(value, "Posisi tidak boleh kosong"),
                ],
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              const Text(
                'Posyandu',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              TextFieldWidget(
                controller: _posyanduController,
                hintText: 'Masukan Posyandu',
                isPasswordField: false,
                keyboardType: TextInputType.text,
                obscureText: false,
                validators: [
                  (value) =>
                      Validator.required(value, "Posyandu tidak boleh kosong"),
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
                      value: selectedKabupaten,
                      onChanged: (value) {
                        setState(() {
                          selectedKabupaten = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: DropdownWidget(
                      items: selectKecamatan,
                      hint: 'Kecamatan',
                      value: selectedKecamatan,
                      onChanged: (value) {
                        setState(() {
                          selectedKecamatan = value;
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
                      value: selectedDesa,
                      onChanged: (value) {
                        setState(() {
                          selectedDesa = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: DropdownWidget(
                      items: selectDusun,
                      hint: 'Dusun',
                      value: selectedDusun,
                      onChanged: (value) {
                        setState(() {
                          selectedDusun = value;
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
                      controller: _rTController,
                      hintText: 'RT',
                      isPasswordField: false,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      validators: [],
                    ),
                  ),
                  Expanded(
                    child: TextFieldWidget(
                      controller: _rWController,
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
              ButtonPrimary(
                color: bluePrimaryMain,
                mainButtonMessage: 'Simpan',
                mainButton:
                    _onSaveButtonPressed, // Panggil callback saat tombol ditekan
              ),
            ],
          ),
        ),
      ),
    );
  }
}
