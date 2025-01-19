import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

class DetailPengukuranBalita extends StatelessWidget {
  const DetailPengukuranBalita({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPengukuranBalitaView();
  }
}

class DetailPengukuranBalitaView extends StatefulWidget {
  const DetailPengukuranBalitaView({super.key});

  @override
  State<DetailPengukuranBalitaView> createState() =>
      _DetailPengukuranBalitaViewState();
}

class _DetailPengukuranBalitaViewState
    extends State<DetailPengukuranBalitaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Pengukuran Anak',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(),
      )),
    );
  }
}
