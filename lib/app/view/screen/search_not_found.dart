import 'package:flutter/material.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/theme/pallet_color.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            width: 300,
            image: AssetImage(imageSearch),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Data tidak ditemukan',
            style: TextStyle(
              color: textSecondary1,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Coba cari data yang lain',
            style: TextStyle(
              color: textSecondary1,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
