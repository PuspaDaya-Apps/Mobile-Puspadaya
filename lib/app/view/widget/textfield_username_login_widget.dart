import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/login/bloc/loginBloc/login_bloc.dart';
import 'package:puspadaya/config/validator/form_error_provider.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class TextFieldUsernameLoginWidget extends StatelessWidget {
  const TextFieldUsernameLoginWidget({
    required this.clientValidators,
    required this.title,
    required this.keyboard,
    required this.textController,
    required this.hintText,
    required this.formFieldKey,
    required this.focusNode,
    this.errortext,
    required this.fieldName, required this.onTap,
  });
  final String fieldName; // ini harus sama dengan nama key dari error
  final GlobalKey<FormFieldState>? formFieldKey;
  final FocusNode focusNode;
  final String title;
  final TextInputType keyboard;
  final List<FormFieldValidator<String>>? clientValidators;
  final TextEditingController textController;
  final String hintText;
  final String? errortext;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final errorProvider = FormErrorProvider.of(context);
    final serverError = errorProvider?.errors?[fieldName]?.join(', ');
    logger.d('server error in textfield $serverError');

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: bluePrimary20,
                fontSize: SizeConfig.calMultiplierText(14),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: SizeConfig.calHeightMultiplier(6)),
          TextFormField(
            onTap: onTap,
            validator: (value) {
              // client validator
              if (clientValidators != null) {
                for (var validator in clientValidators!) {
                  final error = validator(value);
                  if (error != null) {
                    return error;
                  }
                }
              }
              // 2. Server validation (ambil dari state/error provider)
              if (serverError != null) {
                final error = serverError;
                if (error != null) {
                  return error;
                }
              }

              // return
              // return null;
            },
            key: formFieldKey,
            focusNode: focusNode,
            controller: textController,
            keyboardType: keyboard,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.calWidthMultiplier(12),
                    vertical: SizeConfig.calHeightMultiplier(9)),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: textPrimary30.withOpacity(0.6),
                    fontSize: SizeConfig.calMultiplierText(13),
                    fontWeight: FontWeight.w400),
                errorText: serverError,
                errorStyle: TextStyle(
                    fontSize: SizeConfig.calMultiplierText(13),
                    fontWeight: FontWeight.w400),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: stroke10),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: stroke10),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
