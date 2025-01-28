import 'package:flutter/material.dart';

class DetailKunjunganAnakTidakHadirNotStarted extends StatelessWidget {
  const DetailKunjunganAnakTidakHadirNotStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganAnakTidakHadirNotStartedView();
  }
}

class DetailKunjunganAnakTidakHadirNotStartedView extends StatefulWidget {
  const DetailKunjunganAnakTidakHadirNotStartedView({super.key});

  @override
  State<DetailKunjunganAnakTidakHadirNotStartedView> createState() =>
      _DetailKunjunganAnakTidakHadirNotStartedViewState();
}

class _DetailKunjunganAnakTidakHadirNotStartedViewState
    extends State<DetailKunjunganAnakTidakHadirNotStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Detail Kunjunga Anak Tidak Hadir Belum dimulai',
        ),
      ),
    );
  }
}
