import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/screen_config/image_config.dart';
import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/checkbox_login_widget.dart';
import '../../../view/widget/textfield_password_login_widget.dart';
import '../../../view/widget/textfield_username_login_widget.dart';
import '../../lupaKataSandi/view/lupa_kata_sandi_screen.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreenView();
  }
}

// ignore: must_be_immutable
class LoginScreenView extends StatelessWidget {
  LoginScreenView({super.key});

   final List<String> image = <String>[
    login1Vector,
    login2Vector
   ];

   TextEditingController usernameController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   bool ingatSaya = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width : MediaQuery.sizeOf(context).width,
                        height : SizeConfig.calHeightMultiplier(381),
                        child: CarouselSlider.builder(
                          itemCount: image.length,
                          disableGesture: true,
                          options: CarouselOptions(
                            viewportFraction: 1.0,
                            autoPlay: true,
                            pauseAutoPlayOnTouch: true,
                            autoPlayAnimationDuration: const Duration(seconds: 3),
                            autoPlayInterval: const Duration(seconds: 8),
                            autoPlayCurve: Curves.ease,
                            enableInfiniteScroll: true,
                            onScrolled: null,
                            onPageChanged: null
                          ),
                          itemBuilder: (context, index, realIndex) => Image.asset(
                            image[index],
                            width: SizeConfig.calWidthMultiplier(335),
                            height: SizeConfig.calHeightMultiplier(250),
                            fit: BoxFit.contain,
                          )
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // height: MediaQuery.sizeOf(context).height,
                          padding: EdgeInsets.only(
                            top: SizeConfig.calHeightMultiplier(35),
                            bottom: SizeConfig.calHeightMultiplier(60),
                            right: SizeConfig.calWidthMultiplier(25),
                            left: SizeConfig.calWidthMultiplier(25)
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)
                            )
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFieldUsernameLoginWidget(
                                      key: const Key('Username'),
                                      title: 'Username',
                                      keyboard: TextInputType.number,
                                      hintText: 'Masukan Nomor Telepon',
                                      textController: usernameController,
                                      errortext: null,
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(15),
                                    ),
                                    TextFieldPasswordLoginWidget(
                                      key: const Key('password'),
                                      title: 'Kata Sandi',
                                      keyboard: TextInputType.visiblePassword,
                                      hintText: 'Masukan Kata Sandi',
                                      textController: passwordController,
                                      errortext: null,
                                    ),
                                    SizedBox(
                                      height: SizeConfig.calHeightMultiplier(8)
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        CheckboxLoginWidget(ingatSaya: ingatSaya),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => Center(child: LupaKataSandiScreen())
                                            );
                                          },
                                          child: Text(
                                            'Lupa Kata Sandi?',
                                            style: TextStyle(
                                              color: fontColorLupaPassword,
                                              fontSize: SizeConfig.calMultiplierText(13),
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.underline,
                                              decorationColor: fontColorLupaPassword,
                                            ),
                                          )
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: SizeConfig.calHeightMultiplier(40),
                                margin: EdgeInsets.only(
                                  top:SizeConfig.calHeightMultiplier(20)
                                ),
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, HOME);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonLoginColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.calWidthMultiplier(10),
                                      vertical: SizeConfig.calHeightMultiplier(10)
                                    )
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
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}