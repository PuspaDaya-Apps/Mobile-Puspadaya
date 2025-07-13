import 'package:flutter/material.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/validator/form_error_provider.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class TextFieldPasswordLoginWidget extends StatefulWidget {
  const TextFieldPasswordLoginWidget({
    super.key,
    required this.formFieldKey,
    required this.focusNode,
    required this.clientValidators,
    required this.title,
    required this.keyboard,
    required this.textController,
    required this.hintText,
    required this.fieldName,
    this.serverValidator,
    this.errortext,
    required this.onTap,
  });
  final String fieldName;
  final GlobalKey<FormFieldState>? formFieldKey;
  final FocusNode focusNode;
  final List<FormFieldValidator<String>>? clientValidators;
  final FormFieldValidator<String>? serverValidator;
  final String title;
  final TextInputType keyboard;
  final TextEditingController textController;
  final String hintText;
  final String? errortext;
  final GestureTapCallback onTap;

  @override
  State<TextFieldPasswordLoginWidget> createState() =>
      _TextFieldPasswordLoginWidgetState();
}

class _TextFieldPasswordLoginWidgetState
    extends State<TextFieldPasswordLoginWidget> {
  bool hiddenText = true;

  @override
  Widget build(BuildContext context) {
    final errorProvider = FormErrorProvider.of(context);
    final serverError = errorProvider?.errors?[widget.fieldName]?.join(', ');
    logger.d('server error in textfield $serverError');
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                color: bluePrimary20,
                fontSize: SizeConfig.calMultiplierText(14),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: SizeConfig.calHeightMultiplier(6)),
          TextFormField(
            onTap: widget.onTap,
            key: widget.formFieldKey,
            controller: widget.textController,
            obscureText: hiddenText,
            keyboardType: widget.keyboard,
            focusNode: widget.focusNode,
            validator: (value) {
              // client validator
              if (widget.clientValidators != null) {
                for (var validator in widget.clientValidators!) {
                  final error = validator(value);
                  if (error != null) {
                    return error;
                  }
                }
              }
              // server validator
              if (serverError != null) {
                final error = serverError;
                if (error != null) {
                  return error;
                }
              }

              // return
              return null;
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.calWidthMultiplier(12),
                    vertical: SizeConfig.calHeightMultiplier(9)),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: textPrimary30.withOpacity(0.6),
                    fontSize: SizeConfig.calMultiplierText(13),
                    fontWeight: FontWeight.w400),
                // errorText: widget.errortext,
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
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    icon: Icon(
                      hiddenText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: bluePrimary20,
                    ))),
          ),
        ],
      ),
    );
  }
}
