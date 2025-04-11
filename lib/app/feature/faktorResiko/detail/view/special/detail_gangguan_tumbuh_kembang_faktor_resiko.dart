import 'package:flutter/material.dart';
import '../../../../../../utils/api_utils/api_utils.dart';
import '../../../../../view/widget/appbar_widget.dart';
import '../../model/get_detail_riwayat_faktor_resiko_model.dart'
    as GetDetailRiwayatFaktorResiko;
import '../../../../../../config/theme/pallet_color.dart';

class DetailGangguanTumbuhKembangFaktorResiko extends StatelessWidget {
  final GetDetailRiwayatFaktorResiko.FaktorResiko data;
  const DetailGangguanTumbuhKembangFaktorResiko({
    super.key,
    required this.data,
  });

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
                  data.keterangan,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),

                // Gambar Pertanyaan
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    ApiUtils().urlGetPublicImage(data.gambar),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                SizedBox(height: 14),

                // Status Tumbuh Kembang
                Text(
                  'Status Gangguan Tumbuh Kembang :',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.pertanyaan.map((jawaban) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: greenPrimaryMain,
                          width: 1.5,
                        ),
                        color: greenPrimaryMain.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Text(
                        jawaban.pilihanPertanyaan.first.namaPilihan,
                        style: TextStyle(
                          fontSize: 16,
                          color: greenPrimaryMain,
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
