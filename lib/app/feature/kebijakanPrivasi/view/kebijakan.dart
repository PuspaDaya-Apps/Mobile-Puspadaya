import 'package:flutter/material.dart';

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
  final List<Map<String, String>> policy = [
    {
      "title": "Puspadaya",
      "desc":
          "Kami di PUSPADAYA berkomitmen untuk menjaga privasi dan keamanan data Anda. Kebijakan ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi Anda saat menggunakan aplikasi kami.",
    },
    {
      "title": "1. Pengumpulan Data",
      "desc":
          "Kami hanya mengumpulkan informasi yang diperlukan untuk menjalankan aplikasi, seperti data pribadi (misalnya, nama dan alamat email). Semua informasi yang kami kumpulkan digunakan untuk memberikan layanan terbaik bagi Anda.",
    },
    {
      "title": "2. Penggunaan Data",
      "desc":
          "Data yang kami kumpulkan digunakan untuk meningkatkan pengalaman pengguna dan memberikan layanan yang lebih baik. Kami tidak akan menjual atau membagikan data pribadi Anda kepada pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum.",
    },
    {
      "title": "3. Keamanan Data",
      "desc":
          "Kami menggunakan langkah-langkah keamanan yang sesuai untuk melindungi data Anda dari akses yang tidak sah, perubahan, atau pengungkapan.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
