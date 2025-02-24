import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';

import 'package:puspadaya/app/feature/home/view/home.dart';
import 'package:puspadaya/app/feature/jadwal/index/view/jadwal.dart';
import 'package:puspadaya/app/feature/kunjungan/view/kunjungan.dart';
import 'package:puspadaya/app/feature/pengukuran/view/pengukuran.dart';
import 'package:puspadaya/app/feature/profile/view/profile.dart';
import 'package:puspadaya/config/theme/icon/home_menu_icon.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../route/route_name.dart';
import '../../../../utils/helper/helper_core.dart';
import '../../../model/current_user_model.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../alamat/bloc/alamatBloc/alamat_bloc.dart';
import '../bloc/userBloc/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => AlamatBloc(),
        ),
      ],
      child: const HomeWrapper(),
    );
  }
}

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _selectedIndex = 0;

  // List of widgets for each tab
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetCurrentUser());
    BlocProvider.of<AlamatBloc>(context).add(CheckAlamatEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlamatBloc, AlamatState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if(state is CheckAlamatPerbaruiDataState) {
          BlocProvider.of<AlamatBloc>(context).add(GetAlamatEvent());
        }
      },
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          debugPrint(state.toString());
          if (state is UserFailedState) {
            Navigator.pushReplacementNamed(context, LOGIN);
          }
        },
        builder: (context, state) {
          if (state is UserProccessState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: bluePrimaryMain,
                ),
              ),
            );
          }
          if (state is UserSuccessState) {
            final List<Widget> _widgetOptions = <Widget>[
              Home(
                currentUserModel: state.currentUserModel,
              ),
              const Pengukuran(),
              const KunjunganScreen(),
              const Jadwal(),
              Profile(
                currentUserModel: state.currentUserModel,
              ),
            ];

            return Scaffold(
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: DoubleBackToCloseApp(
                    snackBar: const SnackBar(
                        elevation: 0,
                        backgroundColor: bluePrimaryMain,
                        duration: Duration(seconds: 2),
                        content: Text(
                          "Tekan Lagi Untuk Keluar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        child: GNav(
                          activeColor: Colors.white,
                          iconSize: 24,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          duration: const Duration(milliseconds: 400),
                          tabBackgroundColor: bluePrimaryMain,
                          color: Colors.grey.shade500,
                          gap: 4,
                          tabBorderRadius: 12,
                          tabs: [
                            GButton(
                              padding: EdgeInsets.all(10),
                              icon: HomeMenuIcon.home,
                              iconSize: 22,
                              text: 'Home',
                            ),
                            GButton(
                              icon: HomeMenuIcon.measuring,
                              padding: EdgeInsets.all(10),
                              iconSize: 22,
                              text: 'Pengukuran',
                            ),
                            GButton(
                              padding: EdgeInsets.all(10),
                              icon: HomeMenuIcon.visitation,
                              iconSize: 22,
                              text: 'Kunjungan',
                            ),
                            GButton(
                              padding: EdgeInsets.all(10),
                              iconSize: 22,
                              icon: HomeMenuIcon.schadule,
                              text: 'Jadwal Posyandu',
                            ),
                            GButton(
                              padding: EdgeInsets.all(10),
                              iconSize: 22,
                              icon: HomeMenuIcon.profile,
                              text: 'Profile',
                            ),
                          ],
                          selectedIndex: _selectedIndex,
                          onTabChange: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                body: _widgetOptions[_selectedIndex]);
          }
          return const Scaffold(
            body: Center(
              child: ErrorServerScreen(),
            ),
          );
        },
      ),
    );
  }
}
