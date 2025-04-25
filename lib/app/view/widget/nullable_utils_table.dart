import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class NullableUtilsTable extends StatelessWidget {
  final String? value;

  const NullableUtilsTable({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final isEmpty = value == null || value!.isEmpty;

    return isEmpty
        ? Container(
            // width: 20,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: redPrimary50, // Pastikan redPrimary50 sudah didefinisikan
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: const Text(
                '-',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        : Text(value!);
  }
}
