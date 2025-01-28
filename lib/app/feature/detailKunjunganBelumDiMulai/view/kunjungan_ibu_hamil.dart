import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Detail Kunjunga Ibu Hamil Belum dimulai',
        ),
      ),
    );
  }
}
