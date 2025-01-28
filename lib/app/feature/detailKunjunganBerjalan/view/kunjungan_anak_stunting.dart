import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Detail Kunjungan Anak Stunting Berjalan',
        ),
      ),
    );
  }
}
