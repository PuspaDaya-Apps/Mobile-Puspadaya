import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../config/theme/pallet_color.dart';
import '../../../config/theme/shadow.dart';
import 'primary_button_widget.dart';

class ParameterFaktorResikoItem extends StatelessWidget {
  const ParameterFaktorResikoItem({
    super.key,
    required this.status,
    required this.judul,
    required this.keterangan,
    required this.terakhirDiisi,
    required this.onTap,
    required this.isDone,
    required this.isRiwayat,
  });

  final bool isDone;
  final bool isRiwayat;
  final bool status;
  final VoidCallback onTap;
  final String judul;
  final String keterangan;
  final DateTime? terakhirDiisi;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: shadowSm,
      ),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        leading: status
            ? Icon(
                FontAwesomeIcons.circleCheck,
                color: greenPrimaryMain,
                size: 24,
              )
            : Icon(
                FontAwesomeIcons.circleExclamation, // Font Awesome icon
                color: goldPrimaryMain, // Icon color
                size: 24,
              ),
        title: Text(judul),
        childrenPadding:
            EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16),
        children: [
          Container(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Text(
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              'Terakhir Diisi : ${terakhirDiisi != null ? DateFormat('d MMMM y', 'id_ID').format(terakhirDiisi!) : ' '}',
            ),
          ),
          SizedBox(height: 8),
          Container(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Text(
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              'Keterangan : ${keterangan}',
            ),
          ),
          SizedBox(height: 16),
          !isRiwayat
              ? !isDone
                  ? ButtonPrimary(
                      color: greenPrimaryMain,
                      mainButton: onTap,
                      mainButtonMessage: 'Lakukan Pendataan',
                    )
                  : Container()
              : ButtonPrimary(
                  color: greenPrimaryMain,
                  mainButton: onTap,
                  mainButtonMessage: 'Detail Jawaban',
                )
        ],
      ),
    );
  }
}
