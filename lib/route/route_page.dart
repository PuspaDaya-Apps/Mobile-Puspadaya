import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:puspadaya/app/feature/createKehadiran/view/create_kehadiran.dart';
import 'package:puspadaya/app/feature/createPengukuranAnak/view/create_pengukuran_anak.dart';
import 'package:puspadaya/app/feature/createPengukuranIbuHamil/view/create_pengukuran_ibu_hamil.dart';
import 'package:puspadaya/app/feature/detailKehadiran/view/detail_kehadiran.dart';
import 'package:puspadaya/app/feature/detailPengukuranAnak/view/detail_pengukuran_anak.dart';
import 'package:puspadaya/app/feature/detailPengukuranIbuHamil/view/detail_pengukuran_ibu_hamil.dart';
import 'package:puspadaya/app/feature/detailRiwayatBalita/view/detail_riwayat_balita.dart';
import 'package:puspadaya/app/feature/detailRiwayatIbuHamil/view/detail_riwayat_tamu.dart';
import 'package:puspadaya/app/feature/gantiKataSandi/view/ganti_kata_sandi.dart';
import 'package:puspadaya/app/feature/gantiProfile/view/ganti_profile.dart';
import 'package:puspadaya/app/feature/home/view/home_wrapper.dart';
import 'package:puspadaya/app/feature/jadwal/view/create_jadwal.dart';
import 'package:puspadaya/app/feature/jadwal/view/edit_jadwal.dart';
import 'package:puspadaya/app/feature/kebijakanPrivasi/view/kebijakan.dart';
import 'package:puspadaya/app/feature/kodeOTP/view/otp_screen.dart';
import 'package:puspadaya/app/feature/updatePengukuranAnak/view/update_pengukuran_anak.dart';
import 'package:puspadaya/app/feature/updatePengukuranIbuHamil/view/update_pengukuran_ibu_hamil.dart';
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
            builder: (context) => const OtpScreen(), settings: settings);

      case RESET_PASSWORD:
        return MaterialPageRoute(
            builder: (context) => const ResetPassword(), settings: settings);

      case HOME:
        return MaterialPageRoute(
            builder: (context) => const HomeWrapper(), settings: settings);

      // JADWAL
      case JADWAL:
        return MaterialPageRoute(
            builder: (context) => const Jadwal(), settings: settings);

      case CREATE_JADWAL:
        return MaterialPageRoute(
            builder: (context) => const CreateJadwal(), settings: settings);

      case EDIT_JADWAL:
        return MaterialPageRoute(
            builder: (context) => const EditJadwal(), settings: settings);

      // PROFILE

      case KEBIJAKAN_PRIVASI:
        return MaterialPageRoute(
            builder: (context) => const KebijakanPrivasi(), settings: settings);

      case GANTI_KATA_SANDI:
        return MaterialPageRoute(
            builder: (context) => const GantiKataSandi(), settings: settings);

      case UBAH_PROFILE:
        return MaterialPageRoute(
            builder: (context) => const GantiProfile(), settings: settings);

      // PENGUKURAN
      case CREATE_KEHADIRAN:
        return MaterialPageRoute(
            builder: (context) => const CreateKehadiran(), settings: settings);

      case DETAIL_KEHADIRAN:
        return MaterialPageRoute(
            builder: (context) => const DetailKehadiran(), settings: settings);

      case CREATE_PENGUKURAN_ANAK:
        return MaterialPageRoute(
            builder: (context) => const CreatePengukuranAnak(),
            settings: settings);

      case DETAIL_PENGUKURAN_ANAK:
        return MaterialPageRoute(
            builder: (context) => const DetailPengukuranAnak(),
            settings: settings);

      case UPDATE_PENGUKURAN_ANAK:
        return MaterialPageRoute(
            builder: (context) => const UpdatePengukuranAnak(),
            settings: settings);

      case CREATE_PENGUKURAN_IBU_HAMIL:
        return MaterialPageRoute(
            builder: (context) => const CreatePengukuranIbuHamil(),
            settings: settings);

      case DETAIL_PENGUKURAN_IBU_HAMIL:
        return MaterialPageRoute(
            builder: (context) => const DetailPengukuranIbuHamil(),
            settings: settings);

      case UPDATE_PENGUKURAN_IBU_HAMIL:
        return MaterialPageRoute(
            builder: (context) => const UpdatePengukuranIbuHamil(),
            settings: settings);

      case DETAIL_RIWAYAT_ANAK:
        return MaterialPageRoute(
            builder: (context) => const DetailRiwayatBalita(),
            settings: settings);

      case DETAIL_RIWAYAT_IBU_HAMIL:
        return MaterialPageRoute(
            builder: (context) => const DetailRiwayatIbuHamil(),
            settings: settings);

      default:
        return PageTransition(
            child: const PageNotFoundScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 600),
            settings: settings);
    }
  }
}
