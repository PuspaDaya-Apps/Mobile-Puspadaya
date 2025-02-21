import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/detailKunjunganBelumDiMulai/view/detail_kunjungan_belum_selesai_anak_tidak_hadir.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../config/theme/text_style.dart';
import '../../../model/detailListKunjungan_model.dart';
import '../../../view/widget/daftar_kunjungan_detail_item.dart';
import '../../createKunjunganStunting/view/timer_kunjungan_stunting.dart';
import '../../kunjungan/model/Kunjungan.dart';
import 'detail_kunjungan_belum_selesai_anak_stunting.dart';

class DetailKunjunganAnakStuntingNotStarted extends StatelessWidget {
  const DetailKunjunganAnakStuntingNotStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganAnakStuntingNotStartedView();
  }
}

class DetailKunjunganAnakStuntingNotStartedView extends StatefulWidget {
  const DetailKunjunganAnakStuntingNotStartedView({super.key});

  @override
  State<DetailKunjunganAnakStuntingNotStartedView> createState() =>
      _DetailKunjunganAnakStuntingNotStartedViewState();
}

class _DetailKunjunganAnakStuntingNotStartedViewState
    extends State<DetailKunjunganAnakStuntingNotStartedView> {
  List<DetailListkunjunganModel> listDaftarKunjungan = [
    DetailListkunjunganModel(
      nik: "3621554011700112",
      id: '1',
      name: 'Darmana Mangunsong',
      status: Status.selesai,
      distance: '2,1',
    ),
    DetailListkunjunganModel(
      nik: "3621554011003392",
      id: '2',
      name: 'Danuja Jailani',
      status: Status.selesai,
      distance: '1,9',
    ),
    DetailListkunjunganModel(
      nik: "3621554011225512",
      id: '3',
      name: 'Jane Winarsih',
      status: Status.selesai,
      distance: '3,5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Filter the ongoing and completed visits
    List<DetailListkunjunganModel> ongoingVisits = listDaftarKunjungan
        .where((kunjungan) => kunjungan.status == Status.selesai)
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
                              return DetailKunjunganBelumSelesaiAnakStunting();
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
