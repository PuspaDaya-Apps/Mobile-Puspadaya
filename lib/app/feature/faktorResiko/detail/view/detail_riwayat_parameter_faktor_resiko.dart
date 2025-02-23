import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import '../model/get_detail_riwayat_faktor_resiko_model.dart'
    as GetDetailRiwayatFaktorResiko;

class DetailRiwayatParameterFaktorResiko extends StatelessWidget {
  final GetDetailRiwayatFaktorResiko.FaktorResiko data;
  const DetailRiwayatParameterFaktorResiko({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
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
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Jawaban Anda :',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                // List Jawaban
                Column(
                  children: data.pertanyaan[0].pilihanPertanyaan.map((jawaban) {
                    bool isSelected = data.pertanyaan[0].jawaban
                        .any((jwb) => jwb.pilihanPertanyaan.id == jawaban.id);

                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey,
                          width: 1.5,
                        ),
                        color: isSelected
                            ? Colors.blue.withOpacity(0.2)
                            : Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        jawaban.namaPilihan,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.blue : Colors.black,
                        ),
                      ),
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
}
