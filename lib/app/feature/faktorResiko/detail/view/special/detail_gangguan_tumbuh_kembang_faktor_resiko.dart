import 'package:flutter/material.dart';
import '../../../../../view/widget/appbar_widget.dart';
import '../../model/get_detail_riwayat_faktor_resiko_model.dart'
    as GetDetailRiwayatFaktorResiko;

class DetailGangguanTumbuhKembangFaktorResiko extends StatelessWidget {
   final GetDetailRiwayatFaktorResiko.FaktorResiko data;// Add 'final' to make it immutable
  const DetailGangguanTumbuhKembangFaktorResiko(
      {super.key, required this.data});

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
                    data.gambar,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Status Gangguan Tumbuh Kembang :',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Status Stunting : ',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      data.gangguanTumbuhKembang!.statusStunting,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500, 
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status Wasting : ',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      data.gangguanTumbuhKembang!.statusWasting,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500, 
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status UnderWeight : ',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      data.gangguanTumbuhKembang!.statusUnderweight,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500, 
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
