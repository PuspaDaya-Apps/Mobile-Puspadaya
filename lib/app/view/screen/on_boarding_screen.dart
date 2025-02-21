import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/screen_config/image_config.dart';
import '../../../config/screen_config/size_config.dart';
import '../../../config/theme/pallet_color.dart';
import '../../../route/route_name.dart';
import '../../feature/authorization/bloc/blocAuthentication/authentication_bloc.dart';
import '../widget/on_boarding_item_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int page = 0;

  final List<Map<String, String>> onBoardingItem = [
    {
      'image': onBoarding1Image,
      'tittle': "Pantau Tumbuh Kembang Anak",
      'description':
          "Catat tinggi, berat, dan perkembangan anak Anda dengan Kartu Identitas Anak digital. Mudahkan pemantauan kesehatan anak dengan fitur ini.",
    },
    {
      'image': onBoarding2Image,
      'tittle': "Cegah Stunting untuk Pertumbuhan Optimal Anak",
      'description':
          "Dapatkan rekomendasi nutrisi dan tips kesehatan untuk mencegah stunting sejak dini.",
    },
    {
      'image': onBoarding3Image,
      'tittle': "Akses Informasi Kesehatan Terpercaya",
      'description':
          "Akses tips pencegahan stunting serta layanan kesehatan yang terpercaya dan akurat.",
    }
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
                        horizontal: SizeConfig.calWidthMultiplier(25)),
                    child: Text(
                      "Hallo, Selamat Datang Di Puspadaya",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: bluePrimaryMain,
                          fontSize: SizeConfig.calMultiplierText(20),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(65)),
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
                                horizontal: SizeConfig.calWidthMultiplier(25)),
                            child: OnBoardingItemWidget(
                                image: onBoardingItem[index]['image']!,
                                title: onBoardingItem[index]['tittle']!,
                                description: onBoardingItem[index]
                                    ['description']!),
                          ),
                        )),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(25),
                        ),
                        page == 0
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.calWidthMultiplier(25)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      height:
                                          SizeConfig.calHeightMultiplier(40),
                                      width:
                                          SizeConfig.calWidthMultiplier(157.50),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              page = page + 1;
                                              pageController.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 800),
                                                  curve: Curves.easeIn);
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: bluePrimary40),
                                          child: Text(
                                            'Selanjutnya',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: SizeConfig
                                                    .calMultiplierText(15),
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            : page + 1 == onBoardingItem.length
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.calWidthMultiplier(25)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height:
                                              SizeConfig.calHeightMultiplier(
                                                  40),
                                          width: SizeConfig.calWidthMultiplier(
                                              157.50),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  page = page - 1;
                                                  pageController.previousPage(
                                                      duration: const Duration(
                                                          milliseconds: 800),
                                                      curve: Curves.easeIn);
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  side: const BorderSide(
                                                      color: textSecondary1,
                                                      width: 1.5),
                                                  shadowColor: Colors.black),
                                              child: Text(
                                                'Kembali',
                                                style: TextStyle(
                                                    color: textSecondary1,
                                                    fontSize: SizeConfig
                                                        .calMultiplierText(15),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.calHeightMultiplier(
                                                  40),
                                          width: SizeConfig.calWidthMultiplier(
                                              157.50),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                BlocProvider.of<
                                                            AuthenticationBloc>(
                                                        context)
                                                    .add(OnBoardingDoneEvent());
                                                Navigator.pushReplacementNamed(
                                                    context, LOGIN);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      bluePrimary40),
                                              child: Text(
                                                'login',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: SizeConfig
                                                        .calMultiplierText(15),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.calWidthMultiplier(25)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height:
                                              SizeConfig.calHeightMultiplier(
                                                  40),
                                          width: SizeConfig.calWidthMultiplier(
                                              157.50),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  page = page - 1;
                                                  pageController.previousPage(
                                                      duration: const Duration(
                                                          milliseconds: 800),
                                                      curve: Curves.easeIn);
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  side: const BorderSide(
                                                      color: textSecondary1,
                                                      width: 1.5),
                                                  shadowColor: Colors.black),
                                              child: Text(
                                                'Kembali',
                                                style: TextStyle(
                                                    color: textSecondary1,
                                                    fontSize: SizeConfig
                                                        .calMultiplierText(15),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.calHeightMultiplier(
                                                  40),
                                          width: SizeConfig.calWidthMultiplier(
                                              157.50),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  page = page + 1;
                                                  pageController.nextPage(
                                                      duration: const Duration(
                                                          milliseconds: 800),
                                                      curve: Curves.easeIn);
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      bluePrimary40),
                                              child: Text(
                                                'Selanjutnya',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: SizeConfig
                                                        .calMultiplierText(15),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
