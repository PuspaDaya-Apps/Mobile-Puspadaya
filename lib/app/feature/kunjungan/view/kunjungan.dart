import 'package:flutter/material.dart';

class Kunjungan extends StatelessWidget {
  const Kunjungan({super.key});

  @override
  Widget build(BuildContext context) {
    return const KunjunganView();
  }
}

class KunjunganView extends StatefulWidget {
  const KunjunganView({super.key});

  @override
  State<KunjunganView> createState() => _KunjunganViewState();
}

class _KunjunganViewState extends State<KunjunganView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Kunjungan"),
        ),
      ),
    );
  }
}
