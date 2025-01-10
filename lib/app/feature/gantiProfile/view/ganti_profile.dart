import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar.dart';

class GantiProfile extends StatelessWidget {
  const GantiProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const GantiProfileView();
  }
}

class GantiProfileView extends StatefulWidget {
  const GantiProfileView({super.key});

  @override
  State<GantiProfileView> createState() => _GantiProfileViewState();
}

class _GantiProfileViewState extends State<GantiProfileView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Ubah Profile",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
