import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/gantiKataSandi/model/post_ganti_kata_sandi_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/app/view/widget/top_snackbar/top_snackbar_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/config/validator/validator.dart';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../bloc/ganti_kata_sandi_bloc.dart';

class GantiKataSandi extends StatelessWidget {
  const GantiKataSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GantiKataSandiBloc(),
      child: GantiKataSandiView(),
    );
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
        child: BlocConsumer<GantiKataSandiBloc, GantiKataSandiState>(
          listener: (context, state) {
            if (state is GantiKataSandiSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().success("Berhasil Ganti Kata Sandi"),
              );
              Navigator.pop(context);
            }
            if (state is GantiKataSandiFailed) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().error("${state.message}"),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
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
                          hintText: "Masukan Kata Sandi Lama",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_isOldPasswordVisible,
                          onToggleVisibility: () {
                            setState(() {
                              _isOldPasswordVisible = !_isOldPasswordVisible;
                            });
                          },
                          isPasswordField: true,
                          validators: [
                            (value) => Validator.required(value),
                            (value) => Validator.min(
                                value, 8, "Kata sandi minimal 8 karakter"),
                          ],
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
                          hintText: "Masukan Kata Sandi Baru",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_isNewPasswordVisible,
                          onToggleVisibility: () {
                            setState(() {
                              _isNewPasswordVisible = !_isNewPasswordVisible;
                            });
                          },
                          isPasswordField: true,
                          validators: [
                            (value) => Validator.required(
                                  value,
                                ),
                            (value) => Validator.min(
                                value, 8, "Kata sandi minimal 8 karakter"),
                            (value) => Validator.mustContainsCapitalize(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                            (value) => Validator.mustContainsLowerCase(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                            (value) => Validator.mustContainsNumber(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                            (value) => Validator.mustContainsSymbol(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                          ],
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
                          hintText: "Masukan Konfirmasi Kata Sandi",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_isConfirmPasswordVisible,
                          onToggleVisibility: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                          isPasswordField: true,
                          validators: [
                            (value) => Validator.required(value),
                            (value) => Validator.min(
                                value, 8, "Kata sandi minimal 8 karakter"),
                            (value) => Validator.mustContainsCapitalize(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                            (value) => Validator.mustContainsLowerCase(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                            (value) => Validator.mustContainsNumber(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                            (value) => Validator.mustContainsSymbol(value,
                                "Gunakan huruf besar, angka, dan simbol (!@#\$%)"),
                            (value) => Validator.compareValues(
                                  value,
                                  _newPasswordController.text,
                                  'Kata sandi tidak cocok',
                                ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(32)),
                        ButtonPrimary(
                          color: redPrimaryMain,
                          mainButtonMessage: "Ganti Kata Sandi",
                          mainButton: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              logger.d(
                                "Old password: ${_oldPasswordController.text}\nNew password: ${_newPasswordController.text}\nConfirm password: ${_confirmPasswordController.text}",
                              );
                              PostGantiKataSandiModel data =
                                  PostGantiKataSandiModel(
                                oldPassword: _oldPasswordController.text,
                                newPassword: _newPasswordController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                              );
                              logger.d(data);
                              context
                                  .read<GantiKataSandiBloc>()
                                  .add(PostGantiKataSandiEvent(data));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
