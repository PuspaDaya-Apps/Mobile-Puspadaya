import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:puspadaya/app/feature/kodeOTP/view/otp_screen.dart';
import 'package:puspadaya/app/feature/resetPassword/view/reset_password.dart';
import '../app/view/screen/on_boarding_screen.dart';
import './route_name.dart';

import '../app/view/screen/page_not_found_screen.dart';
import '../app/view/screen/splash_screen.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){

      case SPLASHSCREEN :
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: settings
      );

      case ONBOARDING :
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
        settings: settings
      );

      case OTP :
      return MaterialPageRoute(
        builder: (context) => const OtpScreen(),
        settings: settings
      );
      
      case RESETPASSWORD :
      return MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
        settings: settings
      );

      default: 
      return PageTransition(
        child: const PageNotFoundScreen(), 
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 600),
        settings: settings
      );
    } 
  }
}