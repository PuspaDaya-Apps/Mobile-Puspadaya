import 'package:flutter/material.dart';

import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';

class OnBoardingItemWidget extends StatelessWidget{
  OnBoardingItemWidget({super.key, 
    required this.image,
    required this.title,
    required this.description
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: SizeConfig.calHeightMultiplier(233),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(20)
          ),
        ),
        SizedBox(height: SizeConfig.calHeightMultiplier(25)),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.clip,
          style: TextStyle(
            color: fontColor2,
            fontSize: SizeConfig.calMultiplierText(20),
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: SizeConfig.calHeightMultiplier(25)),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: fontColor2.withOpacity(0.5),
              fontSize: SizeConfig.calMultiplierText(16),
              fontWeight: FontWeight.w400
            ),
          )
        )
      ],
    );
  }
}