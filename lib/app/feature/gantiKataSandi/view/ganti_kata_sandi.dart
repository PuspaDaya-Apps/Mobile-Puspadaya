import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar.dart';
import 'package:puspadaya/app/view/widget/primary_button.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/config/validator/passowrd_validator.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class GantiKataSandi extends StatelessWidget {
  const GantiKataSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return const GantiKataSandiView();
  }
}

class GantiKataSandiView extends StatefulWidget {
  const GantiKataSandiView({super.key});

  @override
  State<GantiKataSandiView> createState() => _GantiKataSandiViewState();
}

class _GantiKataSandiViewState extends State<GantiKataSandiView> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        onBackPressed: () => Navigator.pop(context),
        title: "Ganti Kata Sandi",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Kata Sandi Lama',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _oldPasswordController,
                    hintText: "********",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_isOldPasswordVisible,
                    onToggleVisibility: () {
                      setState(() {
                        _isOldPasswordVisible = !_isOldPasswordVisible;
                      });
                    },
                    isPasswordField: true,
                    validator: (value) =>
                        PasswordValidator.passwordValidator(value),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Kata Sandi Baru',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _newPasswordController,
                    hintText: "********",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_isNewPasswordVisible,
                    onToggleVisibility: () {
                      setState(() {
                        _isNewPasswordVisible = !_isNewPasswordVisible;
                      });
                    },
                    isPasswordField: true,
                    validator: (value) =>
                        PasswordValidator.passwordValidator(value),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Text(
                    'Konfirmasi Kata Sandi',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                      controller: _confirmPasswordController,
                      hintText: "********",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_isConfirmPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                      isPasswordField: true,
                      validator: (value) =>
                          PasswordValidator.confirmPasswordValidator(
                              value, _newPasswordController.text)),
                  SizedBox(height: SizeConfig.calHeightMultiplier(32)),
                  ButtonPrimary(
                    color: redPrimaryMain,
                    mainButtonMessage: "Ganti Kata Sandi",
                    mainButton: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        logger.d(
                          "Old password: ${_oldPasswordController.text}\nNew password: ${_newPasswordController.text}\nConfirm password: ${_confirmPasswordController.text}",
                        );
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
