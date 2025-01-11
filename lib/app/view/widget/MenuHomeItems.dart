import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class HomeMenuItems extends StatelessWidget {
  final String menuName;
  final Color colorIcon;
  final dynamic iconMenu;
  const HomeMenuItems(
      {super.key,
      required this.menuName,
      required this.iconMenu,
      required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // icon
        Container(
          padding: const EdgeInsets.all(16.0),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: bluePrimaryMain.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Center(
            child: iconMenu is IconData
                ? Icon(
                    iconMenu,
                    size: 48.0, // Example size
                    color: colorIcon, // Example color
                  )
                : iconMenu is FaIcon
                    ? iconMenu
                    : Image(
                        width: 24,
                        color: colorIcon,
                        image: AssetImage(
                          iconMenu,
                        ),
                      ),
          ),
        ),
        Text('${menuName}')
      ],
    );
  }
}
