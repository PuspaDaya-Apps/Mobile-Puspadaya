import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/home/bloc/grafikKunjungan/bloc/grafik_kunjungan_bloc.dart';
import 'package:puspadaya/app/feature/home/bloc/totalKunjunganBloc/bloc/total_kunjungan_bloc.dart';
import 'package:puspadaya/app/view/widget/MenuHomeItems.dart';
import 'package:puspadaya/app/view/widget/home_card_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../config/theme/shadow.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../model/current_user_model.dart';
import '../../../view/widget/alert_dialog_content.dart';
import '../../../view/widget/alert_dialog_widget.dart';
import '../../authorization/bloc/blocAuthorization/authorization_bloc.dart';
import '../bloc/cardDataHomeBloc/card_data_home_bloc.dart';
import '../bloc/internetBloc/internet_bloc.dart';
import '../bloc/jadwalPosyanduHomeBloc/jadwal_posyandu_home_bloc.dart';
import '../model/card_home_response_model.dart';
import '../model/grafik_kunjungan_response_model.dart';
import 'home_wrapper.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.currentUserModel});

  final CurrentUserModel currentUserModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardDataHomeBloc(),
        ),
        BlocProvider(
          create: (context) => JadwalPosyanduHomeBloc(),
        ),
        BlocProvider(
          create: (context) => GrafikKunjunganBloc(),
        ),
        BlocProvider(
          create: (context) => TotalKunjunganBloc(),
        ),
        BlocProvider(create: (context) => InternetBloc())
      ],
      child: HomeView(currentUserModel: currentUserModel),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.currentUserModel});

  final CurrentUserModel currentUserModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardDataHomeBloc>(context).add(GetCardHome());
    BlocProvider.of<JadwalPosyanduHomeBloc>(context)
        .add(GetJadwalHome(context));
    BlocProvider.of<GrafikKunjunganBloc>(context)
        .add(GetGrafikKunjunganEvent(widget.currentUserModel.role.namaRole));
    BlocProvider.of<TotalKunjunganBloc>(context)
        .add(TotalKunjunganFetchEvent());
    BlocProvider.of<InternetBloc>(context).add(InternetObserve());
  }

  @override
  Widget build(BuildContext context) {
    final authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);
    final internetBloc = BlocProvider.of<InternetBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 16),
          child: ListView(
            children: [
              ProfileSection(
                bloc: internetBloc,
                name: widget.currentUserModel.namaLengkap,
                role: widget.currentUserModel.role.namaRole,
                posyandu: widget.currentUserModel.posyandu.namaPosyandu,
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(16),
              ),
              BlocConsumer<JadwalPosyanduHomeBloc, JadwalPosyanduHomeState>(
                listener: (context, state) {
                  debugPrint(state.toString());
                  if (state is JadwalPosyanduHomeTokenExpiredState) {
                    authorizationBloc.add(AuthorizationFalseEvent());
                  }
                },
                builder: (context, state) {
                  if (state is JadwalPosyanduHomeProcessState) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 7,
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: bluePrimaryMain,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  if (state is JadwalPosyanduHomeFailedState) {
                    return Center(
                      child: Text('${state.error}'),
                    );
                  }
                  if (state is JadwalPosyanduHomeSuccessState) {
                    logger.d(
                        'total point ${state.totalPointResponseModel.totalSkorKeseluruhan.toString()}');
                    if (state.jadwal == null) {
                      return CardListActivity(
                        totalPoint: state.totalPointResponseModel.totalSkorKeseluruhan,
                        date: DateTime.now(),
                        location: widget.currentUserModel.posyandu.namaPosyandu,
                      );
                    }
                    return JadwalCard(
                        totalPoint: state.totalPointResponseModel.totalSkorKeseluruhan,
                        date: state.jadwal!.tanggalPelaksanaan,
                        name: state.jadwal!.namaKegiatan,
                        timeStart: state.jadwal!.waktuMulai,
                        timeEnd: state.jadwal!.waktuSelesai,
                        location: state.jadwal!.lokasi);
                  }
                  return Container();
                },
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(16),
              ),
              HomeMenuFeatures(),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(8),
              ),
              BlocConsumer<CardDataHomeBloc, CardDataHomeState>(
                listener: (context, state) {
                  debugPrint(state.toString());
                },
                builder: (context, state) {
                  if (state is CardDataHomeProcessState) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 7.4,
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: bluePrimaryMain,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  if (state is CardDataHomeSuccessState) {
                    return CardCarousel(
                      cardHomeResponseModel: state.cardDataHomeResponseModel,
                    );
                  }
                  return const SizedBox();
                },
              ),
              BlocBuilder<TotalKunjunganBloc, TotalKunjunganState>(
                builder: (context, state) {
                  if (state is TotalKunjunganLoading) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 7.4,
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: bluePrimaryMain,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  if (state is TotalKunjunganFailed) {
                    return Center(
                      child: Text('${state.message}'),
                    );
                  }
                  if (state is TotalKunjunganSuccess) {
                    logger.d('total kunjungan = ${state.totalKunjungan.data}');
                    if (state.totalKunjungan.data <= 0) {
                      return const SizedBox();
                    } else {
                      logger.d(state.totalKunjungan.data);
                      return CardMessages(
                        title:
                            "Anda telah berkunjung ${state.totalKunjungan.data} kali bulan ini.",
                        message:
                            "Terus melangkah menuju pelayanan masyarakat lebih baik!",
                      );
                    }
                  }
                  return Container();
                },
              ),
              BlocBuilder<GrafikKunjunganBloc, GrafikKunjunganState>(
                builder: (context, state) {
                  if (state is GrafikKunjunganLoading) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 7.4,
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: bluePrimaryMain,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  if (state is GrafikKunjunganFailed) {
                    return Center(
                      child: Text('${state.message}'),
                    );
                  }
                  if (state is GrafikKunjunganSuccess) {
                    logger.d(state.grafikKunjungan);
                    return GraphData(
                      dataGrafik: state.grafikKunjungan,
                      roleUser: widget.currentUserModel.role.namaRole,
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardCarousel extends StatelessWidget {
  const CardCarousel({super.key, required this.cardHomeResponseModel});

  final CardHomeResponseModel cardHomeResponseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      height: 130,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: SizeConfig.calWidthMultiplier(10),
          children: [
            SizedBox(
              width: SizeConfig.calWidthMultiplier(18),
            ),
            HomeCard(
              title: "Jumlah Anak",
              number: cardHomeResponseModel.data!.jumlahAnak.jumlah,
              description: 'Jumlah Anak Meningkat ',
              highlightText: '34%',
              isPositive: true,
            ),
            HomeCard(
              title: "Jumlah Anak Stunting",
              number: cardHomeResponseModel.data!.jumlahAnakStunting.jumlah,
              description: 'Jumlah Stunting Meningkat ',
              highlightText: '2%',
              isPositive: true,
            ),
            HomeCard(
              title: "Jumlah Anak Underweight",
              number: cardHomeResponseModel.data!.jumlahAnakUnderweight.jumlah,
              description: 'Jumlah Underweight Meningkat ',
              highlightText: '5%',
              isPositive: true,
            ),
            HomeCard(
              title: "Jumlah Anak Wasting",
              number: cardHomeResponseModel.data!.jumlahAnakWasting.jumlah,
              description: 'Jumlah Wasting Menurun ',
              highlightText: '4%',
              isPositive: false,
            ),
            HomeCard(
              title: "Jumlah Ibu Hamil",
              number: cardHomeResponseModel.data!.jumlahIbuHamil.jumlah,
              description: 'Jumlah Ibu Hamil Meningkat ',
              highlightText: '12%',
              isPositive: true,
            ),
            SizedBox(
              width: SizeConfig.calWidthMultiplier(10),
            ),
          ],
        ),
      ),
    );
  }
}

class CardListActivity extends StatelessWidget {
  final DateTime date;
  final String location;
  final num totalPoint;
  static const List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  static const List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    "Jum'at",
    'Sabtu',
    'Minggu',
  ];

  const CardListActivity(
      {super.key,
      required this.date,
      required this.location,
      required this.totalPoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: SizeConfig.calWidthMultiplier(24)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.calWidthMultiplier(16),
        vertical: SizeConfig.calHeightMultiplier(12),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: bluePrimaryMain,
        boxShadow: [
          BoxShadow(
            color: Color(0xffE4E6E9).withValues(alpha: 0.3),
            blurRadius: 14,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Text(
                    DateFormat('d', 'id_ID').format(date),
                    style: AppTextStyles.primaryTextSemibold.copyWith(
                      color: Colors.white,
                      fontSize: 38,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MMMM y', 'id_ID').format(date),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        DateFormat('EEEE', 'id_ID').format(date),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD700).withOpacity(0.35),
                      Colors.white38.withOpacity(0.2)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 2,
                  children: [
                    Image(
                      image: AssetImage(imageThropy),
                      width: SizeConfig.calWidthMultiplier(16),
                    ),
                    Text(
                      '${totalPoint.toString()} Poin',
                      style: TextStyle(
                        color: goldPrimary70,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.calMultiplierText(14),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          // line
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  final DateTime date;
  final String name;
  final DateTime timeStart;
  final DateTime timeEnd;
  final String location;
  final num totalPoint;
  final List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    "Jum'at",
    'Sabtu',
    'Minggu',
  ];

  JadwalCard({
    required this.totalPoint,
    super.key,
    required this.date,
    required this.name,
    required this.timeStart,
    required this.timeEnd,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: SizeConfig.calWidthMultiplier(24)),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.calWidthMultiplier(16),
          vertical: SizeConfig.calHeightMultiplier(12),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bluePrimaryMain,
          boxShadow: [
            BoxShadow(
              color: Color(0xffE4E6E9).withValues(alpha: 0.3),
              blurRadius: 14,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateCard(date),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${DateFormat('Hm', 'id_ID').format(timeStart)} - ${DateFormat('Hm', 'id_ID').format(timeEnd)}',
                    style: TextStyle(
                      color: textSecondary1,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.calMultiplierText(16),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${name}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Image(
                            height: 12,
                            image: AssetImage(
                              iconLocation,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.calWidthMultiplier(4),
                          ),
                          Text(
                            '${location}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.calMultiplierText(12),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFD700).withOpacity(0.35),
                        Colors.white38.withOpacity(0.2)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 2,
                    children: [
                      Image(
                        image: AssetImage(imageThropy),
                        width: SizeConfig.calWidthMultiplier(16),
                      ),
                      Text(
                        '${totalPoint.toString()} Poin',
                        style: TextStyle(
                          color: goldPrimary70,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.calMultiplierText(14),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row DateCard(DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          DateFormat('d', 'id_ID').format(date),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.calMultiplierText(38),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('MMMM y', 'id_ID')
                  .format(date), // Corrected month indexing
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              DateFormat('EEEE', 'id_ID')
                  .format(date), // Corrected weekday indexing
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  final InternetBloc bloc;
  final String name;
  final String role;
  final String posyandu;

  const ProfileSection(
      {super.key,
      required this.name,
      required this.role,
      required this.posyandu,
      required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.showPopup &&
            state.fromChecked) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogContent(
                mainButtonMessage: 'Tutup',
                colorMainButton: bluePrimaryMain,
                mainButton: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                title: "Cek Status Internet",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        'Status Internet Anda Sekarang Adalah',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Online',
                      style: TextStyle(
                        fontSize: 18,
                        color: greenPrimaryMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is InternetDisconnected &&
            state.showPopup &&
            state.fromChecked) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogContent(
                mainButtonMessage: 'Tutup',
                colorMainButton: bluePrimaryMain,
                mainButton: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                title: "Cek Status Internet",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        'Status Internet Anda Sekarang Adalah',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Offline',
                      style: TextStyle(
                        fontSize: 18,
                        color: redPrimaryMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is InternetLoading) {
          showGeneralDialog(
            context: context,
            barrierDismissible: false, // Tidak bisa ditutup dengan tap di luar
            barrierColor:
                Colors.black.withValues(alpha: 0.5), // Latar semi-transparan
            pageBuilder: (context, animation, secondaryAnimation) {
              return PopScope(
                canPop: false, // Blok tombol back
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.3,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: SpinKitThreeBounce(
                      color: bluePrimaryMain,
                      size: MediaQuery.of(context).size.width * 0.1,
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          spacing: SizeConfig.calWidthMultiplier(12),
          children: [
            Image(
              image: AssetImage(userImageDefault),
              height: SizeConfig.calMultiplierImage(50),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hallo, $name',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: AppTextStyles.primaryTextSemibold.copyWith(
                      color: textPrimary10,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '$role - $posyandu',
                    style: TextStyle(
                      color: textSecondary1,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            BlocSelector<InternetBloc, InternetState, bool>(
              selector: (state) => state.isDisconnected,
              builder: (context, isDisconneected) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogContent(
                          mainButtonMessage: 'Cek Status Internet',
                          colorMainButton: bluePrimaryMain,
                          mainButton: () {
                            bloc.add(CheckInternet());
                            Navigator.pop(context);
                          },
                          title: "Status Internet",
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Text('Status Internet Anda Adalah'),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                isDisconneected ? 'Offline' : 'Online',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: isDisconneected
                                      ? redPrimaryMain
                                      : greenPrimaryMain,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: SizeConfig.calWidthMultiplier(28),
                    height: SizeConfig.calHeightMultiplier(28),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:
                          isDisconneected ? redPrimaryMain : greenPrimaryMain,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NOTIFIKASI, // Kirimkan nama fitur sebagai argumen
                );
              },
              child: Container(
                width: SizeConfig.calWidthMultiplier(30),
                height: SizeConfig.calHeightMultiplier(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bluePrimaryMain.withValues(alpha: 0.3),
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidBell,
                    color: bluePrimaryMain,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeMenuFeatures extends StatefulWidget {
  const HomeMenuFeatures({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeMenuFeaturesState createState() => _HomeMenuFeaturesState();
}

class _HomeMenuFeaturesState extends State<HomeMenuFeatures> {
  // State untuk mengontrol jumlah item
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Hitung jumlah item yang akan ditampilkan
    // Daftar item menu
    final List<Widget> _menuItems = [
      HomeMenuItems(
        colorBackground: bluePrimary40,
        // Biru terang untuk Register
        menuName: 'Register',
        iconMenu: FontAwesomeIcons.userPlus,
        colorIcon: bluePrimary40,
        onTap: () {
          Navigator.pushNamed(context, REGISTER);
        },
      ),
      HomeMenuItems(
        colorBackground: goldPrimary30,
        // Abu-abu untuk Alat Ukur (Netral)
        menuName: 'Alat Ukur',
        iconMenu: FontAwesomeIcons.rulerCombined,
        colorIcon: goldPrimary30,
        onTap: () {
          Navigator.pushNamed(context, ALAT_UKUR);
        },
      ),
      HomeMenuItems(
        colorBackground: bluePrimaryMain,
        // Biru utama untuk Monitoring
        menuName: 'Monitoring',
        iconMenu: FontAwesomeIcons.chartLine,
        colorIcon: bluePrimaryMain,
        onTap: () {
          Navigator.pushNamed(context, MONITORING);
        },
      ),
      HomeMenuItems(
        colorBackground: redPrimaryMain,
        // Merah untuk Faktor Resiko
        menuName: 'Faktor Resiko',
        iconMenu: iconFaktorResiko,
        colorIcon: redPrimaryMain,
        onTap: () {
          Navigator.pushNamed(
            context,
            ANAK_FAKTOR_RESIKO,
          );
        },
      ),
      HomeMenuItems(
        colorBackground: greenPrimary50,
        // Hijau untuk Parameter Gizi
        menuName: 'Parameter Gizi',
        iconMenu: FontAwesomeIcons.utensils,
        colorIcon: greenPrimary50,
        onTap: () {
          Navigator.pushNamed(
            context,
            PARAMETER_GIZI, // Kirimkan nama fitur sebagai argumen
          );
        },
      ),
      HomeMenuItems(
        colorBackground: purplePrimary50,
        // Ungu untuk Beban Kerja
        menuName: 'Beban Kerja',
        iconMenu: FontAwesomeIcons.briefcase,
        colorIcon: purplePrimary50,
        // Dalam Home (HomeView atau item menu Beban Kerja):
        onTap: () async {
          final result = await Navigator.pushNamed(context, BEBAN_KERJA)
              as bool; //nilai akan di tangkap disini
          if (result == true) {
            // Rebuild Home via callback ke atas
            if (context.mounted) {
              final homeWrapperState = context.findAncestorStateOfType<
                  HomeWrapperState>(); //get homeWrapperState menggunakan globalKey
              homeWrapperState?.rebuildHome();
            }
          }
        },
      ),
      HomeMenuItems(
        colorBackground: goldPrimary50,
        // Emas untuk Laporan (Menandakan penting)
        menuName: 'Laporan',
        iconMenu: FontAwesomeIcons.print,
        colorIcon: goldPrimary50,
        onTap: () {
          Navigator.pushNamed(
            context,
            LAPORAN, // Kirimkan nama fitur sebagai argumen
          );
        },
      ),
      HomeMenuItems(
        colorBackground: greenPrimary50,
        // Hijau tetap untuk e-PPGBM
        menuName: 'e-PPGBM',
        iconMenu: iconExcel,
        colorIcon: greenPrimary50,
        onTap: () {
          Navigator.pushNamed(
            context,
            EPPGBM,
          );
        },
      ),
    ];

    int itemExpanedCol = (_menuItems.length / 4).ceil();
    logger.d('menu items ${_menuItems.length}, itemExpanedCol ${itemExpanedCol.ceil()}');
    int itemsToShow = _isExpanded ? _menuItems.length : 4;
    double sizeHeighRowItemMenu = MediaQuery.of(context).size.height / 7.2;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.calWidthMultiplier(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          // AnimatedContainer untuk efek animasi
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Durasi animasi
            curve: Curves.easeInOut, // Kurva animasi
            height: _isExpanded
                ? sizeHeighRowItemMenu * itemExpanedCol.toDouble() + MediaQuery.of(context).size.height / 200
                : sizeHeighRowItemMenu, // Tinggi menu saat diperluas/dikecilkan
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemsToShow, // Batasi jumlah item yang ditampilkan
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 16,
                childAspectRatio: 0.62,
                mainAxisSpacing: 5,
                maxCrossAxisExtent: 80,
              ),
              itemBuilder: (context, index) {
                return _menuItems[index];
              },
            ),
          ),
          // Tombol See All
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded; // Toggle state
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              side: BorderSide(
                width: 1,
                color: Colors.black38,
              ),
              minimumSize: Size(double.infinity, 52),
              shape: RoundedRectangleBorder(),
            ),
            child: Row(
              spacing: 1,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _isExpanded ? "Sembunyikan" : "Lihat Lainnya",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  size: 20,
                  _isExpanded
                      ? FluentIcons.chevron_up_24_filled
                      : FluentIcons.chevron_down_24_filled,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardMessages extends StatelessWidget {
  final String title;
  final String message;

  const CardMessages({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff72FA93), borderRadius: BorderRadius.circular(20)),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${title}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${message}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class GraphData extends StatelessWidget {
  final GrafikKunjunganResponseModel dataGrafik;
  final String roleUser;

  GraphData({super.key, required this.dataGrafik, required this.roleUser});

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> dataChart = List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: dataGrafik.data[index].toDouble(),
            color: Colors.red,
            width: 16,
          ),
        ],
      );
    });

    // Hitung maxY secara dinamis
    double maxY = dataChart
        .expand((group) => group.barRods.map((rod) => rod.toY))
        .reduce((value, element) => value > element ? value : element);

    maxY = (maxY / 10).ceil() * 10;

    return Container(
      width: double.infinity,
      height: SizeConfig.calHeightMultiplier(300),
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.calWidthMultiplier(24),
        vertical: SizeConfig.calHeightMultiplier(8),
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: shadowSm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grafik Kunjungan $roleUser',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: SizeConfig.calHeightMultiplier(8)),
          Text(
            'Menampilkan grafik jumlah kunjungan yang telah dilakukan $roleUser',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          SizedBox(height: SizeConfig.calHeightMultiplier(20)),
          Expanded(
            child: Container(
              color: Colors.white,
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => bluePrimary40,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final month = bulan[group.x.toInt()];
                        return BarTooltipItem(
                          '$month\n${rod.toY.toInt()} Kunjungan',
                          TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                  maxY: maxY + 10,
                  alignment: BarChartAlignment.spaceEvenly,
                  barGroups: dataChart,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: SizeConfig.calWidthMultiplier(18),
                        getTitlesWidget: (value, meta) {
                          if (value % 10 == 0) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black38),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const months = [
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'Mei',
                            'Jun',
                            'Jul',
                            'Ags',
                            'Sep',
                            'Okt',
                            'Nov',
                            'Des'
                          ];
                          if (value >= 0 && value < months.length) {
                            return Text(
                              months[value.toInt()],
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black38),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
