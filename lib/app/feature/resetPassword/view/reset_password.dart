import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/primary_button.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Kata sandi harus minimal 8 karakter';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Kata sandi harus mengandung huruf besar';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Kata sandi harus mengandung huruf kecil';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Kata sandi harus mengandung angka';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Kata sandi harus mengandung simbol';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi kata sandi tidak boleh kosong';
    }
    if (value != passwordController.text) {
      return 'Kata sandi tidak cocok';
    }
    return null;
  }

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
      backgroundColor: whiteBackgroundColor,
      appBar: AppBar(
        backgroundColor: whiteBackgroundColor,
        title: const Text(
          'Reset Password',
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Image(
                      height: 250,
                      image: AssetImage(resetPasswordImage),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Atur Ulang Kata Sandi',
                    style: TextStyle(
                      color: blueColorDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Kata Sandi Baru',
                    style: TextStyle(color: fontColor2),
                  ),
                  const SizedBox(height: 6),
                  TextFieldWidget(
                    controller: passwordController,
                    hintText: "Masukan Kata Sandi Baru",
                    isPasswordField: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: passwordValidator,
                    obscureText: true,
                    onToggleVisibility: () {},
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Konfirmasi Kata Sandi',
                    style: TextStyle(color: fontColor2),
                  ),
                  const SizedBox(height: 6),
                  TextFieldWidget(
                    controller: confirmPasswordController,
                    hintText: "Konfirmasi Masukan Kata Sandi",
                    isPasswordField: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: confirmPasswordValidator,
                    obscureText: true,
                    onToggleVisibility: () {},
                  ),
                  const SizedBox(height: 20),
                  ButtonPrimary(
                    color: baseColor,
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
