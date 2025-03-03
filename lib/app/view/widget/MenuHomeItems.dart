import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class HomeMenuItems extends StatelessWidget {
  final String menuName;
  final Color? colorIcon; // Opsional
  final dynamic iconMenu;
  final Color colorBackground;
  final VoidCallback onTap;

  HomeMenuItems({
    super.key,
    required this.colorBackground,
    required this.onTap,
    required this.menuName,
    required this.iconMenu,
    this.colorIcon, // Default adalah null
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 4,
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            // padding: const EdgeInsets.all(16.0),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colorBackground.withValues(
                  alpha: 0.3), // Menggunakan withOpacity
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Center(
              child: _buildIconWithColor(),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            menuName,
            style: AppTextStyles.primaryTextSemibold.copyWith(
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // Logika untuk menangani berbagai jenis ikon
  Widget _buildIconWithColor() {
    if (iconMenu is IconData) {
      return Icon(
        iconMenu,
        size: 28.0,
        color: colorIcon ?? Colors.black, // Default warna hitam jika null
      );
    } else if (iconMenu is FaIcon) {
      return FaIcon(
        (iconMenu as FaIcon).icon,
        color: colorIcon ?? Colors.black, // Default warna hitam jika null
        size: (iconMenu as FaIcon).size ?? 28.0, // Ukuran default
      );
    } else if (iconMenu is String) {
      return Image.asset(
        iconMenu,
        width: 28.0,
        color: colorIcon, // Gunakan warna jika tersedia
      );
    } else {
      return const SizedBox(); // Widget kosong jika tidak sesuai
    }
  }
}
