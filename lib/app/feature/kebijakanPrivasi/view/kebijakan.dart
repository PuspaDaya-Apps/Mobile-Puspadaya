import 'package:flutter/material.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../utils/constant/constanst.dart';

class KebijakanPrivasi extends StatelessWidget {
  const KebijakanPrivasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const KebijakanPrivasiView();
  }
}

class KebijakanPrivasiView extends StatefulWidget {
  const KebijakanPrivasiView({super.key});

  @override
  State<KebijakanPrivasiView> createState() => _KebijakanPrivasiViewState();
}

class _KebijakanPrivasiViewState extends State<KebijakanPrivasiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        title: const Text(
          "Kebijakan Privasi",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...policy.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          item['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['desc'] ?? '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Jika Anda memiliki pertanyaan tentang kebijakan privasi ini, silakan hubungi kami di ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: "[puspadaya.id@gmail.com || 0813348765434]",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
