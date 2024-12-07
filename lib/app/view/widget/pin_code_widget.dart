import 'package:flutter/material.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class PinCodeField extends StatelessWidget {
  final TextEditingController pinController;
  final OutlineInputBorder outlineInputBorder;
  final ValueChanged<String>? onChanged;

  PinCodeField({
    super.key,
    required this.onChanged,
    required this.pinController,
    required this.outlineInputBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.calWidthMultiplier(50),
      child: TextField(
        controller: pinController,
        enabled: true, // Aktifkan keyboard perangkat
        obscureText: true, // Teks disembunyikan untuk keamanan
        style: TextStyle(
          fontSize: SizeConfig.calMultiplierText(18),
          color: fontColor1,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          contentPadding: EdgeInsets.all(SizeConfig.calWidthMultiplier(16)),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onChanged, // Pemrosesan ketika teks berubah
      ),
    );
  }
}
