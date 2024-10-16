import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget{
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Example view')
    );
  }
}