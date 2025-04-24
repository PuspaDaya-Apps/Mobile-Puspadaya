import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/icon/home_menu_icon.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../config/theme/shadow.dart';
import '../model/notifikasi_model.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotifikasiView();
  }
}

class NotifikasiView extends StatefulWidget {
  const NotifikasiView({super.key});

  @override
  State<NotifikasiView> createState() => _NotifikasiViewState();
}

class _NotifikasiViewState extends State<NotifikasiView> {
  // Contoh daftar notifikasi dengan timestamp
  final List<NotifikasiModel> notifications = List.generate(
    1,
    (index) => NotifikasiModel(
      title: 'Notifikasi $index',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. $index',
      timestamp: DateTime.now().subtract(Duration(hours: index * 6)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Grouping notifikasi berdasarkan tanggal
    final groupedNotifications = _groupByDate(notifications);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Notifikasi',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        // child: NotificationEmpty(),
        child: ListView(
          children: groupedNotifications.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Grup (Hari ini, Kemarin, dll.)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    entry.key,
                    style: AppTextStyles.primaryTextSemibold.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                // List Notifikasi di dalam Grup
                ...entry.value
                    .map((notifikasi) => _buildNotification(notifikasi)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Container _buildNotification(NotifikasiModel notif) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: shadowSm,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: greenPrimary90,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              HomeMenuIcon.home,
              color: greenPrimaryMain,
            ),
          ),
        ),
        // visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notif.title,
              style: AppTextStyles.primaryTextMedium.copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              DateFormat('HH:mm').format(notif.timestamp),
              style: AppTextStyles.primaryTextMedium.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
        subtitle: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          notif.message,
          style: AppTextStyles.primaryTextNormal.copyWith(
            color: textSecondary1,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // Fungsi untuk mengelompokkan notifikasi berdasarkan hari (Hari ini, Kemarin, dll.)
  Map<String, List<NotifikasiModel>> _groupByDate(
      List<NotifikasiModel> notifs) {
    Map<String, List<NotifikasiModel>> groupedData = {};
    DateTime now = DateTime.now();

    for (var notif in notifs) {
      String category;

      // Hitung selisih hari dari sekarang
      int diffDays = now.difference(notif.timestamp).inDays;

      if (diffDays == 0) {
        category = "Hari ini";
      } else if (diffDays == 1) {
        category = "Kemarin";
      } else if (diffDays < 7) {
        category = "Minggu ini";
      } else {
        category = DateFormat('dd MMM yyyy').format(notif.timestamp);
      }

      if (!groupedData.containsKey(category)) {
        groupedData[category] = [];
      }
      groupedData[category]!.add(notif);
    }

    return groupedData;
  }
}

class NotificationEmpty extends StatelessWidget {
  const NotificationEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.bell,
                size: 100,
                color: textPrimary10,
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Sepertinya belum ada notifikasi untuk saat ini.',
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    color: textPrimary10,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
