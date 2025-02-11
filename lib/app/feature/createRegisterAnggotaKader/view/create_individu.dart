import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

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

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/validator/validator.dart';
import '../../../model/current_user_model.dart';
import '../../../view/widget/date_time_picker_widget.dart';
import '../../../view/widget/dropdown_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../../view/widget/textField_widget.dart';
import '../bloc/createAnggotaKaderBloc/create_anggota_kader_bloc.dart';
import '../model/create_anggota_kader_model.dart';

class CreateIndividu extends StatefulWidget {
  const CreateIndividu({
    super.key,
    required this.selectProvinsi,
    required this.selectKabupaten,
    required this.selectKecamatan,
    required this.selectDesaKelurahan,
    required this.selectDusun,
    required this.currentUserModel
  });

  final List<ProvinsiModel.Datum> selectProvinsi;
  final List<KabupatenModel.Datum> selectKabupaten;
  final List<KecamatanModel.Datum> selectKecamatan;
  final List<DesaKelurahanModel.Datum> selectDesaKelurahan;
  final List<DusunModel.Datum> selectDusun;
  
  final CurrentUserModel currentUserModel;

  @override
  State<CreateIndividu> createState() => _CreateIndividuState();
}

class _CreateIndividuState extends State<CreateIndividu> {
  final formkey = GlobalKey<FormState>();

  TextEditingController _namaController = TextEditingController();
  TextEditingController _nomorTeleponController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _rTController = TextEditingController();
  TextEditingController _rWController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedDesa;
  String? selectedDusunId;
  String? selectedDusun;

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
              Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownWidget(
                      items: widget.selectKabupaten
                          .map((kabupaten) => kabupaten.namaKabupatenKota)
                          .toSet() // Menghilangkan duplikasi
                          .toList(),
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
                      items: widget.selectKecamatan
                          .map((kecamatan) => kecamatan.namaKecamatan)
                          .toSet() // Menghilangkan duplikasi
                          .toList(),
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
                      items: widget.selectDesaKelurahan
                          .map((desaKelurahan) => desaKelurahan.namaDesaKelurahan)
                          .toSet() // Menghilangkan duplikasi
                          .toList(),
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
                      items: widget.selectDusun
                          .map((dusun) => dusun.namaDusun)
                          .toSet() // Menghilangkan duplikasi
                          .toList(),
                      hint: 'Dusun',
                      value: selectedDusun,
                      onChanged: (value) {
                        setState(() {
                          selectedDusun = value;
                          selectedDusunId= widget.selectDusun.firstWhere((dusun) => dusun.namaDusun == value).id;
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
              BlocConsumer<CreateAnggotaKaderBloc, CreateAnggotaKaderState>(
                listener: (context, state) {
                  debugPrint(state.toString());
                  if(state is CreateAnggotaKaderSuccessState) {
                    Navigator.pop(context,1);
                  }
                },
                builder: (context, state) {
                  return ButtonPrimary(
                    color: bluePrimaryMain,
                    mainButtonMessage: 'Simpan',
                    mainButton: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<CreateAnggotaKaderBloc>(context).add(CreateAnggotaKader(
                          CreateAnggotaKaderModel(
                            namaLengkap: _namaController.text, 
                            nomorTelepon: _nomorTeleponController.text, 
                            tanggalLahir: _tanggalLahirController.text, 
                            rt: _rTController.text, 
                            rw: _rWController.text, 
                            alamatLengkap: _alamatController.text, 
                            dusunId: selectedDusunId!, 
                            posyanduId: widget.currentUserModel.posyandu.id
                          )
                        ));
                      } 
                    } // Panggil callback saat tombol ditekan
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
