import 'package:flutter/material.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';

// ignore: must_be_immutable
class LupaKataSandiScreen extends StatefulWidget {
  const LupaKataSandiScreen({super.key});

  @override
  State<LupaKataSandiScreen> createState() => _LupaKataSandiScreenState();
}

class _LupaKataSandiScreenState extends State<LupaKataSandiScreen> {
  TextEditingController nomorTelponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.zero,
      shadowColor: Colors.black.withOpacity(0.25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      child: Wrap(
        children: [
          Container(
            width: SizeConfig.calWidthMultiplier(360),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.calHeightMultiplier(25),
                horizontal: SizeConfig.calWidthMultiplier(35)),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lupa Kata Sandi",
                  style: TextStyle(
                      color: bluePrimary20,
                      fontSize: SizeConfig.calMultiplierText(20),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(25)),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nomor Telpon',
                        style: TextStyle(
                            color: bluePrimary20,
                            fontSize: SizeConfig.calMultiplierText(14),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(6)),
                      TextField(
                        controller: nomorTelponController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.calWidthMultiplier(12),
                                vertical: SizeConfig.calHeightMultiplier(9)),
                            hintText: 'Masukan Nomor Telpon',
                            hintStyle: TextStyle(
                                color: textSecoundary,
                                fontSize: SizeConfig.calMultiplierText(13),
                                fontWeight: FontWeight.w400),
                            errorText: null,
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
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(25)),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: SizeConfig.calHeightMultiplier(50),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: nomorTelponController.text == ""
                              ? bluePrimary90
                              : bluePrimary20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.calWidthMultiplier(10),
                              vertical: SizeConfig.calHeightMultiplier(10))),
                      child: Text(
                        'Kirim',
                        style: TextStyle(
                            color: nomorTelponController.text == ""
                                ? bluePrimary20
                                : Colors.white,
                            fontSize: SizeConfig.calMultiplierText(15),
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
