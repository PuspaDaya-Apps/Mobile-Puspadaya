import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../authorization/bloc/blocAuthentication/authentication_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: const PrimaryAppBar(
        background: backgroundWhite10,
        title: "Profile",
        onBackPressed: null,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.calWidthMultiplier(24),
              vertical: SizeConfig.calHeightMultiplier(16)),
          child: SingleChildScrollView(
            child: Column(
              spacing: SizeConfig.calHeightMultiplier(24),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.calHeightMultiplier(24)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bluePrimaryMain,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Image(
                          width: 80,
                          height: 80,
                          image: AssetImage(
                            userImageDefault,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(12),
                        ),
                        Text(
                          'Ayu Dewi',
                          style: AppTextStyles.primaryTextSemibold.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '081234567890',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.calHeightMultiplier(24),
                      horizontal: SizeConfig.calWidthMultiplier(16)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30,
                        offset: const Offset(0, 0),
                        color: Colors.black.withValues(alpha: 0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    spacing: SizeConfig.calHeightMultiplier(26),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CardMenuProfile(
                        icon: FluentIcons.edit_person_24_regular,
                        title: "Ubah Profil",
                        description: "Perbarui informasi pribadi Anda.",
                        colorChevron: Colors.grey,
                        onTap: () {
                          Navigator.pushNamed(context, UBAH_PROFILE);
                        },
                      ),
                      CardMenuProfile(
                        icon: FluentIcons.lock_closed_key_24_regular,
                        title: "Ganti Kata Sandi",
                        description: "Perbarui kata sandi akun.",
                        colorChevron: Colors.grey,
                        onTap: () {
                          Navigator.pushNamed(context, GANTI_KATA_SANDI);
                        },
                      ),
                      CardMenuProfile(
                        icon: FluentIcons.channel_24_regular,
                        title: "Kebijakan Aplikasi",
                        description: "Lihat kebijakan dan ketentuan.",
                        colorChevron: Colors.grey,
                        onTap: () {
                          Navigator.pushNamed(context, KEBIJAKAN_PRIVASI);
                        },
                      ),
                      BlocListener<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                          if(state is LogoutSuccess) {
                            Navigator.pushReplacementNamed(context, LOGIN);
                          }
                          if(state is LogoutFailed) {
                            debugPrint(state.error);
                          }
                        },
                        child: CardMenuProfile(
                          icon: FluentIcons.arrow_exit_20_filled,
                          title: "Logout",
                          description: "Keluar dari akun Anda.",
                          colorChevron: Colors.red,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialogWidget(
                                  colorMainButton: Colors.red,
                                  image: exitImage,
                                  title: 'Konfirmasi Logout',
                                  message:
                                      'Apakah Anda yakin ingin keluar dari akun Anda?.',
                                  cancelButton: () {
                                    Navigator.of(context).pop();
                                  },
                                  mainButton: () {
                                    authenticationBloc.add(LogoutEvent());
                                  },
                                  cancelButtonMessage: 'Batalkan',
                                  mainButtonMessage: 'Iya, saya ingin keluar',
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardMenuProfile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color colorChevron;
  final VoidCallback onTap;

  const CardMenuProfile(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.colorChevron,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff9491DE).withValues(
                  alpha: 0.3,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  size: 22,
                  color: const Color(0xff9491DE),
                  icon,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    description,
                    style: AppTextStyles.secoundaryTextNormal.copyWith(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              color: colorChevron,
              FluentIcons.chevron_right_24_regular,
            ),
          ],
        ),
      ),
    );
  }
}
