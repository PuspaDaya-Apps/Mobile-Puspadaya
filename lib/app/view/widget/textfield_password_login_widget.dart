import 'package:flutter/material.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class TextFieldPasswordLoginWidget extends StatefulWidget {
  const TextFieldPasswordLoginWidget({
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
  State<TextFieldPasswordLoginWidget> createState() =>
      _TextFieldPasswordLoginWidgetState();
}

class _TextFieldPasswordLoginWidgetState
    extends State<TextFieldPasswordLoginWidget> {
  bool hiddenText = true;

  @override
  Widget build(BuildContext context) {
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
          TextField(
            controller: widget.textController,
            obscureText: hiddenText,
            keyboardType: widget.keyboard,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.calWidthMultiplier(12),
                    vertical: SizeConfig.calHeightMultiplier(9)),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: textPrimary30.withOpacity(0.6),
                    fontSize: SizeConfig.calMultiplierText(13),
                    fontWeight: FontWeight.w400),
                errorText: widget.errortext,
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
