import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/validator/validator.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ResetPasswordView();
  }
}

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void handleSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      // Lakukan aksi setelah validasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kata sandi berhasil diperbarui!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      appBar: AppBar(
        backgroundColor: backgroundWhite,
        title: const Text(
          'Ganti Kata Sandi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.calWidthMultiplier(24)),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.calHeightMultiplier(50)),
                  Center(
                    child: Image(
                      height: SizeConfig.calHeightMultiplier(250),
                      image: AssetImage(resetPasswordImage),
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                  const Text(
                    'Atur Ulang Kata Sandi',
                    style: TextStyle(
                      color: bluePrimary20,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                  Text(
                    'Kata Sandi Baru',
                    style: TextStyle(color: bluePrimary20),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(6)),
                  TextFieldWidget(
                    controller: passwordController,
                    hintText: "Masukan Kata Sandi Baru",
                    isPasswordField: true,
                    keyboardType: TextInputType.visiblePassword,
                    validators: [
                      (value) => Validator.required(
                          value, "Kata sandi tidak boleh kosong"),
                      (value) => Validator.min(
                          value, 8, "Kata sandi minimal 8 karakter"),
                      (value) => Validator.mustContainsCapitalize(
                          value, 'Kata sandi harus mengandung huruf besar'),
                      (value) => Validator.mustContainsLowerCase(
                          value, 'Kata sandi harus mengandung huruf kecil'),
                      (value) => Validator.mustContainsNumber(
                          value, "Kata sandi harus mengandung angka"),
                      (value) => Validator.mustContainsSymbol(
                          value, 'Kata sandi harus mengandung simbol'),
                    ],
                    obscureText: true,
                    onToggleVisibility: () {},
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                  Text(
                    'Konfirmasi Kata Sandi',
                    style: TextStyle(color: bluePrimary20),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(6)),
                  TextFieldWidget(
                    controller: confirmPasswordController,
                    hintText: "Konfirmasi Masukan Kata Sandi",
                    isPasswordField: true,
                    keyboardType: TextInputType.visiblePassword,
                    validators: [
                      (value) => Validator.required(
                          value, "Kata sandi tidak boleh kosong"),
                      (value) => Validator.min(
                          value, 8, "Kata sandi minimal 8 karakter"),
                      (value) => Validator.mustContainsCapitalize(
                          value, 'Kata sandi harus mengandung huruf besar'),
                      (value) => Validator.mustContainsLowerCase(
                          value, 'Kata sandi harus mengandung huruf kecil'),
                      (value) => Validator.mustContainsNumber(
                          value, "Kata sandi harus mengandung angka"),
                      (value) => Validator.mustContainsSymbol(
                          value, 'Kata sandi harus mengandung simbol'),
                    ],
                    obscureText: true,
                    onToggleVisibility: () {},
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                  ButtonPrimary(
                    color: bluePrimaryMain,
                    mainButtonMessage: "Ganti Kata Sandi",
                    mainButton: handleSubmit,
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
