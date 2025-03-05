import 'package:flutter/material.dart';

import '../../../../../../config/theme/pallet_color.dart';
import '../../../../../view/widget/appbar_widget.dart';
import '../../model/get_detail_riwayat_faktor_resiko_model.dart'
    as GetDetailRiwayatFaktorResiko;

class DetailImunisasiFaktorResiko extends StatelessWidget {
  final GetDetailRiwayatFaktorResiko.FaktorResiko data;
  const DetailImunisasiFaktorResiko({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, String>>> vaksinSchedule =
        generateVaksinSchedule(data.pertanyaan[0].pilihanPertanyaan);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: data.namaFaktorResiko,
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Pertanyaan
                Text(
                  data.pertanyaan[0].namaPertanyaan,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),

                // Gambar Pertanyaan
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    data.gambar,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://th.bing.com/th/id/OIP.EA_ncoNg_zqJTBrdpe8rvgHaE8?rs=1&pid=ImgDetMain',
                        fit: BoxFit.cover, // Agar gambar terisi dengan baik
                        width: double.infinity, // Sesuaikan dengan desain
                        height: 200, // Sesuaikan deng
                      );
                    },
                  ),
                ),
                SizedBox(height: 12),
                Text(
                    '0-24 jam (Hb0 untuk mencegah Hepatitis B dan Kanker Hati)'),
                SizedBox(height: 4),
                Text(
                    '1 bulan (BCG dan OPV 1 untuk mencegah Tuberkulosis dan Polio)'),
                SizedBox(height: 4),
                Text(
                    '2 bulan (DPT-HB-HIB1, OPV2, PCV1, RV1 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Polio, Meningitis (Radang selaput otak), Pneumonia dan Diare)'),
                SizedBox(height: 4),
                Text(
                    '3 bulan (DPT-HB-HIB2, OPV3, PCV2, RV2 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Polio, Meningitis (Radang selaput otak), Pneumonia dan Diare)'),
                SizedBox(height: 4),
                Text(
                    '4 bulan (DPT-HB-HIB3, OPV4, PCV3, IPV1, RV3 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Polio, Meningitis (Radang selaput otak), Pneumonia dan Diare)'),
                SizedBox(height: 4),
                Text(
                    '9 bulan (Campak Rubela 1, IPV2  untuk mencegah campak, Rubela dan Polio)'),
                SizedBox(height: 4),
                Text('12 bulan (PCV3 untuk mencegah Pneumonia)'),
                SizedBox(height: 4),
                Text(
                    '19 bulan (DPT-HB-HIB4, Campak Rubela 2 untuk mencegah Difteri, Pertusis, Hepatitis B dan kanker hati, Pneumonia, Campak, Rubela)'),
                SizedBox(height: 16),
                Text(
                  'Jawaban Anda :',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),

                // Menampilkan jawaban yang dikategorikan
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: vaksinSchedule.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Column(
                          children: entry.value.map((vaksin) {
                            bool isSelected = data.pertanyaan[0].jawaban.any(
                                (jwb) =>
                                    jwb.pilihanPertanyaan.id == vaksin['id']);

                            return Container(
                              margin: EdgeInsets.only(bottom: 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? greenPrimaryMain
                                      : Colors.grey,
                                  width: 1.5,
                                ),
                                color: isSelected
                                    ? greenPrimaryMain.withOpacity(0.2)
                                    : Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Text(
                                vaksin['vaksin']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected
                                      ? greenPrimaryMain
                                      : Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, List<Map<String, String>>> generateVaksinSchedule(
      List<GetDetailRiwayatFaktorResiko.PilihanPertanyaan> pilihan) {
    Map<String, List<Map<String, String>>> vaksinSchedule = {};

    for (var item in pilihan) {
      String namaPilihan = item.namaPilihan;
      String uuid = item.id;
      String usia = categorizeVaccineAge(namaPilihan);

      if (!vaksinSchedule.containsKey(usia)) {
        vaksinSchedule[usia] = [];
      }

      vaksinSchedule[usia]!.add({'id': uuid, 'vaksin': namaPilihan});
    }
    return vaksinSchedule;
  }

  String categorizeVaccineAge(String vaksinName) {
    if (vaksinName.contains('HB0')) return '0-24 Jam';
    if (vaksinName.contains('BCG') || vaksinName.contains('OPV 1'))
      return '1 Bulan';
    if (vaksinName.contains('DPT-HB-HIB1') ||
        vaksinName.contains('OPV2') ||
        vaksinName.contains('PCV1') ||
        vaksinName.contains('RV1')) return '2 Bulan';
    if (vaksinName.contains('DPT-HB-HIB2') ||
        vaksinName.contains('OPV3') ||
        vaksinName.contains('PCV2') ||
        vaksinName.contains('RV2')) return '3 Bulan';
    if (vaksinName.contains('DPT-HB-HIB3') ||
        vaksinName.contains('OPV4') ||
        vaksinName.contains('PCV3') ||
        vaksinName.contains('IPV1') ||
        vaksinName.contains('RV3')) return '4 Bulan';
    if (vaksinName.contains('Campak Rubela 1') || vaksinName.contains('IPV2'))
      return '9 Bulan';
    if (vaksinName.contains('PCV3')) return '12 Bulan';
    if (vaksinName.contains('DPT-HB-HIB4') ||
        vaksinName.contains('Campak Rubela 2')) return '19 Bulan';
    return 'Lainnya';
  }
}
