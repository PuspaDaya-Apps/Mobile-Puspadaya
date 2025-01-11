import 'package:flutter/material.dart';

import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

// ignore: must_be_immutable
class CheckboxLoginWidget extends StatefulWidget {
  CheckboxLoginWidget({super.key, required this.ingatSaya});
  bool ingatSaya;

  @override
  State<CheckboxLoginWidget> createState() => _CheckboxLoginWidgetState();
}

class _CheckboxLoginWidgetState extends State<CheckboxLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
              value: widget.ingatSaya,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              side: const BorderSide(width: 1, color: stroke10),
              activeColor: stroke10,
              checkColor: Colors.white,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onChanged: (value) {
                setState(() {
                  widget.ingatSaya = !widget.ingatSaya;
                });
              }),
        ),
        const SizedBox(width: 4),
        Text('Ingat Saya',
            style: TextStyle(
                color: textPrimary30,
                fontSize: SizeConfig.calMultiplierText(12),
                fontWeight: FontWeight.w400))
      ],
    );
  }
}
