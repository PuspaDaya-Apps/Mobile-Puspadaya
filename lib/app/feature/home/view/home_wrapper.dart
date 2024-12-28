import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:puspadaya/app/feature/home/view/home.dart';
import 'package:puspadaya/app/feature/jadwal/view/jadwal.dart';
import 'package:puspadaya/app/feature/kunjungan/view/kunjungan.dart';
import 'package:puspadaya/app/feature/pengukuran/view/pengukuran.dart';
import 'package:puspadaya/app/feature/profile/view/profile.dart';
import 'package:puspadaya/config/theme/icon/home_menu_icon.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _selectedIndex = 0;

  // List of widgets for each tab
  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Pengukuran(),
    Kunjungan(),
    Jadwal(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: GNav(
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: baseColor,
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
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
