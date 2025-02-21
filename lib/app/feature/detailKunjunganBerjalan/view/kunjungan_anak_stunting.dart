import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/detailKunjunganBelumDiMulai/view/detail_kunjungan_belum_selesai_anak_tidak_hadir.dart';
import 'package:puspadaya/app/feature/detailKunjunganBerjalan/view/detail_kunjungan_berjalan_anak_stunting.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/theme/text_style.dart';
import '../../../model/detailListKunjungan_model.dart';
import '../../../view/widget/daftar_kunjungan_detail_item.dart';
import '../../kunjunganAnakStunting/detailCreateKunjungan/view/timer_kunjungan_stunting.dart';
import '../../kunjungan/model/Kunjungan.dart';

class DetailKunjunganAnakStuntingOnGoing extends StatelessWidget {
  const DetailKunjunganAnakStuntingOnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganAnakStuntingOnGoingView();
  }
}

class DetailKunjunganAnakStuntingOnGoingView extends StatefulWidget {
  const DetailKunjunganAnakStuntingOnGoingView({super.key});

  @override
  State<DetailKunjunganAnakStuntingOnGoingView> createState() =>
      _DetailKunjunganAnakStuntingOnGoingViewState();
}

class _DetailKunjunganAnakStuntingOnGoingViewState
    extends State<DetailKunjunganAnakStuntingOnGoingView> {
  List<DetailListkunjunganModel> listDaftarKunjungan = [
    DetailListkunjunganModel(
      nik: "3621009211732625",
      id: '1',
      name: 'Viktor Sitompul',
      status: Status.berjalan,
      distance: '2,1',
    ),
    DetailListkunjunganModel(
      nik: "3621009361732625",
      id: '2',
      name: 'Asman Latupono',
      status: Status.berjalan,
      distance: '2,7',
    ),
    DetailListkunjunganModel(
      nik: "3621112781732625",
      id: '3',
      name: 'Puti Mulyani',
      status: Status.selesai,
      distance: '1,3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Filter the ongoing and completed visits
    List<DetailListkunjunganModel> ongoingVisits = listDaftarKunjungan
        .where((kunjungan) => kunjungan.status == Status.berjalan)
        .toList();
    List<DetailListkunjunganModel> completedVisits = listDaftarKunjungan
        .where((kunjungan) => kunjungan.status == Status.selesai)
        .toList();

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Kunjungan Anak Stunting',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bluePrimaryMain,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Jarak",
                                style:
                                    AppTextStyles.secoundaryTextMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "2.5",
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 28,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "KM",
                                style:
                                    AppTextStyles.secoundaryTextMedium.copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 38,
                        color: Colors.white,
                        width: 2,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Waktu",
                                style:
                                    AppTextStyles.secoundaryTextMedium.copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "00.00",
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Kunjungan Berjalan
                Column(
                  children: ongoingVisits.map((kunjungan) {
                    return DaftarKunjunganDetailItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TimerKunjunganStunting();
                            },
                          ),
                        );
                      },
                      detailKunjungan: kunjungan,
                      status: kunjungan.status,
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'Kunjungan Selesai',
                      style: AppTextStyles.primaryTextMedium.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Kunjungan Selesai
                Column(
                  children: completedVisits.map((kunjungan) {
                    return DaftarKunjunganDetailItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailKunjunganBerjalanAnakStunting();
                            },
                          ),
                        );
                      },
                      detailKunjungan: kunjungan,
                      status: kunjungan.status,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
