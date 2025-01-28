import 'package:flutter/material.dart';

class DetailKunjunganIbuHamilOnGoing extends StatelessWidget {
  const DetailKunjunganIbuHamilOnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailKunjunganIbuHamilOnGoingView();
  }
}

class DetailKunjunganIbuHamilOnGoingView extends StatefulWidget {
  const DetailKunjunganIbuHamilOnGoingView({super.key});

  @override
  State<DetailKunjunganIbuHamilOnGoingView> createState() =>
      _DetailKunjunganIbuHamilOnGoingViewState();
}

class _DetailKunjunganIbuHamilOnGoingViewState
    extends State<DetailKunjunganIbuHamilOnGoingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Detail Kunjunga Ibu Hamil Berjalan',
        ),
      ),
    );
  }
}
