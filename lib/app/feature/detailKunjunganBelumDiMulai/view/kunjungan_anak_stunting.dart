import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Detail Kunjungan Anak Stunting belum dimulai',
        ),
      ),
    );
  }
}
