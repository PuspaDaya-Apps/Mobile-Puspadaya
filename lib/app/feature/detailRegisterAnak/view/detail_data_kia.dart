import 'package:flutter/material.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';

class DetailDataKIA extends StatelessWidget {
  const DetailDataKIA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image(
              image: AssetImage(imageGrafikPerkembanganAnak),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black54,
          ),
          SizedBox(
            height: 16,
          ),
          Text('Riwayat Pengukuran'),
        ],
      ),
    );
  }
}
