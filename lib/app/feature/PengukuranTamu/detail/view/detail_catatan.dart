import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_info_field_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';

class DetailCatatan extends StatefulWidget {
  const DetailCatatan({
    super.key,
    required this.catatan,
    required this.keluhan
  });
  final String catatan;
  final String keluhan;

  @override
  State<DetailCatatan> createState() => _DetailCatatanState();
}

class _DetailCatatanState extends State<DetailCatatan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Catatan',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            AutoSizeTextInfoFieldWidget(
                text: widget.catatan
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            const Text(
              'Keluhan',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            AutoSizeTextInfoFieldWidget(
                text: widget.keluhan
            ),
          ],
        ),
      ),
    );
  }
}
