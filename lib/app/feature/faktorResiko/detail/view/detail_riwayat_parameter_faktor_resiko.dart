import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../utils/api_utils/api_utils.dart';
import '../../../../../utils/logger/logger.dart';
import '../model/get_detail_riwayat_faktor_resiko_model.dart'
    as GetDetailRiwayatFaktorResiko;
import 'package:collection/collection.dart';

import '../model/get_detail_riwayat_faktor_resiko_model.dart';

class DetailRiwayatParameterFaktorResiko extends StatefulWidget {
  final GetDetailRiwayatFaktorResiko.FaktorResiko data;
  const DetailRiwayatParameterFaktorResiko({super.key, required this.data});

  @override
  State<DetailRiwayatParameterFaktorResiko> createState() =>
      _DetailRiwayatParameterFaktorResikoState();
}

class _DetailRiwayatParameterFaktorResikoState
    extends State<DetailRiwayatParameterFaktorResiko> {
  late PageController _pageController;
  bool isMultiplePertanyaan = false;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    isMultiplePertanyaan = widget.data.pertanyaan.length > 1;
    logger.d('nama faktor resiko = ${widget.data.namaFaktorResiko}');
    super.initState();
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: widget.data.namaFaktorResiko,
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: isMultiplePertanyaan
          ? Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                spacing: _currentPage > 0 ? 12 : 0,
                children: [
                  _currentPage > 0
                      ? Expanded(
                          child: ButtonPrimary(
                            color: bluePrimaryMain,
                            mainButtonMessage: 'Sebelumnya',
                            mainButton: () {
                              _navigateToPage(_currentPage - 1);
                            },
                          ),
                        )
                      : SizedBox.shrink(),
                  Expanded(
                    child: ButtonPrimary(
                      color: greenPrimaryMain,
                      mainButtonMessage:
                          _currentPage == widget.data.pertanyaan.length - 1
                              ? 'Selesai'
                              : 'Selanjutnya',
                      mainButton: () {
                        if (_currentPage < widget.data.pertanyaan.length - 1) {
                          _navigateToPage(_currentPage + 1);
                        } else {
                          // Tambahkan logika untuk tombol Selesai jika diperlukan'
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          : null,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: widget.data.pertanyaan.length == 1
            ? SingleChildScrollView(
                child: _buildSingleQuestion(0),
              )
            : PageView.builder(
                itemCount: widget.data.pertanyaan.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildSingleQuestion(index);
                },
              ),
      ),
    );
  }

  Widget _buildSingleQuestion(int index) {
    final pertanyaan = widget.data.pertanyaan[index];

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Judul Pertanyaan
            Text(
              pertanyaan.namaPertanyaan,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // 🔹 Gambar Pertanyaan (Jika Ada)
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Ubah sesuai kebutuhan
              child: Image.network(
                ApiUtils().urlGetPublicImage(
                  widget.data.namaFaktorResiko == "Kurangnya pengetahuan gizi"
                      ? pertanyaan.image!
                      : widget.data.gambar,
                ),
                fit: BoxFit.cover, // Agar gambar terisi dengan baik
                width: double.infinity, // Sesuaikan dengan desain
                height: 200, // Sesuaikan dengan desain
              ),
            ),
            SizedBox(height: 14),
            // 🔹 Label Jawaban
            Text(
              'Jawaban Anda :',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),

            // 🔹 List Semua Jawaban Pilihan
            Column(
              children: pertanyaan.pilihanPertanyaan.map((opsi) {
                // Cek apakah opsi ini sudah dipilih oleh user
                final Jawaban? jawabanUser =
                    pertanyaan.jawaban.firstWhereOrNull(
                  (jwb) => jwb.pilihanPertanyaan.id == opsi.id,
                );

                final bool isSelected = jawabanUser != null;

                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? greenPrimaryMain : Colors.grey,
                      width: 1.5,
                    ),
                    color: isSelected
                        ? greenPrimaryMain.withOpacity(0.2)
                        : Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Nama Jawaban Pilihan
                      Text(
                        opsi.namaPilihan,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? greenPrimaryMain : Colors.black,
                        ),
                      ),

                      // 🔹 Jawaban Lainnya (Jika Ada)
                      if (isSelected &&
                          jawabanUser!.jawabanText != null &&
                          jawabanUser.jawabanText!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Jawaban lainnya: ${jawabanUser.jawabanText}',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
