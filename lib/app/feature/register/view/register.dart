import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/register/view/widget/anak_item.dart';

import 'package:puspadaya/app/feature/register/view/widget/ibu_hamil_item.dart';
import 'package:puspadaya/app/feature/register/view/widget/pengasuh_item.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/widget/MenuHomeItems.dart';
import '../cubit/current_user_cubit.dart';
import 'widget/orang_tua_item.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentUserCubit(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CurrentUserCubit>(context).getCurrentUserModel();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemHeight = screenWidth / 0.68; // Calculate height based on aspect ratio

    List<Widget> _menuItems = [];

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Register',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: BlocConsumer<CurrentUserCubit, CurrentUserState>(
          listener: (context, state) {
            debugPrint(state.toString());
          },
          builder: (context, state) {
            if(state is CurrentUserProccessState) {
              return SizedBox(
                child: Center(
                  child: SpinKitThreeBounce(
                    color: bluePrimaryMain,
                    size: 50.0,
                  ),
                ),
              );
            }
            if(state is CurrentUserSuccessState) {
              if(state.currentUserModel.role.namaRole == "Ketua Kader") {
                _menuItems.addAll([
                   HomeMenuItems(
                    colorBackground: pinkPrimary70,
                    menuName: 'Orang Tua',
                    iconMenu: Icons.family_restroom,
                    colorIcon: pinkPrimaryMain,
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_ORANG_TUA);
                    },
                  ),
                  HomeMenuItems(
                    colorBackground: goldPrimary70,
                    menuName: 'Anak',
                    iconMenu: FontAwesomeIcons.child,
                    colorIcon: goldPrimaryMain,
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_ANAK);
                    },
                  ),
                  HomeMenuItems(
                    colorBackground: purplePrimary70, // Warna baru untuk pengasuh
                    menuName: 'Pengasuh',
                    iconMenu: FontAwesomeIcons.personBreastfeeding,
                    colorIcon: purplePrimaryMain, // Ikon lebih kontras dengan background
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_PENGASUH);
                    },
                  ),
                  HomeMenuItems(
                    colorBackground: greenPrimary70,
                    menuName: 'Ibu Hamil',
                    iconMenu: FontAwesomeIcons.personPregnant,
                    colorIcon: greenPrimaryMain,
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_IBU_HAMIL);
                    },
                  ),
                  HomeMenuItems(
                    colorBackground: bluePrimary70, // Warna baru untuk anggota kader
                    menuName: 'Anggota Kader',
                    iconMenu: FluentIcons.people_team_24_filled,
                    colorIcon: bluePrimaryMain, // Sesuai dengan tema kebersamaan
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_ANGGOTA_KADER);
                    },
                  ),
                ]);
              } else {
                _menuItems.addAll([
                   HomeMenuItems(
                    colorBackground: pinkPrimary70,
                    menuName: 'Orang Tua',
                    iconMenu: Icons.family_restroom,
                    colorIcon: pinkPrimaryMain,
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_ORANG_TUA);
                    },
                  ),
                  HomeMenuItems(
                    colorBackground: goldPrimary70,
                    menuName: 'Anak',
                    iconMenu: FontAwesomeIcons.child,
                    colorIcon: goldPrimaryMain,
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_ANAK);
                    },
                  ),
                  HomeMenuItems(
                    colorBackground: purplePrimary70, // Warna baru untuk pengasuh
                    menuName: 'Pengasuh',
                    iconMenu: FontAwesomeIcons.personBreastfeeding,
                    colorIcon: purplePrimaryMain, // Ikon lebih kontras dengan background
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_PENGASUH);
                    },
                  ),
                  HomeMenuItems(
                    colorBackground: greenPrimary70,
                    menuName: 'Ibu Hamil',
                    iconMenu: FontAwesomeIcons.personPregnant,
                    colorIcon: greenPrimaryMain,
                    onTap: () {
                      Navigator.pushNamed(context, REGISTER_IBU_HAMIL);
                    },
                  ),
                  // HomeMenuItems(
                  //   colorBackground: bluePrimary70, // Warna baru untuk anggota kader
                  //   menuName: 'Anggota Kader',
                  //   iconMenu: FluentIcons.people_team_24_filled,
                  //   colorIcon: bluePrimaryMain, // Sesuai dengan tema kebersamaan
                  //   onTap: () {
                  //     Navigator.pushNamed(context, REGISTER_ANGGOTA_KADER);
                  //   },
                  // ),
                ]);
              }

              return Container(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return GridView.builder(
                            shrinkWrap: true, // Membuat GridView menyesuaikan ukuran kontennya
                            physics: NeverScrollableScrollPhysics(), // Menghindari scrolling dalam GridView
                            itemCount: _menuItems.length,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              crossAxisSpacing: 32,
                              childAspectRatio: screenWidth / itemHeight, //0.65
                              mainAxisSpacing: 10,
                              maxCrossAxisExtent: 80,
                            ),
                            itemBuilder: (context, index) {
                              return _menuItems[index];
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      color: Colors.black26,
                      width: double.infinity,
                      height: 2,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: OrangTuaItem(
                              husband: 'Heri Dharmawan',
                              kk: '62080635261527',
                              wife: 'Dewi Ayu',
                              color: pinkPrimaryMain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: AnakItem(
                              color: goldPrimaryMain,
                              name: 'Muhammad Aril',
                              gender: 'Laki Laki',
                              month: 4,
                              nik: '362155482327263',
                              year: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: PengasuhItem(
                              color: purplePrimaryMain,
                              name: 'Siti Aisyah',
                              child: 'Sancaka Adi Sanjaya',
                              nik: '362155482327273',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: IbuHamilItem(
                              color: greenPrimaryMain,
                              month: 3,
                              name: 'Mentari Kumala Sari',
                              nik: '362155482327263',
                              week: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const ErrorServerScreen();
          },
        ),
      ),
    );
  }
}
