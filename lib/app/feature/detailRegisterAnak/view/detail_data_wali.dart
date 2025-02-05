import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../view/widget/info_field_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../../updateRegisterAnak/view/update_register_data_wali.dart';

class DetailDataWali extends StatelessWidget {
  DetailDataWali({super.key});
  final List<String> disabilitas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Data Pengasuh',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 1.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Status Hubungan Dengan Anak',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Nenek'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Nomor Kartu Keluarga',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '1273638363718819271927'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'NIK',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '35647362544958499'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Siti Aisyah'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Tempat Lahir',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(text: 'Jakarta'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Tanggal Lahir',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.calHeightMultiplier(8),
                          ),
                          InfoFieldWidget(text: '01/04/1969'),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      child: InfoFieldWidget(text: 'Jawa Timur'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: 'Banyuwangi'),
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
                      child: InfoFieldWidget(text: 'Banyuwangi'),
                    ),
                    Expanded(
                      child: InfoFieldWidget(text: 'Rogojampi'),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'Lemabang Kulon'),
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
                InfoFieldWidget(
                    text: 'Jl. Jendaral Sudirman, Gg. Jembatan Ayu'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Nomor Telepon (WA Aktif)',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: '082123141232'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                const Text(
                  'Golongan Darah',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(8),
                ),
                InfoFieldWidget(text: 'A+'),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                disabilitas != null && disabilitas.isNotEmpty
                    ? ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: EdgeInsets.zero,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        title: Text(
                          'Disabilitas',
                          style: AppTextStyles.primaryTextMedium.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        children: [
                          ...disabilitas.map(
                            (e) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4, bottom: 4),
                                  child: Text(
                                    e,
                                    style: AppTextStyles.primaryTextMedium
                                        .copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(16),
                ),
                ButtonPrimary(
                  color: goldPrimaryMain,
                  mainButtonMessage: 'Perbarui',
                  mainButton: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UpdateRegisterDataWali();
                        },
                      ),
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
