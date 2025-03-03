import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../config/theme/text_style.dart';
import '../../../model/detailListKunjungan_model.dart';
import '../../../view/widget/daftar_kunjungan_detail_item.dart';
import '../../creteKunjunganIbuHamil/view/timer_kunjungan_ibu_hamil.dart';
import '../../kunjungan/model/Kunjungan.dart';
import 'detail_kunjungan_belum_selesai_ibu_hamil.dart';

class DetailKunjunganIbuHamilNotStarted extends StatelessWidget {
  const DetailKunjunganIbuHamilNotStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganIbuHamilNotStartedView();
  }
}

class DetailKunjunganIbuHamilNotStartedView extends StatefulWidget {
  const DetailKunjunganIbuHamilNotStartedView({super.key});

  @override
  State<DetailKunjunganIbuHamilNotStartedView> createState() =>
      _DetailKunjunganIbuHamilNotStartedViewState();
}

class _DetailKunjunganIbuHamilNotStartedViewState
    extends State<DetailKunjunganIbuHamilNotStartedView> {
  List<DetailListkunjunganModel> listDaftarKunjungan = [
    DetailListkunjunganModel(
      nik: "3621554012893625",
      id: '1',
      name: 'Raisa Lailasari',
      status: Status.belumDiMulai,
      distance: '2,3',
    ),
    DetailListkunjunganModel(
      nik: "3612904411732625",
      id: '2',
      name: 'Titi Yuniar',
      status: Status.belumDiMulai,
      distance: '0,9',
    ),
    DetailListkunjunganModel(
      nik: "3621511002932625",
      id: '3',
      name: 'Kasiyah Lestari',
      status: Status.selesai,
      distance: '2,8',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Filter the ongoing and completed visits
    List<DetailListkunjunganModel> ongoingVisits = listDaftarKunjungan
        .where((kunjungan) => kunjungan.status == Status.belumDiMulai)
        .toList();
    List<DetailListkunjunganModel> completedVisits = listDaftarKunjungan
        .where((kunjungan) => kunjungan.status == Status.selesai)
        .toList();

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Kunjungan',
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
                              return TimerKunjunganIbuHamil();
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
                        logger.d('detail kunjungan belum selesai ibu hamil');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailKunjunganBelumSelesaiIbuHamil();
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
