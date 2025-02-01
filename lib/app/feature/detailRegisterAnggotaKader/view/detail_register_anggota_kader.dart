import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/alert_dialog_widget.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';

class DetailRegisterAnggotaKader extends StatelessWidget {
  const DetailRegisterAnggotaKader({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailRegisterAnggotaKaderView();
  }
}

class DetailRegisterAnggotaKaderView extends StatefulWidget {
  const DetailRegisterAnggotaKaderView({super.key});

  @override
  State<DetailRegisterAnggotaKaderView> createState() =>
      _DetailRegisterAnggotaKaderViewState();
}

class _DetailRegisterAnggotaKaderViewState
    extends State<DetailRegisterAnggotaKaderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Anggota Kader',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipOval(
                    child: Image(
                      width: 100,
                      height: 100,
                      image: AssetImage(
                        userImageDefault,
                      ),
                      fit: BoxFit
                          .cover, // Mengatur agar gambar mengisi area lingkaran
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(20)),
                const Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Angaskaran Dian Ayu'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Nomor Telepon',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '081234567890'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'email@email.com'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Posisi',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Anggota Kader'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Posyandu',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Posyandu A'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Alamat',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: 'Banyuwangi'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: 'Kabat'),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: 'Kabat'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: 'Bunder'),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: InfoFieldWidget(text: '2'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: '14'),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Alamat Lengkap'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                ButtonPrimary(
                  color: goldPrimaryMain,
                  mainButtonMessage: 'Perbarui',
                  mainButton: () {
                    Navigator.pushNamed(context, UPDATE_REGISTER_ANGGOTA_KADER);
                  },
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                ButtonPrimary(
                  color: redPrimaryMain,
                  mainButtonMessage: 'Hapus',
                  mainButton: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogWidget(
                          title: 'Apakah Anda Yakin?',
                          message:
                              'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                          mainButton: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          image: imageDeleteItems,
                          mainButtonMessage: 'Iya, Hapus Anggoa Kader',
                          colorMainButton: redPrimaryMain,
                          cancelButton: () {
                            Navigator.pop(context);
                          },
                          cancelButtonMessage: 'Batalkan',
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
