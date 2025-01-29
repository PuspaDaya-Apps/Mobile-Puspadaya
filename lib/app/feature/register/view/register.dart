import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/screen_config/image_config.dart';
import '../../../view/widget/MenuHomeItems.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterView();
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final List<Widget> _menuItems = [
    HomeMenuItems(
      menuName: 'Orang Tua',
      iconMenu: Icons
          .family_restroom, // Ikon pengguna umum, lebih representatif untuk orang tua
      colorIcon: Colors.blue.shade700,
      onTap: () {},
    ),
    HomeMenuItems(
      menuName: 'Anak',
      iconMenu: FontAwesomeIcons
          .child, // Ikon anak kecil, lebih sesuai untuk menu ini
      colorIcon: Colors.blue.shade700,
      onTap: () {},
    ),
    HomeMenuItems(
      menuName: 'Pengasuh',
      iconMenu: FontAwesomeIcons
          .personBreastfeeding, // Simbol bantuan, cocok untuk pengasuh
      colorIcon: Colors.blue.shade700,
      onTap: () {},
    ),
    HomeMenuItems(
      menuName: 'Ibu Hamil',
      iconMenu:
          FontAwesomeIcons.personPregnant, // Ikon ibu hamil, lebih relevan
      colorIcon: Colors.red.shade300,
      onTap: () {},
    ),
    HomeMenuItems(
      menuName: 'Anggota Kader',
      iconMenu: FluentIcons
          .people_team_24_filled, // Simbol grup, cocok untuk anggota kader
      colorIcon: greenPrimary50,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap:
                        true, // Membuat GridView menyesuaikan ukuran kontennya
                    physics:
                        NeverScrollableScrollPhysics(), // Menghindari scrolling dalam GridView
                    itemCount: _menuItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 32,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 0,
                      maxCrossAxisExtent: 80,
                    ),
                    itemBuilder: (context, index) {
                      return _menuItems[index];
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
