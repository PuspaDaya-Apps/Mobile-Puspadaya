import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../config/screen_config/size_config.dart';

class PrimaryButtonLoadingWidget extends StatelessWidget {

  const PrimaryButtonLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: SizedBox(
          height: SizeConfig.calHeightMultiplier(20),
          width: SizeConfig.calHeightMultiplier(20),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
