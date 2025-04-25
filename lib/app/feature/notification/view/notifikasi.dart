import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/icon/home_menu_icon.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/theme/shadow.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/screen/no_data_screen.dart';
import '../../../view/widget/pul_to_refresh.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/notification_bloc.dart';
import '../model/notification_response_model.dart';
import '../model/notifikasi_model.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: const NotifikasiView(),
    );
  }
}

class NotifikasiView extends StatefulWidget {
  const NotifikasiView({super.key});

  @override
  State<NotifikasiView> createState() => _NotifikasiViewState();
}

class _NotifikasiViewState extends State<NotifikasiView> {
  EasyRefreshController refreshController = EasyRefreshController(controlFinishRefresh: true);
  // // Contoh daftar notifikasi dengan timestamp
  // final List<NotifikasiModel> notifications = List.generate(
  //   1,
  //   (index) => NotifikasiModel(
  //     title: 'Notifikasi $index',
  //     message:
  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. $index',
  //     timestamp: DateTime.now().subtract(Duration(hours: index * 6)),
  //   ),
  // );
  @override
  void initState() {
    BlocProvider.of<NotificationBloc>(context).add(GetNotification());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Grouping notifikasi berdasarkan tanggal
    // final groupedNotifications = _groupByDate(notifications);

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
        child: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (context, state) {
            if(state is NotificationFailedState) {
              debugPrint(state.error);
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(
                  milliseconds: 600
                ),
                displayDuration: const Duration(
                  milliseconds: 2200
                ),
                reverseAnimationDuration: const Duration(
                  milliseconds: 300
                ),
                TopSnackbarWidget().error(state.error)
              );
            }
            if(state is NotificationTokenExpiredState) {
              
            }
          },
          builder: (context, state) {
            if(state is NotificationProcessState) {
              return Center(
                child: SpinKitThreeBounce(
                  color: bluePrimaryMain,
                  size: 50.0,
                ),
              );
            } 
            if(state is NotificationSuccessState) {
              if(state.notificationResponseModel.data!.isEmpty) {
                return Center(
                  child: const NoDataScreen(),
                );
              }
              return PullToRefreshWidget(
                onRefresh: () {
                  BlocProvider.of<NotificationBloc>(context).add(GetNotification());
                },
                refreshController: refreshController,
                child: ListView.builder(
                  itemCount: state.notificationResponseModel.data!.length,
                  itemBuilder:(context, index) {
                    return _buildNotification(state.notificationResponseModel.data![index]);
                    },
                ),
              );
            }
            return Center(
              child: const ErrorServerScreen()
            );
          }
        )
      ),
    );
  }

  Container _buildNotification(Data notification) {
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
              notification.judul,
              style: AppTextStyles.primaryTextMedium.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            // Text(
            //   DateFormat('HH:mm').format(notif.timestamp),
            //   style: AppTextStyles.primaryTextMedium.copyWith(
            //     color: Colors.black,
            //     fontSize: 12,
            //   ),
            // ),
          ],
        ),
        subtitle: Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          textAlign: TextAlign.left,
          notification.pesan,
          style: AppTextStyles.primaryTextNormal.copyWith(
            color: textSecondary1,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Fungsi untuk mengelompokkan notifikasi berdasarkan hari (Hari ini, Kemarin, dll.)
  Map<String, List<NotifikasiModel>> _groupByDate(List<NotifikasiModel> notifs) {
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
