import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:puspadaya/app/feature/Kehadiran/update/view/update_kehadiran_screen.dart';
import 'package:puspadaya/app/feature/PengukuranTamu/create/view/create_pengukuran_tamu.dart';
import 'package:puspadaya/app/feature/PengukuranTamu/create/view/search_posyandu.dart';
import 'package:puspadaya/app/feature/alatUkur/create/view/create_alat_ukur.dart';
import 'package:puspadaya/app/feature/alatUkur/detail/view/detail_alat_ukur.dart';
import 'package:puspadaya/app/feature/alatUkur/index/view/alat_ukur.dart';
import 'package:puspadaya/app/feature/alatUkur/update/view/update_alat_ukur.dart';
import 'package:puspadaya/app/feature/eppgbm/view/e_ppgbm.dart';
import 'package:puspadaya/app/feature/laporan/view/laporan.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_ibu_hamil.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_stunting.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_under_weight.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_wasting.dart';
import 'package:puspadaya/app/feature/monitoring/index/monitoring.dart';
import 'package:puspadaya/app/feature/parameterGizi/view/parameter_gizi.dart';
import '../app/feature/Kehadiran/create/view/create_kehadiran_screen.dart';
import '../app/feature/Kehadiran/detail/view/detail_kehadiran_screen.dart';
import 'package:puspadaya/app/feature/CreateRegisterOrangTua/view/create_register_orang_tua.dart';
import 'package:puspadaya/app/feature/detailKunjunganBelumDiMulai/view/kunjungan_anak_stunting.dart';
import 'package:puspadaya/app/feature/detailKunjunganBelumDiMulai/view/kunjungan_anak_tidak_hadir.dart';
import 'package:puspadaya/app/feature/detailKunjunganBelumDiMulai/view/kunjungan_ibu_hamil.dart';
import 'package:puspadaya/app/feature/detailRegisterAnak/view/detail_register_anak.dart';
import 'package:puspadaya/app/feature/detailRegisterAnggotaKader/view/detail_register_anggota_kader.dart';
import 'package:puspadaya/app/feature/detailRegisterIbuHamil/view/detail_register_ibu_hamil.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/view/detail_register_orang_tua.dart';
import 'package:puspadaya/app/feature/detailRegisterPengasuh/view/detail_register_pengasuh.dart';
import 'package:puspadaya/app/feature/register/view/register.dart';
import 'package:puspadaya/app/feature/registerAnggotaKader/view/register_anggota_kader.dart';
import 'package:puspadaya/app/feature/registerOrangTua/view/register_orang_tua.dart';
import 'package:puspadaya/app/feature/updateRegisterOrangTua/view/update_register_orang_tua.dart';
import 'package:puspadaya/app/view/screen/feature_maintenance.dart';
import '../app/feature/PengukuranTamu/detail/view/detail_pengukuran_tamu.dart';
import '../app/feature/PengukuranTamu/update/view/update_pengukuran_tamu.dart';
import '../app/feature/bebanKerja/index/view/beban_kerja.dart';
import '../app/feature/bebanKerja/create/view/create_beban_kerja.dart';
import '../app/feature/createKunjunganAnakTidakHadir/view/create_kunjungan_anak_tidak_hadir.dart';
import '../app/feature/createKunjunganStunting/view/create_kunjungan_stunting.dart';
import '../app/feature/detailRegisterAnak/model/get_detail_anak_response.dart';
import '../app/feature/pengukuranAnak/create/view/create_pengukuran_anak.dart';
import '../app/feature/pengukuranIbuHamil/create/view/create_pengukuran_ibu_hamil.dart';
import '../app/feature/createRegisterAnak/view/create_register_anak.dart';
import '../app/feature/createRegisterAnggotaKader/view/create_register_anggota_kader.dart';
import '../app/feature/createRegisterIbuHamil/view/create_register_ibu_hamil.dart';
import '../app/feature/creteKunjunganIbuHamil/view/create_kunjungan_ibu_hamil.dart';
import '../app/feature/bebanKerja/detail/view/detail_beban_kerja.dart';
import '../app/feature/pengukuranAnak/detail/view/detail_pengukuran_anak.dart';
import '../app/feature/detailKunjunganBerjalan/view/kunjungan_anak_stunting.dart';
import '../app/feature/detailKunjunganBerjalan/view/kunjungan_anak_tidak_hadir.dart';
import '../app/feature/detailKunjunganBerjalan/view/kunjungan_ibu_hamil.dart';
import '../app/feature/detailKunjunganSelesai/view/kunjungan_anak_stunting.dart';
import '../app/feature/detailKunjunganSelesai/view/kunjungan_anak_tidak_hadir.dart';
import '../app/feature/detailKunjunganSelesai/view/kunjungan_ibu_hamil.dart';
import '../app/feature/pengukuranIbuHamil/detail/view/detail_pengukuran_ibu_hamil.dart';
import '../app/feature/RiwayatAnak/detail/view/detail_riwayat_balita.dart';
import '../app/feature/RiwayatIbuHamil/detail/view/detail_riwayat_tamu.dart';
import '../app/feature/gantiKataSandi/view/ganti_kata_sandi.dart';
import '../app/feature/gantiProfile/view/ganti_profile.dart';
import '../app/feature/home/view/home_wrapper.dart';
import '../app/feature/jadwal/view/create_jadwal.dart';
import '../app/feature/jadwal/view/edit_jadwal.dart';
import '../app/feature/jadwal/view/jadwal.dart';
import '../app/feature/kebijakanPrivasi/view/kebijakan.dart';
import '../app/feature/kodeOTP/view/otp_screen.dart';
import '../app/feature/login/view/login_screen.dart';
import '../app/feature/registerAnak/view/register_anak.dart';
import '../app/feature/registerIbuHamil/view/register_ibu_hamil.dart';
import '../app/feature/registerPengasuh/view/register_pengasuh.dart';
import '../app/feature/resetPassword/view/reset_password.dart';
import '../app/feature/pengukuranAnak/update/view/update_pengukuran_anak.dart';
import '../app/feature/pengukuranIbuHamil/update/view/update_pengukuran_ibu_hamil.dart';
import '../app/feature/updateRegisterAnak/view/update_register_anak.dart';
import '../app/feature/updateRegisterAnggotaKader/view/update_register_anggota_kader.dart';
import '../app/feature/updateRegisterIbuHamil/view/update_register_ibu_hamil.dart';
import '../app/feature/updateRegisterPengasuh/view/update_register_pengasuh.dart';
import '../app/model/paketToScreen/paket_to_update_pengasuh_model.dart';
import '../app/model/paketToScreen/paket_to_update_pengukuran_anak_model.dart';
import '../app/view/screen/on_boarding_screen.dart';
import '../app/view/screen/home_example.dart';
import '../app/view/screen/page_not_found_screen.dart';

import '../app/view/screen/splash_screen.dart';
import './route_name.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASHSCREEN:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      // case SPLASHSCREEN:
      //   return MaterialPageRoute(
      //       builder: (context) => const HomeWrapper(), settings: settings);

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

      case HOMEEXAMPLE:
        return MaterialPageRoute(
            builder: (context) => const HomeExample(), settings: settings);

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
            builder: (context) => const CreateKehadiranScreen(),
            settings: settings);

      case DETAIL_KEHADIRAN:
        return MaterialPageRoute(
            builder: (context) => const DetailKehadiranScreen(),
            settings: settings);

      case UPDATE_KEHADIRAN:
        return MaterialPageRoute(
            builder: (context) => const UpdateKehadiran(), settings: settings);

      case CREATE_PENGUKURAN_ANAK:
        return MaterialPageRoute(
            builder: (context) => const CreatePengukuranAnak(),
            settings: settings);

      case DETAIL_PENGUKURAN_ANAK:
        return MaterialPageRoute(
            builder: (context) => DetailPengukuranAnak(
                  pengukuranId: settings.arguments as String,
                ),
            settings: settings);

      case UPDATE_PENGUKURAN_ANAK:
        return MaterialPageRoute(
            builder: (context) => UpdatePengukuranAnak(
                paket: settings.arguments as PaketToUpdatePengukuranAnakModel),
            settings: settings);

      // ? tamu
      case CREATE_PENGUKURAN_TAMU:
        return MaterialPageRoute(
            builder: (context) => const SearchPosyandu(), settings: settings);

      case UPDATE_PENGUKURAN_TAMU:
        return MaterialPageRoute(
            builder: (context) => const UpdatePengukuranTamu(),
            settings: settings);

      case DETAIL_PENGUKURAN_TAMU:
        final id = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (context) => DetailPengukuranTamu(pengukuranId: id),
          settings: settings,
        );

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
        final id = settings.arguments as String? ?? '';
        return MaterialPageRoute(
            builder: (context) => DetailRiwayatBalita(id: id,),
            settings: settings);

      case DETAIL_RIWAYAT_IBU_HAMIL:
        final id = settings.arguments as String? ?? '';
        return MaterialPageRoute(
            builder: (context) => DetailRiwayatIbuHamil(
                  id: id,
                ),
            settings: settings);

      //beban kerja
      case BEBAN_KERJA:
        return MaterialPageRoute(
            builder: (context) => const BebanKerja(), settings: settings);

      case DETAIL_BEBAN_KERJA:
        return MaterialPageRoute(
            builder: (context) =>
                DetailBebanKerja(bebanKerjaId: settings.arguments as String),
            settings: settings);

      case CREATE_BEBAN_KERJA:
        return MaterialPageRoute(
          builder: (context) => const CreateBebanKerja(),
          settings: settings,
        );
      //! kunjungan create

      case CREATE_KUNJUNGAN_STUNTING:
        return MaterialPageRoute(
            builder: (context) => const CreateKunjunganStunting(),
            settings: settings);

      case CREATE_KUNJUNGAN_ANAK_TIDAK_HADIR:
        return MaterialPageRoute(
            builder: (context) => const CreateKunjunganAnakTidakHadir(),
            settings: settings);

      case CREATE_KUNJUNGAN_IBU_HAMIL:
        return MaterialPageRoute(
            builder: (context) => const CreateKunjunganIbuHamil(),
            settings: settings);

      // ! kunjungan detail

      //? belum dimulai
      case DETAIL_KUNJUNGAN_STUNTING_NOT_STARTED:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganAnakStuntingNotStarted(),
            settings: settings);

      case DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_NOT_STARTED:
        return MaterialPageRoute(
            builder: (context) =>
                const DetailKunjunganAnakTidakHadirNotStarted(),
            settings: settings);
      case DETAIL_KUNJUNGAN_IBU_HAMIL_NOT_STARTED:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganIbuHamilNotStarted(),
            settings: settings);

      //? berjalan
      case DETAIL_KUNJUNGAN_STUNTING_ON_GOING:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganAnakStuntingOnGoing(),
            settings: settings);

      case DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_ON_GOING:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganAnakTidakHadirOnGoing(),
            settings: settings);
      case DETAIL_KUNJUNGAN_IBU_HAMIL_ON_GOING:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganIbuHamilOnGoing(),
            settings: settings);

      //? done
      case DETAIL_KUNJUNGAN_STUNTING_DONE:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganAnakStuntingDone(),
            settings: settings);

      case DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_DONE:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganAnakTidakHadirDone(),
            settings: settings);
      case DETAIL_KUNJUNGAN_IBU_HAMIL_DONE:
        return MaterialPageRoute(
            builder: (context) => const DetailKunjunganIbuHamilDone(),
            settings: settings);

      // ! register
      case REGISTER:
        return MaterialPageRoute(
          builder: (context) => const Register(),
          settings: settings,
        );

      //? ORANG TUA
      case REGISTER_ORANG_TUA:
        return MaterialPageRoute(
          builder: (context) => const RegisterOrangTua(),
          settings: settings,
        );
      case CREATE_REGISTER_ORANG_TUA:
        return MaterialPageRoute(
          builder: (context) => const CreateRegisterOrangTua(),
          settings: settings,
        );

      case UPDATE_REGISTER_ORANG_TUA:
        return MaterialPageRoute(
          builder: (context) => const UpdateRegisterOrangTua(),
          settings: settings,
        );
      case DETAIL_REGISTER_ORANG_TUA:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final ayahId = args['ayahId'] ?? '';
        final ibuId = args['ibuId'] ?? '';
        return MaterialPageRoute(
          builder: (context) => DetailRegisterOrangTua(
            ibuId: ibuId,
            ayahId: ayahId,
          ),
          settings: settings,
        );

      //? Anak
      case REGISTER_ANAK:
        return MaterialPageRoute(
          builder: (context) => const RegisterAnak(),
          settings: settings,
        );
      case CREATE_REGISTER_ANAK:
        return MaterialPageRoute(
          builder: (context) => const CreateRegisterAnak(),
          settings: settings,
        );

      case UPDATE_REGISTER_ANAK:
        return MaterialPageRoute(
          builder: (context) => UpdateRegisterAnak(
            getDetailAnakResponse: settings.arguments as GetDetailAnakResponse,
          ),
          settings: settings,
        );

      case DETAIL_REGISTER_ANAK:
        final id = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (context) => DetailRegisterAnak(
            id: id,
          ),
          settings: settings,
        );

      //? Pengasuh
      case REGISTER_PENGASUH:
        return MaterialPageRoute(
          builder: (context) => const RegisterPengasuh(),
          settings: settings,
        );
      case UPDATE_REGISTER_PENGASUH:
        return MaterialPageRoute(
          builder: (context) => UpdateRegisterPengasuh(
            paketToUpdatePengasuhModel: settings.arguments as PaketToUpdatePengasuhModel,
          ),
          settings: settings,
        );
      case DETAIL_REGISTER_PENGASUH:
        return MaterialPageRoute(
          builder: (context) => DetailRegisterPengasuh(idPengasuh: settings.arguments as String),
          settings: settings,
        );

      //? IbuHamil
      case REGISTER_IBU_HAMIL:
        return MaterialPageRoute(
          builder: (context) => const RegisterIbuHamil(),
          settings: settings,
        );
      case CREATE_REGISTER_IBU_HAMIL:
        return MaterialPageRoute(
          builder: (context) => const CreateRegisterIbuHamil(),
          settings: settings,
        );

      case UPDATE_REGISTER_IBU_HAMIL:
        return MaterialPageRoute(
          builder: (context) => const UpdateRegisterIbuHamil(),
          settings: settings,
        );

      case DETAIL_REGISTER_IBU_HAMIL:
        return MaterialPageRoute(
          builder: (context) => const DetailRegisterIbuHamil(),
          settings: settings,
        );

      //? alat ukur
      case ALAT_UKUR:
        return MaterialPageRoute(
          builder: (context) => const AlatUkur(),
          settings: settings,
        );

      case CREATE_ALAT_UKUR:
        return MaterialPageRoute(
          builder: (context) => const CreateAlatUkur(),
          settings: settings,
        );

      case DETAIL_ALAT_UKUR:
        final String id =
            settings.arguments as String; // Cast directly to String
        return MaterialPageRoute(
          builder: (context) => DetailAlatUkur(alatUkurId: id),
          settings: settings,
        );

      case UPDATE_ALAT_UKUR:
        return MaterialPageRoute(
          builder: (context) => const UpdateAlatUkur(),
          settings: settings,
        );

      // ?monitoring
      case MONITORING:
        return MaterialPageRoute(
          builder: (context) => const Monitoring(),
          settings: settings,
        );

      case DETAIL_MONITORING_STUNTING:
        final String id =
            settings.arguments as String; // Cast directly to String
        return MaterialPageRoute(
          builder: (context) => DetailMonitoringStunting(id: id),
          settings: settings,
        );

      case DETAIL_MONITORING_UNDER_WEIGHT:
        final String id =
            settings.arguments as String; // Cast directly to String
        return MaterialPageRoute(
          builder: (context) => DetailMonitoringUnderWeight(id: id),
          settings: settings,
        );

      case DETAIL_MONITORING_WASTING:
        final String id =
            settings.arguments as String; // Cast directly to String
        return MaterialPageRoute(
          builder: (context) => DetailMonitoringWasting(id: id),
          settings: settings,
        );

      case DETAIL_MONITORING_IBU_HAMIL:
        final String id =
            settings.arguments as String; // Cast directly to String
        return MaterialPageRoute(
          builder: (context) => DetailMonitoringIbuHamil(id: id),
          settings: settings,
        );

      //? AnggotaKader
      case REGISTER_ANGGOTA_KADER:
        return MaterialPageRoute(
          builder: (context) => const RegisterAnggotaKader(),
          settings: settings,
        );
      case CREATE_REGISTER_ANGGOTA_KADER:
        return MaterialPageRoute(
          builder: (context) => const CreateRegisterAnggotaKader(),
          settings: settings,
        );

      case UPDATE_REGISTER_ANGGOTA_KADER:
        return MaterialPageRoute(
          builder: (context) => const UpdateRegisterAnggotaKader(),
          settings: settings,
        );
      case DETAIL_REGISTER_ANGGOTA_KADER:
        return MaterialPageRoute(
          builder: (context) => const DetailRegisterAnggotaKader(),
          settings: settings,
        );


      // ? paramter gizi

      case PARAMETER_GIZI:
        return MaterialPageRoute(
          builder: (context) => const ParameterGizi(),
          settings: settings,
        );
      //! laporan
      case LAPORAN:
        return MaterialPageRoute(
          builder: (context) => const Laporan(),
          settings: settings,
        );

        //! eppgbm
      case EPPGBM:
        return MaterialPageRoute(
          builder: (context) => const E_PPGBM(),
          settings: settings,
        );
      // ! maintenance
      case FEATURE_MAINTENANCE:
        final feature =
            settings.arguments as String? ?? 'Fitur Tidak Diketahui';
        return MaterialPageRoute(
          builder: (context) => FeatureMaintenance(feature: feature),
          settings: settings,
        );

      default:
        return PageTransition(
            child: const PageNotFoundScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 600),
            settings: settings);
    }
  }
}
