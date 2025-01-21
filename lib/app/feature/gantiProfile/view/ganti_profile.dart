import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class GantiProfile extends StatelessWidget {
  const GantiProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const GantiProfileView();
  }
}

class GantiProfileView extends StatefulWidget {
  const GantiProfileView({super.key});

  @override
  State<GantiProfileView> createState() => _GantiProfileViewState();
}

class _GantiProfileViewState extends State<GantiProfileView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<_AddressFormFieldState>();
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        onBackPressed: () => Navigator.pop(context),
        title: "Ubah Profile",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
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

                  // email
                  Text(
                    'Email',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _emailController,
                    hintText: "Masukan email anda",
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    isPasswordField: false,
                    // validator: (value) =>
                    //     ProfileValidator.validateEmail(value!),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(16),
                  ),

                  // alamat
                  Text(
                    'Alamat',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  AddressFormField(key: _addressFormKey),
                  SizedBox(height: SizeConfig.calHeightMultiplier(32)),
                  ButtonPrimary(
                    color: bluePrimary40,
                    mainButtonMessage: "Simpan",
                    mainButton: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        print('nama lengkap ${_nameController.text}');
                        print('nomor telepon ${_phoneController.text}');
                        print('email ${_emailController.text}');
                        final address =
                            _addressFormKey.currentState?.getAddress();
                        print('alamat: $address');
                        print('image path: $_imagePath');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddressFormField extends StatefulWidget {
  AddressFormField({
    super.key,
  });

  @override
  State<AddressFormField> createState() => _AddressFormFieldState();
}

class _AddressFormFieldState extends State<AddressFormField> {
  // Variabel untuk menyimpan nilai dropdown
  String? selectedKota;
  String? selectedKecamatan;
  String? selectedDesa;
  String? selectedDusun;
  TextEditingController _rtController = TextEditingController();
  TextEditingController _rwController = TextEditingController();
  // Dummy data untuk dropdown
  final List<String> kota = ['Banyuwangi', 'Maluku Tengah'];
  final List<String> kecematan = ['Rogojampi', 'Banyuwangi', 'Genteng'];
  final List<String> desa = ['Labanasem', 'Setail', 'Ketapang'];
  final List<String> dusun = ['Krajan', 'Lugonto', 'Srampon'];
  final List<String> rtOptions = ['001', '002', '003'];
  final List<String> rwOptions = ['01', '02', '03'];

  String getAddress() {
    return 'Kota: $selectedKota, Kecamatan: $selectedKecamatan, Desa: $selectedDesa, Dusun: $selectedDusun, RT: ${_rtController.text}, RW: ${_rwController.text}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kolom pertama
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // City
              DropdownWidget(
                value: kota[0],
                hint: 'Kota',
                items: kota,
                onChanged: (value) {
                  setState(() {
                    selectedKota = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // districts
              DropdownWidget(
                value: kecematan[0],
                hint: 'Kecamatan',
                items: kecematan,
                onChanged: (value) {
                  setState(() {
                    selectedKecamatan = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // RT
              TextFieldWidget(
                controller: _rtController,
                hintText: "RT",
                isPasswordField: false,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        // Kolom kedua
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownWidget(
                value: desa[0],
                hint: 'Desa',
                items: desa,
                onChanged: (value) {
                  setState(() {
                    selectedDesa = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Dusun
              DropdownWidget(
                value: dusun[0],
                hint: 'Dusun',
                items: dusun,
                onChanged: (value) {
                  setState(() {
                    selectedDusun = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // RW
              TextFieldWidget(
                controller: _rwController,
                hintText: "RW",
                isPasswordField: false,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
            ],
          ),
        ),
      ],
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
                      barrierColor: Colors.black.withOpacity(0.5),
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
