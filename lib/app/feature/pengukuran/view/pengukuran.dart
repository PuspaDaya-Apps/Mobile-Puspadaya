import 'package:flutter/material.dart';

class Pengukuran extends StatelessWidget {
  const Pengukuran({super.key});

  @override
  Widget build(BuildContext context) {
    return PengukuranView();
  }
}

class PengukuranView extends StatefulWidget {
  const PengukuranView({super.key});

  @override
  State<PengukuranView> createState() => _PengukuranViewState();
}

class _PengukuranViewState extends State<PengukuranView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Pengukuran"),
        ),
      ),
    );
  }
}
