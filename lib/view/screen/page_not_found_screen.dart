import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text('page not found'),
      ),
    );
  }
}