import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:puspadaya/app/feature/gantiKataSandi/view/ganti_kata_sandi.dart';
import 'package:puspadaya/app/feature/gantiProfile/view/ganti_profile.dart';
import 'package:puspadaya/app/feature/home/view/home_wrapper.dart';
import 'package:puspadaya/app/feature/jadwal/view/create_jadwal.dart';
import 'package:puspadaya/app/feature/jadwal/view/edit_jadwal.dart';
import 'package:puspadaya/app/feature/kebijakanPrivasi/view/kebijakan.dart';
import '../app/feature/login/view/login_screen.dart';
import 'package:puspadaya/app/feature/jadwal/view/jadwal.dart';
import 'package:puspadaya/app/feature/resetPassword/view/reset_password.dart';
import '../app/view/screen/on_boarding_screen.dart';
import './route_name.dart';

import '../app/view/screen/page_not_found_screen.dart';
import '../app/view/screen/splash_screen.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASHSCREEN:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);

      case ONBOARDING:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(), settings: settings);

      case LOGIN:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(), settings: settings);

      case OTP:
        return MaterialPageRoute(
            builder: (context) => const Jadwal(), settings: settings);

      case RESETPASSWORD:
        return MaterialPageRoute(
            builder: (context) => const ResetPassword(), settings: settings);

      case JADWAL:
        return MaterialPageRoute(
            builder: (context) => const Jadwal(), settings: settings);

      case CREATEJADWAL:
        return MaterialPageRoute(
            builder: (context) => const CreateJadwal(), settings: settings);

      case EDITJADWAL:
        return MaterialPageRoute(
            builder: (context) => const EditJadwal(), settings: settings);

      case HOME:
        return MaterialPageRoute(
            builder: (context) => const HomeWrapper(), settings: settings);

      case KEBIJAKAN_PRIVASI:
        return MaterialPageRoute(
            builder: (context) => const KebijakanPrivasi(), settings: settings);

      case GANTI_KATA_SANDI:
        return MaterialPageRoute(
            builder: (context) => const GantiKataSandi(), settings: settings);

      case UBAH_PROFILE:
        return MaterialPageRoute(
            builder: (context) => const GantiProfile(), settings: settings);

      default:
        return PageTransition(
            child: const PageNotFoundScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 600),
            settings: settings);
    }
  }
}
