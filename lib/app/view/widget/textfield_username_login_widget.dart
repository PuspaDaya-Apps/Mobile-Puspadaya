import 'package:flutter/material.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class TextFieldUsernameLoginWidget extends StatelessWidget {
  const TextFieldUsernameLoginWidget({
    super.key, 
    required this.title, 
    required this.keyboard,
    required this.textController,
    required this.hintText,
    this.errortext, 
  });

  final String title;
  final TextInputType keyboard;
  final TextEditingController textController;
  final String hintText;
  final String? errortext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: fontColorTextFieldLogin,
              fontSize: SizeConfig.calMultiplierText(14),
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(6)
          ),
          TextField(
            controller: textController,
            keyboardType: keyboard,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.calWidthMultiplier(12),
                vertical: SizeConfig.calHeightMultiplier(9)
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: fontColor2.withOpacity(0.6),
                fontSize: SizeConfig.calMultiplierText(13),
                fontWeight: FontWeight.w400
              ),
              errorText: errortext,
              errorStyle: TextStyle(
                fontSize: SizeConfig.calMultiplierText(13),
                fontWeight: FontWeight.w400
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: borderDefaultColor
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: borderDefaultColor
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
        ],
      ),
    );
  }
}