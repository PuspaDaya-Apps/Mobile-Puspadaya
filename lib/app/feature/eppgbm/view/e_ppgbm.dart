import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

class EPPGBM extends StatelessWidget {
  const EPPGBM({super.key});

  @override
  Widget build(BuildContext context) {
    return const EPPGBMView();
  }
}

class EPPGBMView extends StatefulWidget {
  const EPPGBMView({super.key});

  @override
  State<EPPGBMView> createState() => _EPPGBMViewState();
}

class _EPPGBMViewState extends State<EPPGBMView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Laporan E-PPGBM',
        background: Colors.white,
        onBackPressed: (){
          Navigator.pop(context);
        },
      ),
      // body: SafeArea(child: ),
    );
  }
}
