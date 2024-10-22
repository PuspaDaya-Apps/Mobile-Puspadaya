import 'package:flutter/material.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';
import '../widget/on_boarding_item_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int page = 0;

  final List<Map<String,String>> onBoardingItem = [
    {
      'image': onBoarding1Image,
      'tittle': "Pantau Tumbuh Kembang Anak",
      'description': "Catat tinggi, berat, dan perkembangan anak Anda dengan Kartu Identitas Anak digital. Mudahkan pemantauan kesehatan anak dengan fitur ini.",
    },
    {
      'image': onBoarding2Image,
      'tittle': "Cegah Stunting untuk Pertumbuhan Optimal Anak",
      'description': "Dapatkan rekomendasi nutrisi dan tips kesehatan untuk mencegah stunting sejak dini.",
    },
    {
      'image': onBoarding3Image,
      'tittle': "Akses Informasi Kesehatan Terpercaya",
      'description': "Akses tips pencegahan stunting serta layanan kesehatan yang terpercaya dan akurat.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: EdgeInsets.only(
            top: SizeConfig.calHeightMultiplier(35),
            bottom: SizeConfig.calHeightMultiplier(65),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.calWidthMultiplier(25)
                ),
                child: Text(
                  "Hallo, Selamat Datang Di Puspadaya",
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: baseColor,
                    fontSize: SizeConfig.calMultiplierText(20),
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(65) 
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: onBoardingItem.length,
                        onPageChanged: (value) {
                          setState(() {
                            page = value;
                          });
                        },
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.calWidthMultiplier(25)
                          ),
                          child: OnBoardingItemWidget(
                            image: onBoardingItem[index]['image']!, 
                            title: onBoardingItem[index]['tittle']!, 
                            description: onBoardingItem[index]['description']!
                          ),
                        ),
                      )
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(25),
                    ),
                    page+1 == onBoardingItem.length
                    ? Container(
                      height: SizeConfig.calHeightMultiplier(40),
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.calWidthMultiplier(25)
                      ),
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: baseColor
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.calMultiplierText(15),
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ),
                    )
                    : Container(
                      height: SizeConfig.calHeightMultiplier(40),
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.calWidthMultiplier(25)
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onBoardingItem.length, (index) {
                          return AnimatedContainer(
                            height: SizeConfig.calWidthMultiplier(22),
                            width: SizeConfig.calWidthMultiplier(22),
                            margin: EdgeInsets.only(
                              right: SizeConfig.calWidthMultiplier(17)
                            ),
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              color: page == index ? pointOnBoardingColor : pointOnBoardingColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                SizeConfig.calWidthMultiplier(22)
                              )
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }
}