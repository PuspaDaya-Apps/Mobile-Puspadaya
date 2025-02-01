import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_info_field_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';

class DetailCatatan extends StatefulWidget {
  const DetailCatatan({super.key});

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
              text:
                  'Lorem ipsum odor amet, consectetuer adipiscing elit. Consectetur senectus litora praesent egestas curabitur felis pellentesque, ante dignissim? Placerat facilisis semper lectus diam in. Porttitor diam potenti lobortis consequat vitae natoque facilisi nostra. Egestas lacus ultrices tortor nascetur habitasse, rutrum pharetra in. Porta commodo taciti ipsum, penatibus viverra ridiculus natoque? Mi mus magna risus himenaeos sem. Dui scelerisque scelerisque viverra pretium mollis; mollis lobortis accumsan. Convallis lacinia porta parturient natoque pellentesque aliquet torquent non.',
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
              text:
                  'Lorem ipsum odor amet, consectetuer adipiscing elit. Consectetur senectus litora praesent egestas curabitur felis pellentesque, ante dignissim? Placerat facilisis semper lectus diam in. Porttitor diam potenti lobortis consequat vitae natoque facilisi nostra. Egestas lacus ultrices tortor nascetur habitasse, rutrum pharetra in. Porta commodo taciti ipsum, penatibus viverra ridiculus natoque? Mi mus magna risus himenaeos sem. Dui scelerisque scelerisque viverra pretium mollis; mollis lobortis accumsan. Convallis lacinia porta parturient natoque pellentesque aliquet torquent non.',
            ),
          ],
        ),
      ),
    );
  }
}
