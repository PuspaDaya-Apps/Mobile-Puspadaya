import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:puspadaya/app/feature/gantiProfile/bloc/ganti_profile_bloc.dart';

import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/validator/validator.dart';
import '../../../../utils/logger/logger.dart';
import '../../../model/data_wilayah_model.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import '../model/patch_ganti_profile.dart';

class GantiProfile extends StatelessWidget {
  final String userId;
  const GantiProfile({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GantiProfileBloc(),
        ),
        BlocProvider(
          create: (context) => AlamatSaveCubit(),
        ),
      ],
      child: GantiProfileView(
        userId: userId,
      ),
    );
  }
}

class GantiProfileView extends StatefulWidget {
  final String userId;
  const GantiProfileView({super.key, required this.userId});

  @override
  State<GantiProfileView> createState() => _GantiProfileViewState();
}

class _GantiProfileViewState extends State<GantiProfileView> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _rtController;
  late TextEditingController _rwController;
  //? alamat selected
  List<DataKabupatenKota> dataKabupatenKota = [];
  List<DataKecamatan> dataKecamatan = [];
  List<DataDesaKelurahan> dataDesaKelurahan = [];
  List<DataDusun> dataDusun = [];
  DataKabupatenKota? selectedKabupaten;
  DataKecamatan? selectedKecamatan;
  DataDesaKelurahan? selectedDesa;
  DataDusun? selectedDusun;
  String? selectedDusunId;
  final _formKey = GlobalKey<FormState>();
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _rtController = TextEditingController();
    _rwController = TextEditingController();
    // _nameController.text = widget.currentUserModel.namaLengkap;
    // _phoneController.text = widget.currentUserModel.nomorTelepon;
    logger.d('trigger initState');
    context.read<AlamatSaveCubit>().getDataWilayah();
    context.read<GantiProfileBloc>().add(GetDetailUser(widget.userId));
    logger.d('trigger get detail user');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _rtController.dispose();
    _rwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        onBackPressed: () => Navigator.pop(context),
        title: "Ubah Profil",
      ),
      body: SafeArea(
          child: BlocConsumer<GantiProfileBloc, GantiProfileState>(
        listener: (context, stateGantiProfile) {
          if (stateGantiProfile is GantiProfileFailed) {
            showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().error(stateGantiProfile.message));
            context.read<AlamatSaveCubit>().getDataWilayah();
            context.read<GantiProfileBloc>().add(GetDetailUser(widget.userId));
          }
          if (stateGantiProfile is GantiProfileSuccess) {
            // BlocProvider.of<UserBloc>(context).add(GetCurrentUser());
            showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().success("Berhasil mengubah profil"));
            Navigator.pop(context);
          }
          if (stateGantiProfile is GantiProfileFormSuccess) {
            _nameController.text = stateGantiProfile.data.data.namaLengkap;
            _phoneController.text = stateGantiProfile.data.data.nomorTelepon;
            _rtController.text = stateGantiProfile.data.data.rt;
            _rwController.text = stateGantiProfile.data.data.rw;
          }
        },
        builder: (context, stateGantiProfile) {
          if (stateGantiProfile is GantiProfileLoading) {
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
          if (stateGantiProfile is GantiProfileFormLoading) {
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

          if (stateGantiProfile is GantiProfileFormSuccess) {
            logger.d('trigger get detail user success');
            return BlocBuilder<AlamatSaveCubit, AlamatSaveState>(
              builder: (context, state) {
                if (state is GetAlamatSuccessState) {
                  if (dataKabupatenKota.isEmpty) {
                    dataKabupatenKota
                        .addAll(state.dataWilayahModel.provinsi.kabupatenKota);
                    selectedKabupaten = dataKabupatenKota.firstWhere(
                        (element) =>
                            element.id ==
                            stateGantiProfile.data.data.dusun.desaKelurahan
                                .kecamatan.kabupatenKota.id);

                    dataKecamatan.addAll(selectedKabupaten!.kecamatan);
                    selectedKecamatan = dataKecamatan.firstWhere((element) =>
                        element.id ==
                        stateGantiProfile
                            .data.data.dusun.desaKelurahan.kecamatan.id);
                    dataDesaKelurahan.addAll(selectedKecamatan!.desaKelurahan);
                    selectedDesa = dataDesaKelurahan.firstWhere((element) =>
                        element.id ==
                        stateGantiProfile.data.data.dusun.desaKelurahan.id);
                    dataDusun.addAll(selectedDesa!.dusun);
                    selectedDusun = dataDusun.firstWhere((element) =>
                        element.id == stateGantiProfile.data.data.dusun.id);
                    selectedDusunId = selectedDusun!.id;
                  }
                  logger.d("success get profil");
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProfilePicture(
                              onImageSelected: (path) {
                                setState(() {
                                  _imagePath = path;
                                });
                              },
                            ),

                            // nama lenkap
                            Text(
                              'Nama Lengkap',
                              style: AppTextStyles.primaryTextMedium.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            TextFieldWidget(
                              controller: _nameController,
                              hintText: "Masukan Nama Lengkap anda",
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              isPasswordField: false,
                              // validator: (value) => ProfileValidator.validateName(value!),
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),

                            //no telp
                            Text(
                              'Nomor Telepon',
                              style: AppTextStyles.primaryTextMedium.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                            TextFieldWidget(
                              controller: _phoneController,
                              hintText: "Masukan nomor telepon anda",
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              isPasswordField: false,
                              // validator: (value) =>
                              //     ProfileValidator.validatePhone(value!),
                            ),
                            SizedBox(
                              height: SizeConfig.calHeightMultiplier(16),
                            ),

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
                                    ignoring: dataKabupatenKota.isNotEmpty
                                        ? false
                                        : true,
                                    child: DropdownButtonFormField2<
                                        DataKabupatenKota>(
                                      isExpanded: true,
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                      value: selectedKabupaten, // Ini bisa null
                                      hint: Text(
                                        "Kabupaten",
                                        style: AppTextStyles
                                            .secoundaryTextNormal
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      buttonStyleData: const ButtonStyleData(
                                        elevation: 0,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          color: backgroundWhite10,
                                        ),
                                        elevation: 0,
                                      ),
                                      items: dataKabupatenKota.map((item) {
                                        return DropdownMenuItem<
                                            DataKabupatenKota>(
                                          value: item,
                                          child: Text(item.namaKabupatenKota),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedKabupaten = value;
                                          dataKecamatan.clear();
                                          dataKecamatan
                                              .addAll(value!.kecamatan);
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              width: 1, color: redPrimaryMain),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IgnorePointer(
                                    ignoring:
                                        dataKecamatan.isNotEmpty ? false : true,
                                    child:
                                        DropdownButtonFormField2<DataKecamatan>(
                                      isExpanded: true,
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                      value: selectedKecamatan, // Ini bisa null
                                      hint: Text(
                                        "Kecamatan",
                                        style: AppTextStyles
                                            .secoundaryTextNormal
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      buttonStyleData: const ButtonStyleData(
                                        elevation: 0,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                    ignoring: dataDesaKelurahan.isNotEmpty
                                        ? false
                                        : true,
                                    child: DropdownButtonFormField2<
                                        DataDesaKelurahan>(
                                      isExpanded: true,
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                      value: selectedDesa, // Ini bisa null
                                      hint: Text(
                                        "Desa",
                                        style: AppTextStyles
                                            .secoundaryTextNormal
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      buttonStyleData: const ButtonStyleData(
                                        elevation: 0,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          color: backgroundWhite10,
                                        ),
                                        elevation: 0,
                                      ),
                                      items: dataDesaKelurahan.map((item) {
                                        return DropdownMenuItem<
                                            DataDesaKelurahan>(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              width: 1, color: redPrimaryMain),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IgnorePointer(
                                    ignoring:
                                        dataDusun.isNotEmpty ? false : true,
                                    child: DropdownButtonFormField2<DataDusun>(
                                      isExpanded: true,
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                      value: selectedDusun, // Ini bisa null
                                      hint: Text(
                                        "Dusun",
                                        style: AppTextStyles
                                            .secoundaryTextNormal
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      buttonStyleData: const ButtonStyleData(
                                        elevation: 0,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                    controller: _rtController,
                                    hintText: 'RT',
                                    isPasswordField: false,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    obscureText: false,
                                    validators: [
                                      (value)=> Validator.minLength(value, 2, "RT Minimal 2 Karakter"),
                                      (value) => Validator.required(value),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TextFieldWidget(
                                    controller: _rwController,
                                    hintText: 'RW',
                                    maxLength: 3,
                                    isPasswordField: false,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                    validators: [
                                      (value)=> Validator.minLength(value, 2, "RT Minimal 2 Karakter"),
                                      (value) => Validator.required(value),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: SizeConfig.calHeightMultiplier(32)),
                            ButtonPrimary(
                              color: bluePrimary40,
                              mainButtonMessage: "Simpan",
                              mainButton: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  PatchGantiProfileModel data =
                                      PatchGantiProfileModel(
                                    dusunId: selectedDusunId!,
                                    namaLengkap: _nameController.text,
                                    nomorTelepon: _phoneController.text,
                                    rt: _rtController.text,
                                    rw: _rwController.text,
                                  );
                                  context
                                      .read<GantiProfileBloc>()
                                      .add(PatchGantiProfile(data));
                                  print('nama lengkap ${_nameController.text}');
                                  print(
                                      'nomor telepon ${_phoneController.text}');
                                  print("dusun id ${selectedDusunId}");
                                  print('image path: $_imagePath');
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container(
                  child: Center(
                    child: Text("Tidak ada data"),
                  ),
                );
              },
            );
          }
          return Container();
        },
      )),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  final Function(String) onImageSelected;

  const ProfilePicture({
    super.key,
    required this.onImageSelected,
  });

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _image = pickedFile;
      if (_image != null) {
        widget.onImageSelected(_image!.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.calHeightMultiplier(24),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: _image == null
                  ? Image.asset(userImageDefault)
                  : ClipOval(
                      child: Image.file(
                        File(_image!.path),
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      barrierColor: Colors.black.withValues(alpha: 0.5),
                      context: context,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Icon(
                                  FluentIcons.camera_24_regular,
                                  color: Colors.black,
                                ),
                                title: Text('Camera'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.camera);
                                },
                              ),
                              ListTile(
                                leading: Icon(
                                  FluentIcons.image_24_regular,
                                  color: Colors.black,
                                ),
                                title: Text('Gallery'),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.gallery);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(
                    FluentIcons.camera_20_regular,
                    color: bluePrimary30,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
