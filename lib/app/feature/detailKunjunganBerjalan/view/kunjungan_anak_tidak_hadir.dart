import 'package:flutter/material.dart';

class DetailKunjunganAnakTidakHadirOnGoing extends StatelessWidget {
  const DetailKunjunganAnakTidakHadirOnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganAnakTidakHadirOnGoingView();
  }
}

class DetailKunjunganAnakTidakHadirOnGoingView extends StatefulWidget {
  const DetailKunjunganAnakTidakHadirOnGoingView({super.key});

  @override
  State<DetailKunjunganAnakTidakHadirOnGoingView> createState() =>
      _DetailKunjunganAnakTidakHadirOnGoingViewState();
}

class _DetailKunjunganAnakTidakHadirOnGoingViewState
    extends State<DetailKunjunganAnakTidakHadirOnGoingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Detail Kunjunga Anak Tidak Hadir Berjalan',
        ),
      ),
    );
  }
}
